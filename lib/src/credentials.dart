import 'http.dart';
import 'json.dart';
import 'models.dart';

class CredentialsClient {
  final HttpClient http;
  CredentialsClient(this.http);

  Future<CredentialType> createType(
          CreateCredentialTypeRequest request) async =>
      decodeModel(await http.post('/credentials/types', request),
          CredentialType.fromJson);
  Future<List<CredentialType>> listTypes([JsonMap? options]) async =>
      decodeList(
          await http.get('/credentials/types',
              {'status': options?['status'], 'category': options?['category']}),
          CredentialType.fromJson);
  Future<CredentialType> getType(String typeId) async => decodeModel(
      await http.get('/credentials/types/$typeId'), CredentialType.fromJson);
  Future<CredentialType> updateType(
          String typeId, CreateCredentialTypeRequest request) async =>
      decodeModel(await http.put('/credentials/types/$typeId', request),
          CredentialType.fromJson);
  Future<CredentialType> activateType(String typeId) async => decodeModel(
      await http.post('/credentials/types/$typeId/activate', const {}),
      CredentialType.fromJson);
  Future<CredentialType> archiveType(String typeId) async => decodeModel(
      await http.post('/credentials/types/$typeId/archive', const {}),
      CredentialType.fromJson);
  Future<IssuedCredential> issue(IssueCredentialRequest request) async =>
      decodeModel(await http.post('/credentials/issue', request),
          IssuedCredential.fromJson);
  Future<List<IssuedCredential>> listIssued(
          [ListIssuedCredentialsOptions? options]) async =>
      decodeList(
          await http.get('/credentials/issued', {
            'user_id': options?.user_id,
            'credential_type_id': options?.credential_type_id,
            'status': options?.status,
            'limit': options?.limit,
            'offset': options?.offset
          }),
          IssuedCredential.fromJson);
  Future<IssuedCredential> revoke(String credentialId,
          [String? reason]) async =>
      decodeModel(
          await http.post(
              '/credentials/issued/$credentialId/revoke${jsTruthy(reason) ? '?reason=${encodeComponent(reason!)}' : ''}',
              const {}),
          IssuedCredential.fromJson);
  Future<IssuedCredential> suspend(String credentialId,
          [String? reason]) async =>
      decodeModel(
          await http.post(
              '/credentials/issued/$credentialId/suspend${jsTruthy(reason) ? '?reason=${encodeComponent(reason!)}' : ''}',
              const {}),
          IssuedCredential.fromJson);
  Future<IssuedCredential> reinstate(String credentialId) async => decodeModel(
      await http.post('/credentials/issued/$credentialId/reinstate', const {}),
      IssuedCredential.fromJson);
  Future<JsonMap> optInUser(String userExternalId) async => asJsonMap(
      await http.post('/credentials/opt-in/$userExternalId', const {}));
  Future<JsonMap> optOutUser(String userExternalId) async => asJsonMap(
      await http.post('/credentials/opt-out/$userExternalId', const {}));
  Future<UserCredentialsSummary> getUserCredentials(
          String userExternalId) async =>
      decodeModel(await http.get('/credentials/user/$userExternalId'),
          UserCredentialsSummary.fromJson);
  Future<CredentialVerifyResult> verify(String verificationCode) async =>
      decodeModel(await http.get('/credentials/verify/$verificationCode'),
          CredentialVerifyResult.fromJson);
}
