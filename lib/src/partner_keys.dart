import 'http.dart';
import 'json.dart';
import 'models.dart';

class PartnerKeysClient {
  final HttpClient http;
  PartnerKeysClient(this.http);

  Future<OTTGenerateResponse> generate([OTTGenerateRequest? options]) async =>
      decodeModel(await http.post('/partner-keys/generate', options ?? {}),
          OTTGenerateResponse.fromJson);

  Future<OTTRedeemResponse> redeem(String ott) async => decodeModel(
      await http.post('/partner-keys/redeem', {'ott': ott}),
      OTTRedeemResponse.fromJson);

  Future<OTTConfigResponse> updateOTTConfig(
          String keyId, OTTConfigUpdate config) async =>
      decodeModel(await http.patch('/partner-keys/$keyId/ott-config', config),
          OTTConfigResponse.fromJson);

  Future<OTTConfigResponse> getOTTConfig(String keyId) async => decodeModel(
      await http.get('/partner-keys/$keyId/ott-config'),
      OTTConfigResponse.fromJson);

  @Deprecated('Use generate()')
  Future<OTTGenerateResponse> requestOTT(String keyId) => generate();
}
