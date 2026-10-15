import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;

import 'http.dart';
import 'json.dart';
import 'models.dart';

/// Receives a decoded notification from an unnamed or `message` SSE event.
typedef NotificationCallback = void Function(NotificationEvent event);

/// Idempotently cancels a subscription, including pending reconnect work.
typedef Unsubscribe = void Function();

/// Callbacks and reconnect settings for native notification subscriptions.
class SubscribeOptions {
  /// Called for the server's JSON `connected` event, not merely HTTP headers.
  final void Function()? onConnect;

  /// Called when a handshake fails or the stream ends, not on explicit cancel.
  final void Function()? onDisconnect;

  /// Receives notification parsing/dispatch failures, not connection failures.
  ///
  /// Errors can include raw event data; avoid logging them unredacted.
  final void Function(Object error)? onError;

  /// Whether to reconnect after disconnect; defaults to true.
  final bool? autoReconnect;

  /// Fixed reconnect delay in milliseconds; defaults to 3000.
  final num? reconnectDelay;

  /// Creates subscription settings without opening a connection.
  const SubscribeOptions({
    this.onConnect,
    this.onDisconnect,
    this.onError,
    this.autoReconnect,
    this.reconnectDelay,
  });
}

/// Native Server-Sent Events and server-side Web Push registration.
///
/// Each SSE subscription owns a separate native transport without the main
/// HTTP client's timeout or retry policy. Push registration uses the shared
/// HTTP client. No native notification-permission or FCM/APNs flow is provided.
class NotificationsClient {
  final HttpClient _http;
  final Set<_NotificationSubscription> _subscriptions = {};
  bool _closed = false;

  /// Uses [http] for resource calls but does not take ownership of it.
  NotificationsClient(HttpClient http) : _http = http;

  /// Opens a real SSE connection, passing the same query authentication as JS.
  /// The returned function cancels connecting, connected and reconnecting work.
  ///
  /// Credentials are included in query parameters to match JavaScript; do not
  /// log stream URLs. Only status 200 with `text/event-stream` is accepted.
  /// Connection failures call `onDisconnect` and reconnect by default; they
  /// do not call `onError`. Cancellation prevents later reconnects and events.
  /// No last-event-ID replay is performed, so reconnects can miss events.
  Unsubscribe subscribe(
    String userId,
    NotificationCallback callback, [
    SubscribeOptions options = const SubscribeOptions(),
  ]) {
    if (_closed) throw StateError('NotificationsClient is closed');
    late final _NotificationSubscription subscription;
    subscription = _NotificationSubscription(
      () {
        final params = <String, Object?>{'user_id': userId};
        if (_http.apiKey.isNotEmpty) params['api_key'] = _http.apiKey;
        if (_http.userToken.isNotEmpty) {
          params['token'] = _http.userToken;
          if (_http.tenantId.isNotEmpty) params['tenant_id'] = _http.tenantId;
        }
        final baseUrl = _http.baseUrl.isEmpty
            ? 'https://api.proofchain.co.za'
            : _http.baseUrl;
        return Uri.parse(
            '$baseUrl/notifications/stream?${queryString(params)}');
      },
      callback,
      options,
      () => _subscriptions.remove(subscription),
    );
    _subscriptions.add(subscription);
    subscription.start();
    return subscription.close;
  }

  /// Reads the public VAPID key, returning null on any request or decode error.
  Future<String?> getVapidKey() async {
    try {
      final result =
          asJsonMap(await _http.get('/notifications/push/vapid-key'));
      return result['vapid_public_key'] as String?;
    } catch (_) {
      return null;
    }
  }

  /// Registers Web Push data obtained externally; native has no browser agent.
  Future<JsonMap> registerPush(
          String userId, PushSubscriptionJSON subscription) async =>
      asJsonMap(await _http.post('/notifications/push/subscribe', {
        'user_id': userId,
        'endpoint': subscription.endpoint,
        'keys': subscription.keys,
      }));

  /// Removes the supplied externally managed Web Push endpoint for a user.
  Future<JsonMap> unregisterPush(String userId, String endpoint) async =>
      asJsonMap(await _http.post('/notifications/push/unsubscribe', {
        'user_id': userId,
        'endpoint': endpoint,
      }));

  /// Browser Service Worker, Notification and PushManager APIs are unavailable
  /// on native Android/iOS. Matches the unsupported-platform JS branch: null,
  /// without requesting OS notification permission or substituting FCM/APNs.
  Future<PushSubscriptionJSON?> requestPermissionAndSubscribe(
    String userId, [
    String serviceWorkerPath = '/sw.js',
  ]) async =>
      null;

  /// Generates the full browser worker source; it is not executed on native.
  String generateServiceWorker([JsonMap options = const {}]) {
    final defaultIcon = options.containsKey('defaultIcon')
        ? jsString(options['defaultIcon'])
        : '/icon-192.png';
    final defaultUrl = options.containsKey('defaultUrl')
        ? jsString(options['defaultUrl'])
        : '/';
    return '''// ProofChain Push Notification Service Worker
// Auto-generated — place this file at the root of your public directory

self.addEventListener('push', function(event) {
  if (!event.data) return;

  let payload;
  try {
    payload = event.data.json();
  } catch (e) {
    payload = { title: 'Notification', body: event.data.text() };
  }

  const options = {
    body: payload.body || '',
    icon: payload.icon || '$defaultIcon',
    badge: payload.badge || '$defaultIcon',
    data: {
      url: payload.url || '$defaultUrl',
      ...payload.data,
    },
    tag: payload.data?.event || 'proofchain',
    renotify: true,
  };

  event.waitUntil(
    self.registration.showNotification(payload.title || 'Notification', options)
  );
});

self.addEventListener('notificationclick', function(event) {
  event.notification.close();
  const url = event.notification.data?.url || '$defaultUrl';

  event.waitUntil(
    clients.matchAll({ type: 'window', includeUncontrolled: true }).then(function(clientList) {
      // Focus existing tab if open
      for (const client of clientList) {
        if (client.url === url && 'focus' in client) {
          return client.focus();
        }
      }
      // Otherwise open new tab
      return clients.openWindow(url);
    })
  );
});
''';
  }

  /// Releases every subscription, including pending handshakes and timers.
  /// This does not close the shared HTTP client used by other SDK resources.
  void close() {
    if (_closed) return;
    _closed = true;
    for (final subscription in _subscriptions.toList(growable: false)) {
      subscription.close();
    }
  }
}

class _NotificationSubscription {
  final Uri Function() _url;
  final NotificationCallback _callback;
  final SubscribeOptions _options;
  final void Function() _onClose;
  final List<String> _data = [];
  String _eventType = '';
  io.HttpClient? _client;
  io.HttpClientRequest? _request;
  StreamSubscription<String>? _stream;
  Timer? _reconnectTimer;
  bool _closed = false;
  int _generation = 0;

  _NotificationSubscription(
      this._url, this._callback, this._options, this._onClose);

  void start() {
    unawaited(_connect());
  }

  Future<void> _connect() async {
    if (_closed) return;
    _reconnectTimer = null;
    final generation = ++_generation;
    _data.clear();
    _eventType = '';
    final client = io.HttpClient();
    _client = client;
    try {
      final request = await client.getUrl(_url());
      if (_closed || generation != _generation) {
        request.abort();
        client.close(force: true);
        return;
      }
      _request = request;
      request.headers.set(io.HttpHeaders.acceptHeader, 'text/event-stream');
      request.headers.set(io.HttpHeaders.cacheControlHeader, 'no-cache');
      final response = await request.close();
      if (_closed || generation != _generation) {
        client.close(force: true);
        return;
      }
      final contentType = response.headers.contentType;
      if (response.statusCode != 200 ||
          contentType?.mimeType != 'text/event-stream') {
        throw io.HttpException(
            'Invalid SSE response: HTTP ${response.statusCode}');
      }
      _stream =
          utf8.decoder.bind(response).transform(const LineSplitter()).listen(
        (line) {
          if (!_closed && generation == _generation) _onLine(line);
        },
        onError: (Object error, StackTrace stackTrace) =>
            _disconnect(generation),
        onDone: () => _disconnect(generation),
        cancelOnError: true,
      );
    } catch (_) {
      if (!_closed && generation == _generation) _disconnect(generation);
    }
  }

  void _onLine(String line) {
    if (line.isEmpty) {
      final eventType = _eventType;
      _eventType = '';
      if (_data.isEmpty) return;
      final data = _data.join('\n');
      _data.clear();
      // EventSource.onmessage ignores named SSE events other than "message".
      if (eventType.isNotEmpty && eventType != 'message') return;
      try {
        final json = asJsonMap(jsonDecode(data));
        if (json['event'] == 'connected') {
          _options.onConnect?.call();
        } else {
          _callback(NotificationEvent.fromJson(json));
        }
      } catch (_) {
        _options.onError
            ?.call(FormatException('Failed to parse notification: $data'));
      }
      return;
    }
    if (line.startsWith(':')) return;
    final colon = line.indexOf(':');
    final field = colon < 0 ? line : line.substring(0, colon);
    var value = colon < 0 ? '' : line.substring(colon + 1);
    if (value.startsWith(' ')) value = value.substring(1);
    if (field == 'data') _data.add(value);
    if (field == 'event') _eventType = value;
  }

  void _disconnect(int generation) {
    if (_closed || generation != _generation) return;
    ++_generation;
    final stream = _stream;
    _stream = null;
    if (stream != null) unawaited(stream.cancel());
    _request = null;
    _client?.close(force: true);
    _client = null;
    try {
      _options.onDisconnect?.call();
    } finally {
      // A callback may unsubscribe synchronously, so check again before arming.
      if (!_closed && (_options.autoReconnect ?? true)) {
        _reconnectTimer = Timer(
          Duration(milliseconds: (_options.reconnectDelay ?? 3000).toInt()),
          () => unawaited(_connect()),
        );
      } else if (!_closed) {
        close();
      }
    }
  }

  void close() {
    if (_closed) return;
    _closed = true;
    ++_generation;
    _reconnectTimer?.cancel();
    _reconnectTimer = null;
    _request?.abort();
    _request = null;
    _client?.close(force: true);
    _client = null;
    final stream = _stream;
    _stream = null;
    if (stream != null) unawaited(stream.cancel());
    _data.clear();
    _onClose();
  }
}
