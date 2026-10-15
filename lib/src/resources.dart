import 'dart:typed_data';

import 'http.dart';
import 'json.dart';
import 'models.dart';
import 'upload.dart';

class VaultResource {
  final HttpClient http;
  VaultResource(this.http);

  Future<VaultListResponse> list([String? folderId]) async => decodeModel(
        await http.get('/tenant/vault', {
          if (jsTruthy(folderId)) 'folder_id': folderId,
        }),
        VaultListResponse.fromJson,
      );

  Future<VaultFile> upload(VaultUploadRequest request) async => decodeModel(
        await http.requestMultipart(
          '/tenant/vault/upload',
          files: {
            'file': UploadFile(
              request.file.bytes,
              filename: jsTruthy(request.filename) ? request.filename! : 'file',
              contentType: request.file.contentType,
            ),
          },
          fields: {
            'user_id': request.userId,
            if (jsTruthy(request.folderId)) 'folder_id': request.folderId!,
            'access_mode':
                jsTruthy(request.accessMode) ? request.accessMode! : 'private',
          },
        ),
        VaultFile.fromJson,
      );

  Future<VaultFile> get(String fileId) async => decodeModel(
      await http.get('/tenant/vault/files/$fileId'), VaultFile.fromJson);

  Future<Uint8List> download(String fileId) =>
      http.getRaw('/tenant/vault/files/$fileId/download');

  Future<void> delete(String fileId) async {
    await http.delete('/tenant/vault/files/$fileId');
  }

  Future<VaultFile> move(String fileId, String folderId) async => decodeModel(
        await http
            .post('/tenant/vault/files/$fileId/move', {'folder_id': folderId}),
        VaultFile.fromJson,
      );

  Future<VaultFolder> createFolder(String name, [String? parentId]) async =>
      decodeModel(
        await http.post('/tenant/vault/folders', {
          'name': name,
          if (parentId != null) 'parent_id': parentId,
        }),
        VaultFolder.fromJson,
      );

  Future<void> deleteFolder(String folderId) async {
    await http.delete('/tenant/vault/folders/$folderId');
  }

  Future<VaultStats> stats() async =>
      decodeModel(await http.get('/tenant/vault/stats'), VaultStats.fromJson);

  Future<JsonMap> share(String fileId, [num? expiresInHours]) async =>
      asJsonMap(await http.post('/tenant/vault/share', {
        'file_id': fileId,
        if (expiresInHours != null) 'expires_in_hours': expiresInHours,
      }));
}

class SearchResource {
  final HttpClient http;
  SearchResource(this.http);

  Future<SearchResponse> query([SearchQueryRequest? request]) async {
    final input = request?.toJson() ?? <String, Object?>{};
    return decodeModel(
      await http.post('/search', {
        if (input.containsKey('filters')) 'filters': input['filters'],
        if (input.containsKey('offset')) 'offset': input['offset'],
        if (input.containsKey('limit')) 'limit': input['limit'],
        if (input.containsKey('includeData'))
          'include_data': input['includeData'],
      }),
      SearchResponse.fromJson,
    );
  }

  Future<SearchResponse> quick(String query, [num limit = 20]) async =>
      decodeModel(await http.get('/search/quick', {'q': query, 'limit': limit}),
          SearchResponse.fromJson);

  /// Accepts [UserEventHistoryOptions] or a legacy numeric limit.
  Future<UserEventHistoryResponse> byUser(String userId,
      [Object? optionsOrLimit, num? offset]) async {
    final options = optionsOrLimit is num
        ? UserEventHistoryOptions(limit: optionsOrLimit, offset: offset)
        : (optionsOrLimit as UserEventHistoryOptions? ??
            const UserEventHistoryOptions());
    return decodeModel(
      await http.get('/search/by-user/$userId', {
        'days': options.days,
        'limit': options.limit,
        'offset': options.offset,
      }),
      UserEventHistoryResponse.fromJson,
    );
  }

  Future<Event> byCertificate(String certificateId) async => decodeModel(
      await http.get('/search/by-certificate/$certificateId'), Event.fromJson);

  Future<FacetsResponse> facets([String? fromDate, String? toDate]) async =>
      decodeModel(
        await http.get('/search/facets', {
          'from_date': fromDate,
          'to_date': toDate,
        }),
        FacetsResponse.fromJson,
      );

  Future<SearchStats> stats() async =>
      decodeModel(await http.get('/search/stats'), SearchStats.fromJson);
}

class VerifyResource {
  final HttpClient http;
  VerifyResource(this.http);

  Future<CertificateVerifyResult> certificate(String certificateId) async =>
      decodeModel(await http.get('/verify/cert/$certificateId'),
          CertificateVerifyResult.fromJson);

  Future<JsonMap> event(String ipfsHash) async =>
      asJsonMap(await http.get('/verify/event/$ipfsHash'));

  Future<ProofVerifyResult> proof(
          String leaf, List<String> proof, String root) async =>
      decodeModel(
        await http.post('/verify/proof', {
          'leaf': leaf,
          'proof': proof,
          'root': root,
        }),
        ProofVerifyResult.fromJson,
      );

  Future<BatchVerifyResult> batch(String batchId) async => decodeModel(
      await http.get('/verify/batch/$batchId'), BatchVerifyResult.fromJson);

  Future<EventBatchProof> eventBatchProof(String eventId) async => decodeModel(
      await http.get('/verify/event/$eventId/batch-proof'),
      EventBatchProof.fromJson);

  Future<JsonMap> batchVerify(List<JsonMap> items) async =>
      asJsonMap(await http.post('/verify/batch', {'items': items}));
}

class TenantResource {
  final HttpClient http;
  TenantResource(this.http);

  Future<List<ApiKey>> listApiKeys() async =>
      decodeList(await http.get('/tenant/api-keys'), ApiKey.fromJson);

  Future<ApiKey> createApiKey(CreateApiKeyRequest request) async {
    final input = request.toJson();
    return decodeModel(
      await http.post('/tenant/api-keys', {
        'name': request.name,
        if (input.containsKey('permissions'))
          'permissions': input['permissions'],
        if (input.containsKey('expiresInDays'))
          'expires_in_days': input['expiresInDays'],
      }),
      ApiKey.fromJson,
    );
  }

  Future<void> deleteApiKey(String keyId) async {
    await http.delete('/tenant/api-keys/$keyId');
  }

  Future<JsonMap> usageDetailed([String? fromDate, String? toDate]) async =>
      asJsonMap(await http.get('/tenant/usage/detailed', {
        'from_date': fromDate,
        'to_date': toDate,
      }));

  Future<JsonMap> context() async =>
      asJsonMap(await http.get('/tenant/context'));

  Future<BlockchainStats> blockchainStats() async => decodeModel(
      await http.get('/tenant/blockchain/stats'), BlockchainStats.fromJson);

  Future<BlockchainProof> blockchainVerify(String certificateId) async =>
      decodeModel(await http.get('/tenant/blockchain/verify/$certificateId'),
          BlockchainProof.fromJson);

  Future<JsonMap> blockchainCertificates([num? limit, num? offset]) async =>
      asJsonMap(await http.get('/tenant/blockchain/certificates', {
        'limit': limit,
        'offset': offset,
      }));

  Future<JsonMap> forceBatch() async =>
      asJsonMap(await http.post('/tenant/events/force-batch'));

  Future<JsonMap> settleAll() async =>
      asJsonMap(await http.post('/tenant/events/settle-all'));

  Future<JsonMap> settleEvent(String eventId) async =>
      asJsonMap(await http.post('/tenant/events/$eventId/settle'));
}
