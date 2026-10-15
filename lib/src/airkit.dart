import 'http.dart';
import 'json.dart';
import 'models.dart';

class AirKitClient {
  final HttpClient http;
  AirKitClient(this.http);

  Future<AirKitSessionResponse> createSession() async => decodeModel(
      await http.post('/airkit/session'), AirKitSessionResponse.fromJson);
}
