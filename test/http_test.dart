import 'dart:async';
import 'dart:convert';

import 'package:proofchain_sdk/proofchain.dart';
import 'package:proofchain_sdk/src/http.dart' show HttpClient;
import 'package:test/test.dart';

import 'support/local_api.dart';

void main() {
  test('concurrent GETs settle together and a later read sees fresh state',
      () async {
    var reads = 0;
    final arrived = Completer<void>();
    final release = Completer<void>();
    final api = await LocalApi.start((request) async {
      final version = ++reads;
      if (version == 1) {
        arrived.complete();
        await release.future;
      }
      await respond(request, {'version': version});
    });
    final http = HttpClient(ProofChainOptions(baseUrl: api.url, maxRetries: 0));
    addTearDown(http.close);
    final first = http.get('/state');
    final concurrent = http.get('/state');
    await arrived.future;
    release.complete();
    final values = await Future.wait([first, concurrent])
        .timeout(const Duration(seconds: 2));
    expect(values, [
      {'version': 1},
      {'version': 1}
    ]);
    expect(await http.get('/state').timeout(const Duration(seconds: 2)),
        {'version': 2});
    expect(reads, 2);
  });

  test('identical mutations are never collapsed or replayed after a rate limit',
      () async {
    var writes = 0;
    final api = await LocalApi.start((request) async {
      await request.drain<void>();
      writes++;
      if (request.uri.path == '/limited') {
        request.response.headers.set('Retry-After', '9');
        await respond(request, {}, status: 429);
      } else {
        await respond(request, {'version': writes});
      }
    });
    final http = HttpClient(ProofChainOptions(baseUrl: api.url, maxRetries: 3));
    addTearDown(http.close);
    final values =
        await Future.wait([http.post('/state', {}), http.post('/state', {})]);
    expect(
        values.map((value) => (value as JsonMap)['version']).toList()
          ..sort((left, right) => (left as int).compareTo(right as int)),
        [1, 2]);
    await expectLater(
        http.post('/limited', {}),
        throwsA(isA<RateLimitError>()
            .having((error) => error.retryAfter, 'retryAfter', 9)));
    expect(writes, 3);
  });

  test('same-origin redirects preserve a 307 mutation and its authentication',
      () async {
    final api = await LocalApi.start((request) async {
      if (request.uri.path == '/redirect') {
        await request.drain<void>();
        request.response.statusCode = 307;
        request.response.headers.set('Location', '/final');
        await request.response.close();
        return;
      }
      final body = jsonDecode(await utf8.decoder.bind(request).join());
      await respond(request, {
        'method': request.method,
        'body': body,
        'authorized': request.headers.value('X-API-Key') == 'fixture-key'
      });
    });
    final http = HttpClient(ProofChainOptions(
        baseUrl: api.url, apiKey: 'fixture-key', maxRetries: 0));
    addTearDown(http.close);
    expect(await http.post('/redirect', {'value': 7}), {
      'method': 'POST',
      'body': {'value': 7},
      'authorized': true,
    });
  });

  test('cross-origin redirects never receive tenant credentials', () async {
    var leakedRequests = 0;
    final destination = await LocalApi.start((request) async {
      leakedRequests++;
      await respond(request, {});
    });
    final origin = await LocalApi.start((request) async {
      request.response.statusCode = 302;
      request.response.headers.set('Location', '${destination.url}/capture');
      await request.response.close();
    });
    final http = HttpClient(ProofChainOptions(
        baseUrl: origin.url,
        apiKey: 'fixture-key',
        userToken: 'fixture-jwt',
        tenantId: 'fixture-tenant',
        maxRetries: 0));
    addTearDown(http.close);
    await expectLater(
        http.post('/redirect', {}), throwsA(isA<ProofChainError>()));
    expect(leakedRequests, 0);
  });

  test('unexpected validation details cannot mask the typed HTTP error',
      () async {
    final api = await LocalApi.start((request) => respond(
        request,
        {
          'detail': 'Invalid input',
          'errors': [
            null,
            {
              'loc': ['body', 'name'],
              'msg': 'required'
            }
          ]
        },
        status: 422));
    final http = HttpClient(ProofChainOptions(baseUrl: api.url, maxRetries: 0));
    addTearDown(http.close);
    await expectLater(
        http.post('/invalid', {}),
        throwsA(isA<ValidationError>()
            .having((error) => error.statusCode, 'statusCode', 422)));
  });

  test('a header timeout aborts the request without replaying it', () async {
    var requests = 0;
    final api = await LocalApi.start((request) {
      requests++;
    });
    final http = HttpClient(
        ProofChainOptions(baseUrl: api.url, timeout: 30, maxRetries: 3));
    addTearDown(http.close);
    await expectLater(http.post('/slow', {}), throwsA(isA<TimeoutError>()));
    expect(requests, 1);
  });

  test('multipart files cannot inject headers through their filename',
      () async {
    final api = await LocalApi.start((request) async {
      final bytes =
          await request.fold<List<int>>([], (all, part) => all..addAll(part));
      final body = latin1.decode(bytes);
      await respond(request, {
        'injectedHeader': body.contains('\r\nX-Injected:'),
        'parts': 'Content-Disposition:'.allMatches(body).length,
        'hasBinary': bytes.contains(255),
      });
    });
    final http = HttpClient(ProofChainOptions(baseUrl: api.url, maxRetries: 0));
    addTearDown(http.close);
    expect(
        await http.requestMultipart('/upload', files: {
          'file': UploadFile([0, 255], filename: 'report"\r\nX-Injected: yes'),
        }),
        {'injectedHeader': false, 'parts': 1, 'hasBinary': true});
  });
}
