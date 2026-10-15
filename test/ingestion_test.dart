import 'dart:convert';

import 'package:proofchain_sdk/proofchain.dart';
import 'package:test/test.dart';

import 'support/local_api.dart';

void main() {
  test('valid non-object error JSON still produces a status-derived error',
      () async {
    final api =
        await LocalApi.start((request) => respond(request, [], status: 500));
    final client = IngestionClient(
        IngestionClientOptions(apiKey: 'fixture-key', ingestUrl: api.url));
    await expectLater(
        client
            .ingest(const IngestEventRequest(userId: 'fan', eventType: 'view')),
        throwsA(isA<ServerError>()
            .having((error) => error.statusCode, 'statusCode', 500)));
  });

  test('direct and end-user batch limits reject overflow before network I/O',
      () async {
    var requests = 0;
    final api = await LocalApi.start((request) async {
      requests++;
      await respond(request, {});
    });
    const event = IngestEventRequest(userId: 'fan', eventType: 'view');
    final direct = IngestionClient(
        IngestionClientOptions(apiKey: 'fixture-key', ingestUrl: api.url));
    final endUser = EndUserIngestionClient(EndUserIngestionClientOptions(
        userToken: 'fixture-jwt', tenantId: 'fixture-tenant', apiUrl: api.url));
    await expectLater(
        direct
            .ingestBatch(BatchIngestRequest(events: List.filled(1001, event))),
        throwsA(isA<ValidationError>()));
    await expectLater(
        endUser
            .ingestBatch(BatchIngestRequest(events: List.filled(101, event))),
        throwsA(isA<ValidationError>()));
    expect(requests, 0);
  });

  test('end-user token rotation applies to the next ingestion operation',
      () async {
    var accepted = 0;
    final api = await LocalApi.start((request) async {
      await request.drain<void>();
      final expected =
          accepted == 0 ? 'Bearer first-jwt' : 'Bearer refreshed-jwt';
      if (request.headers.value('Authorization') != expected) {
        await respond(request, {'detail': 'stale JWT'}, status: 401);
      } else {
        accepted++;
        await respond(request, {
          'event_id': 'event-$accepted',
          'certificate_id': 'cert',
          'status': 'queued'
        });
      }
    });
    final client = EndUserIngestionClient(EndUserIngestionClientOptions(
        userToken: 'first-jwt', tenantId: 'fixture-tenant', apiUrl: api.url));
    const event = IngestEventRequest(userId: 'fan', eventType: 'view');
    expect((await client.ingest(event)).eventId, 'event-1');
    client.setToken('refreshed-jwt');
    expect((await client.ingest(event)).eventId, 'event-2');
  });

  test('end-user ingestion cannot claim privileged client provenance',
      () async {
    final api = await LocalApi.start((request) async {
      final body =
          jsonDecode(await utf8.decoder.bind(request).join()) as JsonMap;
      if (body.containsKey('event_source') ||
          request.headers.value('X-Schemas') != null) {
        await respond(request, {'detail': 'client provenance is forbidden'},
            status: 403);
      } else {
        await respond(request, {
          'event_id': 'accepted',
          'certificate_id': 'cert',
          'status': 'queued'
        });
      }
    });
    final client = EndUserIngestionClient(EndUserIngestionClientOptions(
        userToken: 'fixture-jwt', tenantId: 'fixture-tenant', apiUrl: api.url));
    final result = await client.ingest(const IngestEventRequest(
        userId: 'fan',
        eventType: 'view',
        eventSource: 'polymarket',
        schemaIds: ['privileged-schema']));
    expect(result.eventId, 'accepted');
  });
}
