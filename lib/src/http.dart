import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;
import 'dart:math';
import 'dart:typed_data';

import 'errors.dart';
import 'json.dart';
import 'upload.dart';

/// Resolves a tenant slug to its hosted API URL, including the `/api` prefix.
String tenantApiUrl(String slug) => 'https://$slug.proofchain.co.za/api';

/// Authentication, routing and transport settings shared by SDK resources.
///
/// Native end-user applications should use [userToken] and [tenantId]. API keys
/// grant backend access and must not be bundled into distributed applications.
/// Supplying both credentials sends both; these options do not validate them.
class ProofChainOptions {
  /// Backend-only credential sent as `X-API-Key` when nonempty.
  final String? apiKey;

  /// End-user JWT sent as an `Authorization: Bearer` header when nonempty.
  final String? userToken;

  /// Tenant scope sent as `X-Tenant-ID` only with a nonempty [userToken].
  final String? tenantId;

  /// Explicit API root, taking precedence over [tenant].
  ///
  /// A truthy value is used verbatim except for one trailing slash.
  final String? baseUrl;

  /// Hosted tenant slug used when [baseUrl] is absent or empty.
  final String? tenant;

  /// Milliseconds until response headers, matching the JavaScript SDK.
  ///
  /// Defaults to 30000 when absent or zero. Includes connection, upload and
  /// redirect handling, but not subsequent body consumption or stream waits.
  final num? timeout;

  /// Additional attempts for non-SDK failures before response headers.
  ///
  /// Defaults to 3. Applies to JSON and multipart requests, including writes;
  /// HTTP error statuses, SDK timeouts and body decoding failures are not retried.
  final num? maxRetries;

  /// Creates settings without opening a connection.
  const ProofChainOptions(
      {this.apiKey,
      this.userToken,
      this.tenantId,
      this.baseUrl,
      this.tenant,
      this.timeout,
      this.maxRetries});
}

/// Shared native transport for JSON, multipart, raw and streaming requests.
///
/// Owns its sockets; call [close] when finished. JSON and multipart requests
/// retry non-[ProofChainError] failures before headers with a linear delay plus
/// jitter. A failed write may already have reached the server before a retry.
class HttpClient {
  final io.HttpClient _client = io.HttpClient();
  final Random _random = Random.secure();
  final Map<String, Future<Object?>> _inflight = {};

  /// Effective backend API key; empty when not configured.
  final String apiKey;

  /// Effective end-user JWT; empty when not configured.
  final String userToken;

  /// Effective tenant scope; empty when not configured.
  final String tenantId;

  /// Effective root: explicit URL, hosted tenant URL, or the public API root.
  final String baseUrl;

  /// Effective header-phase timeout in milliseconds.
  final int timeout;

  /// Maximum number of additional network attempts.
  final num maxRetries;
  bool _closed = false;

  /// Creates a reusable transport using [options].
  HttpClient(ProofChainOptions options)
      : apiKey = options.apiKey ?? '',
        userToken = options.userToken ?? '',
        tenantId = options.tenantId ?? '',
        baseUrl = (jsTruthy(options.baseUrl)
                ? options.baseUrl!
                : jsTruthy(options.tenant)
                    ? tenantApiUrl(options.tenant!)
                    : 'https://api.proofchain.co.za')
            .replaceFirst(RegExp(r'/$'), ''),
        timeout =
            (jsTruthy(options.timeout) ? options.timeout! : 30000).toInt(),
        maxRetries = options.maxRetries ?? 3;

  /// Authentication headers, omitting empty credentials.
  ///
  /// Contains secrets when configured; do not log this map.
  Map<String, String> get authHeaders => {
        if (apiKey.isNotEmpty) 'X-API-Key': apiKey,
        if (userToken.isNotEmpty) 'Authorization': 'Bearer $userToken',
        if (userToken.isNotEmpty && tenantId.isNotEmpty)
          'X-Tenant-ID': tenantId,
      };

  Map<String, String> get _headers => {
        'Content-Type': 'application/json',
        'User-Agent': 'proofchain-dart/0.1.0',
        ...authHeaders,
      };

  String _url(String path, JsonMap? params) {
    final query = params == null ? '' : queryString(params);
    return '$baseUrl$path${query.isEmpty ? '' : '?$query'}';
  }

  Future<io.HttpClientResponse> _open(
      String method, String url, Map<String, String> headers,
      [List<List<int>>? chunks]) async {
    if (_closed) throw const NetworkError('Client is closed');
    io.HttpClientRequest? request;
    var expired = false;
    final operation = () async {
      var target = Uri.parse(url);
      var redirectMethod = method;
      var redirectChunks = chunks;
      var redirectHeaders = headers;
      for (var redirects = 0;; redirects++) {
        if (expired) throw const TimeoutError();
        final active = await _client.openUrl(redirectMethod, target);
        request = active;
        if (expired) {
          active.abort();
          throw const TimeoutError();
        }
        active.followRedirects = false;
        redirectHeaders
            .forEach((name, value) => active.headers.set(name, value));
        if (redirectChunks != null) {
          active.contentLength =
              redirectChunks.fold<int>(0, (sum, bytes) => sum + bytes.length);
          for (final bytes in redirectChunks) {
            active.add(bytes);
          }
        }
        final response = await active.close();
        final location = response.headers.value('location');
        if (![301, 302, 303, 307, 308].contains(response.statusCode) ||
            location == null) {
          return response;
        }
        final destination = target.resolve(location);
        final sameOrigin = target.scheme == destination.scheme &&
            target.host == destination.host &&
            target.port == destination.port;
        final authenticated = redirectHeaders.keys.any((name) => [
              'x-api-key',
              'authorization',
              'x-tenant-id'
            ].contains(name.toLowerCase()));
        await response.drain<void>();
        if (!sameOrigin && authenticated) {
          throw ProofChainError(
              'Cross-origin redirect refused', response.statusCode);
        }
        if (redirects >= 19) throw const NetworkError('Too many redirects');
        if ((response.statusCode == 303 &&
                redirectMethod != 'GET' &&
                redirectMethod != 'HEAD') ||
            ([301, 302].contains(response.statusCode) &&
                redirectMethod == 'POST')) {
          redirectMethod = 'GET';
          redirectChunks = null;
          redirectHeaders = {...redirectHeaders}..removeWhere((name, _) =>
              ['content-type', 'content-length'].contains(name.toLowerCase()));
        }
        target = destination;
      }
    }();
    return operation.timeout(Duration(milliseconds: timeout), onTimeout: () {
      expired = true;
      request?.abort();
      throw const TimeoutError();
    });
  }

  Future<io.HttpClientResponse> _fetch(String method, String url,
      Map<String, String> headers, List<List<int>>? chunks,
      [int retries = 0]) async {
    try {
      return await _open(method, url, headers, chunks);
    } on ProofChainError {
      rethrow;
    } catch (error) {
      if (retries < maxRetries) {
        await Future<void>.delayed(Duration(
            milliseconds: 1000 * (retries + 1) + _random.nextInt(500)));
        return _fetch(method, url, headers, chunks, retries + 1);
      }
      throw NetworkError(error.toString(), error);
    }
  }

  Future<Object?> _handleResponse(io.HttpClientResponse response) async {
    final isJson =
        response.headers.value('content-type')?.contains('application/json') ??
            false;
    final ok = response.statusCode >= 200 && response.statusCode < 300;
    if (ok && (response.statusCode == 204 || !isJson)) {
      await response.drain<void>();
      return <String, Object?>{};
    }
    Object? decoded;
    if (isJson) {
      final text = await utf8.decoder.bind(response).join();
      if (ok) return jsonDecode(text);
      try {
        decoded = jsonDecode(text);
      } on FormatException {
        decoded = null;
      }
    } else {
      await response.drain<void>();
    }
    final body = decoded is JsonMap ? decoded : <String, Object?>{};
    final detail = body['detail'];
    final fallback = body['message'];
    final message = jsString(jsTruthy(detail)
        ? detail
        : jsTruthy(fallback)
            ? fallback
            : 'HTTP ${response.statusCode}');
    switch (response.statusCode) {
      case 401:
        throw AuthenticationError(message);
      case 403:
        throw AuthorizationError(message);
      case 404:
        throw NotFoundError(message);
      case 400:
      case 422:
        throw ValidationError.fromResponse(message, body['errors']);
      case 429:
        final value = response.headers.value('retry-after');
        final prefix = value == null
            ? null
            : RegExp(r'^\s*([+-]?\d+)').firstMatch(value)?.group(1);
        throw RateLimitError(value == null || value.isEmpty
            ? null
            : num.tryParse(prefix ?? '') ?? double.nan);
      default:
        if (response.statusCode >= 500) {
          throw ServerError(message, response.statusCode);
        }
        throw ProofChainError(message, response.statusCode, body);
    }
  }

  /// Sends JSON to an API-relative [path] with optional query and header values.
  ///
  /// Concurrent GETs for the same URL share an in-flight future, even when their
  /// custom headers differ. Successful JSON is decoded; 204 and non-JSON
  /// successes return an empty map. HTTP failures become typed SDK exceptions
  /// (401, 403, 404, 400/422, 429 and 5xx), with other statuses using
  /// [ProofChainError]. Response-body waits have no transport timeout.
  Future<Object?> request(String method, String path,
      {Object? body, JsonMap? params, Map<String, String>? headers}) {
    final url = _url(path, params);
    Future<Object?> send() async {
      final chunks = jsTruthy(body)
          ? <List<int>>[utf8.encode(jsonEncode(jsonValue(body)))]
          : null;
      final response =
          await _fetch(method, url, {..._headers, ...?headers}, chunks);
      // The JS transport returns handleResponse outside its fetch catch. Its
      // HTTP errors (including 429) are surfaced without a transport retry.
      return _handleResponse(response);
    }

    if (method != 'GET') return send();
    final existing = _inflight[url];
    if (existing != null) return existing;
    final pending = send().whenComplete(() {
      _inflight.remove(url);
    });
    _inflight[url] = pending;
    return pending;
  }

  /// Sends a JSON GET, coalescing concurrent requests for the same URL.
  Future<Object?> get(String path, [JsonMap? params]) =>
      request('GET', path, params: params);

  /// Sends a JSON POST; network retries can repeat the write.
  Future<Object?> post(String path, [Object? body]) =>
      request('POST', path, body: body);

  /// Sends a JSON PUT; network retries can repeat the write.
  Future<Object?> put(String path, [Object? body]) =>
      request('PUT', path, body: body);

  /// Sends a JSON PATCH; network retries can repeat the write.
  Future<Object?> patch(String path, [Object? body]) =>
      request('PATCH', path, body: body);

  /// Sends a DELETE using the shared JSON response handling.
  Future<Object?> delete(String path) => request('DELETE', path);

  /// Uploads files and text fields as a multipart POST.
  ///
  /// Uses the JSON transport's retry and HTTP error handling. File bytes are
  /// retained in memory; the timeout ends at headers, not body consumption.
  Future<Object?> requestMultipart(String path,
      {Map<String, UploadFile> files = const {},
      Map<String, String> fields = const {}}) async {
    final boundary =
        '----proofchain-${_random.nextInt(0x7fffffff).toRadixString(16)}-${_random.nextInt(0x7fffffff).toRadixString(16)}';
    String escape(String value) => value
        .replaceAll('\r', '%0D')
        .replaceAll('\n', '%0A')
        .replaceAll('"', '%22');
    final chunks = <List<int>>[];
    for (final entry in files.entries) {
      final file = entry.value;
      final contentType = io.ContentType.parse(file.contentType).toString();
      chunks.add(utf8.encode(
          '--$boundary\r\nContent-Disposition: form-data; name="${escape(entry.key)}"; filename="${escape(file.filename)}"\r\nContent-Type: $contentType\r\n\r\n'));
      chunks.add(file.bytes);
      chunks.add(const [13, 10]);
    }
    for (final entry in fields.entries) {
      final value = entry.value.replaceAll(RegExp(r'\r\n|\r|\n'), '\r\n');
      chunks.add(utf8.encode(
          '--$boundary\r\nContent-Disposition: form-data; name="${escape(entry.key)}"\r\n\r\n$value\r\n'));
    }
    chunks.add(utf8.encode('--$boundary--\r\n'));
    final response = await _fetch(
        'POST',
        '$baseUrl$path',
        {
          'User-Agent': 'proofchain-dart/0.1.0',
          ...authHeaders,
          'Content-Type': 'multipart/form-data; boundary=$boundary',
        },
        chunks);
    return _handleResponse(response);
  }

  /// Reads response bytes without JSON decoding, coalescing or retries.
  ///
  /// Non-2xx responses throw [ProofChainError]; header timeouts are wrapped in
  /// [NetworkError]. Reading the body has no timeout.
  Future<Uint8List> getRaw(String path) async {
    try {
      final response = await _open('GET', '$baseUrl$path', _headers);
      if (response.statusCode < 200 || response.statusCode >= 300) {
        await response.drain<void>();
        throw ProofChainError(
            'HTTP ${response.statusCode}', response.statusCode);
      }
      final bytes = BytesBuilder(copy: false);
      await for (final chunk in response) {
        bytes.add(chunk);
      }
      return bytes.takeBytes();
    } on ProofChainError catch (error) {
      if (error is TimeoutError) throw NetworkError(error.message, error);
      rethrow;
    } catch (error) {
      throw NetworkError(error.toString());
    }
  }

  /// Opens a GET stream without retries or HTTP status interpretation.
  ///
  /// Only the response-header phase is timed; callers own body consumption.
  Future<io.HttpClientResponse> openStream(String path,
          {JsonMap? params, Map<String, String>? headers}) =>
      _open('GET', _url(path, params), {..._headers, ...?headers});

  /// Idempotently closes this transport, force-closing active connections.
  void close() {
    if (_closed) return;
    _closed = true;
    _client.close(force: true);
  }
}
