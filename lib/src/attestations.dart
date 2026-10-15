import 'http.dart';
import 'json.dart';
import 'models.dart';

class AttestationsClient {
  final HttpClient http;
  AttestationsClient(this.http);

  Future<List<AttestationSchema>> listSchemas([JsonMap? options]) async =>
      decodeList(
        await http.get('/attestations/schemas', {
          'attestation_type': options?['attestation_type'],
        }),
        AttestationSchema.fromJson,
      );

  Future<AttestationSchema> getSchema(String schemaId) async => decodeModel(
      await http.get('/attestations/schemas/$schemaId'),
      AttestationSchema.fromJson);

  Future<AttestationRecord> create(CreateAttestationRequest request) async =>
      decodeModel(await http.post('/attestations', request),
          AttestationRecord.fromJson);

  Future<List<AttestationRecord>> list(
          [ListAttestationsOptions? options]) async =>
      decodeList(
        await http.get('/attestations', {
          'attestation_type': options?.attestation_type,
          'status': options?.status,
          'limit': options?.limit,
        }),
        AttestationRecord.fromJson,
      );

  Future<List<AttestationRecord>> listBySubject(String subjectAddress,
          [ListAttestationsOptions? options]) async =>
      decodeList(
        await http.get('/attestations/by-subject/$subjectAddress', {
          'attestation_type': options?.attestation_type,
          'status': options?.status,
          'limit': options?.limit,
        }),
        AttestationRecord.fromJson,
      );

  Future<AttestationRecord> get(String attestationId) async => decodeModel(
      await http.get('/attestations/$attestationId'),
      AttestationRecord.fromJson);

  Future<AttestationRecord> revoke(String attestationId,
      [String? reason]) async {
    final params =
        jsTruthy(reason) ? '?reason=${encodeComponent(reason!)}' : '';
    return decodeModel(
      await http.post('/attestations/$attestationId/revoke$params', {}),
      AttestationRecord.fromJson,
    );
  }

  Future<AttestationRecord> anchor(String attestationId) async => decodeModel(
      await http.post('/attestations/$attestationId/anchor', {}),
      AttestationRecord.fromJson);

  Future<AttestationConfig> getConfig() async => decodeModel(
      await http.get('/attestations/config'), AttestationConfig.fromJson);

  Future<AttestationConfig> updateConfig(
          UpdateAttestationConfigRequest request) async =>
      decodeModel(await http.put('/attestations/config', request),
          AttestationConfig.fromJson);

  Future<List<WalletCredential>> getWalletCredentials(String walletAddress,
          [ListWalletCredentialsOptions? options]) async =>
      decodeList(
        await http.get('/public/credentials/$walletAddress', {
          'attestation_type': options?.attestation_type,
          'limit': options?.limit,
          'offset': options?.offset,
        }),
        WalletCredential.fromJson,
      );

  Future<WalletCredential> getWalletCredential(
          String walletAddress, String attestationUid) async =>
      decodeModel(
        await http.get('/public/credentials/$walletAddress/$attestationUid'),
        WalletCredential.fromJson,
      );

  Future<WalletCredentialVerifySummary> verifyWalletCredentials(
          String walletAddress) async =>
      decodeModel(await http.get('/public/credentials/$walletAddress/verify'),
          WalletCredentialVerifySummary.fromJson);
}
