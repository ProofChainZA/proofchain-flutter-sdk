import 'json.dart';

/// Base SDK failure with an optional HTTP status and original response object.
///
/// Messages and response bodies may contain server-provided sensitive data.
/// Prefer curated messages and status codes over logging exceptions verbatim.
class ProofChainError implements Exception {
  /// Human-readable message, potentially supplied by the server.
  final String message;

  /// HTTP status when available; absent for network and timeout failures.
  final int? statusCode;

  /// Original error object when retained by the originating transport.
  final JsonMap? responseBody;

  /// Creates a failure without modifying the supplied response data.
  const ProofChainError(this.message, [this.statusCode, this.responseBody]);

  /// Stable SDK error category.
  String get name => 'ProofChainError';
  @override
  String toString() => '$name: $message';
}

/// HTTP 401 failure for missing or invalid API-key or JWT authentication.
class AuthenticationError extends ProofChainError {
  /// Creates an authentication failure with the JavaScript-compatible default.
  const AuthenticationError([String message = 'Invalid or missing API key'])
      : super(message, 401);
  @override
  String get name => 'AuthenticationError';
}

/// HTTP 403 failure from the main transport.
class AuthorizationError extends ProofChainError {
  /// Creates an access-denied failure.
  const AuthorizationError([String message = 'Access denied'])
      : super(message, 403);
  @override
  String get name => 'AuthorizationError';
}

/// HTTP 404 failure from the main transport.
class NotFoundError extends ProofChainError {
  /// Creates a resource-not-found failure.
  const NotFoundError([String message = 'Resource not found'])
      : super(message, 404);
  @override
  String get name => 'NotFoundError';
}

/// A standard field-level validation detail.
class ValidationErrorDetail implements JsonModel {
  /// Server-provided field name.
  final String field;

  /// Server-provided validation explanation.
  final String message;

  /// Creates a standard field validation detail.
  const ValidationErrorDetail({required this.field, required this.message});

  /// Decodes required `field` and `message` string fields.
  ValidationErrorDetail.fromJson(JsonMap json)
      : field = json['field'] as String,
        message = json['message'] as String;
  @override
  JsonMap toJson() => {'field': field, 'message': message};
}

/// Validation failure for HTTP 400/422 or a local batch-size restriction.
///
/// The exposed status is 422, including when the original response was 400.
class ValidationError extends ProofChainError {
  /// Original server details, including nonstandard validation payloads.
  final Object? rawErrors;

  /// Typed view of details conforming to the exported interface.
  ///
  /// Decoding is lazy and can throw if the server returns nonstandard details.
  /// Inspect [rawErrors] when handling arbitrary validation response shapes.
  late final List<ValidationErrorDetail> errors =
      rawErrors is List<ValidationErrorDetail>
          ? rawErrors as List<ValidationErrorDetail>
          : decodeList(
              rawErrors ?? const <Object?>[], ValidationErrorDetail.fromJson);

  /// Creates a validation failure from typed field details.
  ValidationError(
      [String message = 'Validation error',
      List<ValidationErrorDetail> errors = const []])
      : rawErrors = errors,
        super(message, 422);

  /// Retains unmodified server details for deferred typed decoding.
  ValidationError.fromResponse(String message, Object? errors)
      : rawErrors = errors,
        super(message, 422);
  @override
  String get name => 'ValidationError';
}

/// HTTP 429 failure; the main transport does not automatically retry it.
class RateLimitError extends ProofChainError {
  /// Parsed integer prefix of `Retry-After` in seconds.
  ///
  /// Null means missing/empty; NaN represents an unparseable value. HTTP-date
  /// syntax is not converted to a duration.
  final num? retryAfter;

  /// Creates a rate-limit failure with optional server retry guidance.
  const RateLimitError([this.retryAfter]) : super('Rate limit exceeded', 429);
  @override
  String get name => 'RateLimitError';
}

/// Server-side HTTP failure (status 500 or greater).
class ServerError extends ProofChainError {
  /// Creates a failure with the server's status code.
  const ServerError([String message = 'Server error', int statusCode = 500])
      : super(message, statusCode);
  @override
  String get name => 'ServerError';
}

/// Transport failure, optionally retaining an underlying cause.
class NetworkError extends ProofChainError {
  /// Original failure when the originating transport preserves it.
  final Object? cause;

  /// Creates a transport failure without an HTTP status.
  const NetworkError([String message = 'Network error', this.cause])
      : super(message);
  @override
  String get name => 'NetworkError';
}

/// Main transport response-header timeout, not a response-body deadline.
///
/// JSON and multipart calls surface this directly without retrying. Raw reads
/// wrap it in [NetworkError]; standalone ingestion uses its own timeout errors.
class TimeoutError extends ProofChainError {
  /// Creates a response-header timeout failure.
  const TimeoutError([String message = 'Request timed out']) : super(message);
  @override
  String get name => 'TimeoutError';
}
