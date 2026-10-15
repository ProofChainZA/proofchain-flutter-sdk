import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;

import 'errors.dart';
import 'json.dart';
import 'models.dart';

const _defaultIngestUrl = 'https://ingest.proofchain.co.za';
const _userAgent = 'proofchain-js/0.1.0';

/// Direct API-key ingestion. Requests are not retried.
///
/// The current JavaScript SDK exposes HTTP ingestion and event status only;
/// despite its module description, it does not open WebSocket connections.
///
/// For trusted backend use only: never ship the API key in a native app.
/// This transport is independent of the main SDK client. Each operation owns
/// and closes its own sockets, so no client disposal method is required.
class IngestionClient {
  final String _apiKey;
  final String _ingestUrl;
  final num _timeout;

  /// Uses the configured ingest URL or `https://ingest.proofchain.co.za`.
  ///
  /// Timeout defaults to 30000 milliseconds and covers headers and body;
  /// batch operations use twice that duration.
  IngestionClient(IngestionClientOptions options)
      : _apiKey = options.apiKey,
        _ingestUrl = _baseUrl(options.ingestUrl, _defaultIngestUrl),
        _timeout = jsTruthy(options.timeout) ? options.timeout! : 30000;

  Map<String, String> _headers() => {
        'X-API-Key': _apiKey,
        'Content-Type': 'application/json',
        'User-Agent': _userAgent,
      };

  /// Queues one event, sending nonempty schema IDs in `X-Schemas`.
  ///
  /// Timeouts throw [NetworkError]; HTTP errors are not retried.
  Future<IngestEventResponse> ingest(IngestEventRequest request) async {
    final headers = _headers();
    if (request.schemaIds?.isNotEmpty ?? false) {
      headers['X-Schemas'] = request.schemaIds!.join(',');
    }
    final result = await _ingestionRequest(
      'POST',
      '$_ingestUrl/events/ingest',
      headers,
      _timeout,
      body: _eventBody(request, includeSource: true),
    );
    return _eventResponse(result, includeQueue: true);
  }

  /// Direct batches use a raw array and ignore per-event schema IDs.
  Future<BatchIngestResponse> ingestBatch(BatchIngestRequest request) async {
    if (request.events.length > 1000) {
      throw ValidationError('Batch size cannot exceed 1000 events');
    }
    final result = await _ingestionRequest(
      'POST',
      '$_ingestUrl/events/ingest/batch',
      _headers(),
      _timeout * 2,
      body: request.events
          .map((event) => _eventBody(event, includeSource: true))
          .toList(growable: false),
    );
    return _batchResponse(result);
  }

  /// Returns the status response unchanged, including its original wire keys.
  /// Unlike ingest methods, a timeout throws [TimeoutException] directly.
  Future<JsonMap> getEventStatus(String eventId) => _ingestionRequest(
        'GET',
        '$_ingestUrl/events/$eventId/status',
        _headers(),
        _timeout,
        wrapTimeout: false,
      );
}

/// End-user ingestion through the tenant API, without retries.
///
/// Provenance is stamped server-side: [IngestEventRequest.eventSource] is
/// deliberately ignored. Schema IDs are also not sent by this client.
///
/// Uses a separate per-operation native transport, not the main SDK's retry
/// or timeout pipeline. Each operation closes its own sockets, including on
/// failure; there is no shared transport to dispose.
class EndUserIngestionClient {
  String _userToken;
  final String _tenantId;
  final String _apiUrl;
  final num _timeout;

  /// Uses the supplied JWT and tenant ID, with the public API root by default.
  ///
  /// Timeout defaults to 30000 milliseconds for headers plus response body;
  /// batch operations use twice that duration.
  EndUserIngestionClient(EndUserIngestionClientOptions options)
      : _userToken = options.userToken,
        _tenantId = options.tenantId,
        _apiUrl = _baseUrl(options.apiUrl, 'https://api.proofchain.co.za'),
        _timeout = jsTruthy(options.timeout) ? options.timeout! : 30000;

  /// Replaces the JWT for subsequent requests without changing tenant scope.
  void setToken(String userToken) {
    _userToken = userToken;
  }

  Map<String, String> _headers() => {
        'Authorization': 'Bearer $_userToken',
        'X-Tenant-ID': _tenantId,
        'Content-Type': 'application/json',
        'User-Agent': _userAgent,
      };

  /// Queues one end-user event with server-stamped provenance.
  ///
  /// Timeouts throw [NetworkError]; HTTP failures are surfaced without retries.
  Future<IngestEventResponse> ingest(IngestEventRequest request) async {
    final result = await _ingestionRequest(
      'POST',
      '$_apiUrl/end-user/events/ingest',
      _headers(),
      _timeout,
      body: _eventBody(request, includeSource: false),
    );
    return _eventResponse(result, includeQueue: true);
  }

  /// End-user batches use an `events` envelope and allow at most 100 events.
  Future<BatchIngestResponse> ingestBatch(BatchIngestRequest request) async {
    if (request.events.length > 100) {
      throw ValidationError('End-user batch size cannot exceed 100 events');
    }
    final result = await _ingestionRequest(
      'POST',
      '$_apiUrl/end-user/events/ingest/batch',
      _headers(),
      _timeout * 2,
      body: {
        'events': request.events
            .map((event) => _eventBody(event, includeSource: false))
            .toList(growable: false),
      },
    );
    return _batchResponse(result);
  }
}

String _baseUrl(String? value, String fallback) =>
    (jsTruthy(value) ? value! : fallback).replaceFirst(RegExp(r'/$'), '');

JsonMap _eventBody(IngestEventRequest request, {required bool includeSource}) =>
    {
      'user_id': request.userId,
      'event_type': request.eventType,
      'data': request.data ?? <String, Object?>{},
      if (includeSource)
        'event_source':
            jsTruthy(request.eventSource) ? request.eventSource : 'sdk',
      if (request.hot == true) 'hot': true,
      if (jsTruthy(request.timestamp)) 'timestamp': request.timestamp,
    };

IngestEventResponse _eventResponse(JsonMap result,
        {required bool includeQueue}) =>
    IngestEventResponse.fromJson({
      'eventId': result['event_id'],
      'certificateId': result['certificate_id'],
      'status': result['status'],
      if (includeQueue && result.containsKey('queue_position'))
        'queuePosition': result['queue_position'],
      if (includeQueue && result.containsKey('estimated_confirmation'))
        'estimatedConfirmation': result['estimated_confirmation'],
    });

BatchIngestResponse _batchResponse(JsonMap result) {
  final entries = jsTruthy(result['results'])
      ? result['results']
      : jsTruthy(result['responses'])
          ? result['responses']
          : const <Object?>[];
  return BatchIngestResponse.fromJson({
    'totalEvents': jsTruthy(result['total_events'])
        ? result['total_events']
        : result['total'],
    'queued': result['queued'],
    'failed': result['failed'],
    'results': (entries as List<Object?>)
        .map((entry) =>
            _eventResponse(asJsonMap(entry), includeQueue: false).toJson())
        .toList(growable: false),
  });
}

// Each operation owns its transport so timeout can abort both connection setup
// and response-body reading, without affecting another concurrent operation.
Future<JsonMap> _ingestionRequest(
  String method,
  String url,
  Map<String, String> headers,
  num timeout, {
  Object? body,
  bool wrapTimeout = true,
}) async {
  final client = io.HttpClient();
  final duration = Duration(milliseconds: timeout.toInt());
  try {
    return await _performRequest(client, method, url, headers, body).timeout(
      duration,
      onTimeout: () {
        client.close(force: true);
        if (wrapTimeout) throw NetworkError('Request timed out');
        // Unlike ingest/ingestBatch, JS getEventStatus does not wrap AbortError.
        throw TimeoutException('Request timed out', duration);
      },
    );
  } finally {
    client.close(force: true);
  }
}

Future<JsonMap> _performRequest(
  io.HttpClient client,
  String method,
  String url,
  Map<String, String> headers,
  Object? body,
) async {
  final request = await client.openUrl(method, Uri.parse(url));
  headers.forEach(request.headers.set);
  if (body != null) request.write(jsonEncode(jsonValue(body)));
  final response = await request.close();
  final isJson =
      response.headers.value('content-type')?.contains('application/json') ??
          false;
  final successful = response.statusCode >= 200 && response.statusCode < 300;
  if (successful && (response.statusCode == 204 || !isJson)) {
    await response.drain<void>();
    return <String, Object?>{};
  }
  JsonMap result = <String, Object?>{};
  if (isJson) {
    final text = await utf8.decoder.bind(response).join();
    if (successful) {
      return asJsonMap(jsonDecode(text));
    }
    try {
      final decoded = jsonDecode(text);
      if (decoded is JsonMap) result = decoded;
    } on FormatException {
      // JavaScript ignores invalid JSON error bodies.
    }
  } else {
    await response.drain<void>();
  }
  final detail =
      jsTruthy(result['detail']) ? result['detail'] : result['message'];
  final message =
      jsTruthy(detail) ? jsString(detail) : 'HTTP ${response.statusCode}';
  switch (response.statusCode) {
    case 401:
      throw AuthenticationError(message);
    case 400:
    case 422:
      throw ValidationError.fromResponse(message, result['errors']);
    case 429:
      final value = response.headers.value('retry-after');
      final digits =
          value == null ? null : RegExp(r'^\s*([+-]?\d+)').firstMatch(value);
      throw RateLimitError(value == null || value.isEmpty
          ? null
          : digits == null
              ? double.nan
              : num.parse(digits.group(1)!));
    default:
      if (response.statusCode >= 500) {
        throw ServerError(message, response.statusCode);
      }
      throw ProofChainError(message, response.statusCode, result);
  }
}
