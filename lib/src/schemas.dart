import 'http.dart';
import 'json.dart';
import 'models.dart';

class SchemasClient {
  final HttpClient http;
  SchemasClient(this.http);

  Future<SchemaListResponse> list([ListSchemasOptions? options]) async {
    final params = <String, Object?>{
      if (jsTruthy(options?.status)) 'status': options!.status,
      if (jsTruthy(options?.search)) 'search': options!.search,
      if (jsTruthy(options?.limit)) 'limit': options!.limit,
      if (jsTruthy(options?.offset)) 'offset': options!.offset,
    };
    return decodeModel(await http.get('/schemas?${queryString(params)}'),
        SchemaListResponse.fromJson);
  }

  String _path(String name, String? version) => jsTruthy(version)
      ? '/schemas/${encodeComponent(name)}/${encodeComponent(version!)}'
      : '/schemas/${encodeComponent(name)}';

  Future<SchemaDetail> get(String name, [String? version]) async =>
      decodeModel(await http.get(_path(name, version)), SchemaDetail.fromJson);

  Future<SchemaDetail> create(String yamlContent) async => decodeModel(
      await http.post('/schemas', {'yaml_content': yamlContent}),
      SchemaDetail.fromJson);

  Future<SchemaDetail> update(String name, String yamlContent) async =>
      decodeModel(
        await http.put('/schemas/${encodeComponent(name)}', {
          'yaml_content': yamlContent,
        }),
        SchemaDetail.fromJson,
      );

  Future<void> delete(String name, [String? version]) async {
    await http.delete(_path(name, version));
  }

  Future<Schema> activate(String name, [String? version]) async => decodeModel(
      await http.post('${_path(name, version)}/activate', {}), Schema.fromJson);

  Future<Schema> deprecate(String name, [String? version]) async => decodeModel(
      await http.post('${_path(name, version)}/deprecate', {}),
      Schema.fromJson);

  Future<Schema> setDefault(String name, String version) async => decodeModel(
        await http.post(
            '/schemas/${encodeComponent(name)}/${encodeComponent(version)}/set-default',
            {}),
        Schema.fromJson,
      );

  Future<ValidationResult> validate(ValidateDataRequest request) async =>
      decodeModel(await http.post('/schemas/validate', request),
          ValidationResult.fromJson);

  Future<List<ValidationResult>> validateMultiple(
          List<String> schemaNames, JsonMap data) async =>
      decodeList(
        await http.post('/schemas/validate/batch', {
          'schema_names': schemaNames,
          'data': data,
        }),
        ValidationResult.fromJson,
      );

  Future<JsonMap> getUsageStats(String name) async =>
      asJsonMap(await http.get('/schemas/${encodeComponent(name)}/stats'));

  Future<SchemaDetail> clone(String sourceName, String newName,
          [String? newVersion]) async =>
      decodeModel(
        await http.post('/schemas/${encodeComponent(sourceName)}/clone', {
          'new_name': newName,
          if (newVersion != null) 'new_version': newVersion,
        }),
        SchemaDetail.fromJson,
      );
}
