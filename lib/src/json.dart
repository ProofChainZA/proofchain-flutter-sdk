/// JSON object preserving the API's original field names and null values.
typedef JsonMap = Map<String, Object?>;

/// Serialization contract implemented by SDK request and response models.
abstract interface class JsonModel {
  /// Returns wire fields without globally renaming keys or omitting nulls.
  JsonMap toJson();
}

/// Casts [value] to a JSON object; incompatible shapes throw a type error.
JsonMap asJsonMap(Object? value) => value as JsonMap;

/// Decodes a JSON object with [decode], without swallowing shape errors.
T decodeModel<T>(Object? value, T Function(JsonMap) decode) =>
    decode(asJsonMap(value));

/// Decodes an array of JSON objects into a fixed-length list.
List<T> decodeList<T>(Object? value, T Function(JsonMap) decode) =>
    (value as List<Object?>)
        .map((item) => decode(asJsonMap(item)))
        .toList(growable: false);

/// Recursively converts models, string-keyed maps and iterables for encoding.
///
/// Map keys and null entries are retained. Other values pass through unchanged;
/// the eventual JSON encoder remains responsible for unsupported value types.
Object? jsonValue(Object? value) {
  if (value is JsonModel) return value.toJson();
  if (value is Map<String, Object?>) {
    return value.map((key, item) => MapEntry(key, jsonValue(item)));
  }
  if (value is Iterable<Object?>) {
    return value.map(jsonValue).toList(growable: false);
  }
  return value;
}

/// SDK truthiness helper: null, false, empty strings and zero are false.
///
/// Empty maps and lists remain truthy, matching JavaScript request defaults.
bool jsTruthy(Object? value) =>
    value != null && value != false && value != '' && value != 0;

/// Stringifies wire values using the SDK's JavaScript-compatible conventions.
///
/// Objects become `[object Object]`; lists use comma-separated values with
/// empty slots for null elements.
String jsString(Object? value) {
  if (value is Map<String, Object?> || value is JsonModel) {
    return '[object Object]';
  }
  if (value is Iterable<Object?>) {
    return value.map((item) => item == null ? '' : jsString(item)).join(',');
  }
  if (value is num && value.isFinite && value == value.truncateToDouble()) {
    return value.toInt().toString();
  }
  return value.toString();
}

/// Percent-encodes a single URL path component.
String encodeComponent(String value) => Uri.encodeComponent(value);

// URLSearchParams uses application/x-www-form-urlencoded, not RFC 3986.
String _formComponent(String value) {
  final encoded = Uri.encodeQueryComponent(value);
  return encoded
      .replaceAll('~', '%7E')
      .replaceAll('!', '%21')
      .replaceAll("'", '%27')
      .replaceAll('(', '%28')
      .replaceAll(')', '%29')
      .replaceAll('%2A', '*');
}

/// Encodes form-style query parameters, omitting only null-valued entries.
///
/// Uses [jsString] for values; empty strings, false and zero remain present.
String queryString(JsonMap params) => params.entries
    .where((entry) => entry.value != null)
    .map((entry) =>
        '${_formComponent(entry.key)}=${_formComponent(jsString(entry.value))}')
    .join('&');
