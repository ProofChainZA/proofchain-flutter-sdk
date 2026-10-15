import 'package:proofchain_sdk/proofchain.dart';
import 'package:proofchain_sdk/src/http.dart' show HttpClient;
import 'package:test/test.dart';

import 'support/local_api.dart';

void main() {
  test('an empty Retry-After header does not advertise an unusable delay',
      () async {
    final api = await LocalApi.start((request) async {
      request.response.headers.set('Retry-After', '');
      await respond(request, {}, status: 429);
    });
    final http = HttpClient(ProofChainOptions(baseUrl: api.url, maxRetries: 0));
    addTearDown(http.close);
    await expectLater(
        http.post('/limited'),
        throwsA(isA<RateLimitError>()
            .having((error) => error.retryAfter, 'retryAfter', isNull)));
  });
}
