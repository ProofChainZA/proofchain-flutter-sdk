import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;

import 'package:proofchain_sdk/proofchain.dart';
import 'package:test/test.dart';

import 'support/local_api.dart';

void main() {
  test('SSE recovers from malformed data and delivers split UTF-8 events',
      () async {
    final api = await LocalApi.start((request) async {
      expect(request.uri.queryParameters, {
        'user_id': 'fan+sdk@example.test',
        'token': 'fixture-jwt',
        'tenant_id': 'fixture-tenant',
      });
      request.response.headers.contentType =
          io.ContentType('text', 'event-stream');
      request.response
          .write('data: {"event":"connected"}\r\n\r\ndata: invalid\n\n');
      await request.response.flush();
      final packet = utf8.encode('data: {"id":"n1","event":"points_awarded",\n'
          'data: "data":{"label":"caf\u00e9","points":7},"tenant_id":"fixture-tenant",'
          '"user_id":"fan+sdk@example.test","timestamp":"2026-10-15T10:00:00Z"}\n\n');
      final split = packet.indexOf(0xc3) + 1;
      request.response.add(packet.sublist(0, split));
      await request.response.flush();
      request.response.add(packet.sublist(split));
      await request.response.close();
    });
    final sdk = ProofChain.forEndUser(
        userToken: 'fixture-jwt', tenantId: 'fixture-tenant', baseUrl: api.url);
    addTearDown(sdk.close);
    var connects = 0;
    final malformed = Completer<Object>();
    final notification = Completer<NotificationEvent>();
    late Unsubscribe unsubscribe;
    unsubscribe = sdk.notifications.subscribe('fan+sdk@example.test', (event) {
      notification.complete(event);
      unsubscribe();
    },
        SubscribeOptions(
            onConnect: () {
              connects++;
            },
            onError: malformed.complete,
            autoReconnect: false));
    addTearDown(unsubscribe);
    final event = await notification.future.timeout(const Duration(seconds: 2));
    expect(await malformed.future, isA<FormatException>());
    expect(connects, 1);
    expect(event.event, 'points_awarded');
    expect(event.data, {'label': 'caf\u00e9', 'points': 7});
  });

  test(
      'unsubscribe during an SSE handshake suppresses callbacks and reconnects',
      () async {
    var connections = 0;
    var callbacks = 0;
    final arrived = Completer<void>();
    final release = Completer<void>();
    final finished = Completer<void>();
    final api = await LocalApi.start((request) async {
      connections++;
      arrived.complete();
      await release.future;
      try {
        request.response.headers.contentType =
            io.ContentType('text', 'event-stream');
        request.response.write('data: {"event":"connected"}\n\n');
        await request.response.close();
      } on io.SocketException {
        /* Expected when the client cancels the handshake. */
      } on io.HttpException {
        /* Expected when the client cancels the handshake. */
      } finally {
        finished.complete();
      }
    });
    final sdk =
        ProofChain(ProofChainOptions(apiKey: 'fixture-key', baseUrl: api.url));
    addTearDown(sdk.close);
    final unsubscribe = sdk.notifications.subscribe('fan', (_) {
      callbacks++;
    },
        SubscribeOptions(
            onConnect: () {
              callbacks++;
            },
            onDisconnect: () {
              callbacks++;
            },
            reconnectDelay: 1));
    await arrived.future.timeout(const Duration(seconds: 2));
    unsubscribe();
    release.complete();
    await finished.future.timeout(const Duration(seconds: 2));
    await Future<void>.delayed(const Duration(milliseconds: 20));
    expect(callbacks, 0);
    expect(connections, 1);
  });

  test('SSE reconnects after EOF and cancellation stops the next retry',
      () async {
    var connections = 0;
    var disconnects = 0;
    final api = await LocalApi.start((request) async {
      connections++;
      request.response.headers.contentType =
          io.ContentType('text', 'event-stream');
      request.response.write('data: {"event":"connected"}\n\n');
      await request.response.close();
    });
    final sdk = ProofChain(ProofChainOptions(baseUrl: api.url));
    addTearDown(sdk.close);
    final reconnected = Completer<void>();
    late Unsubscribe unsubscribe;
    unsubscribe = sdk.notifications.subscribe(
        'fan',
        (_) {},
        SubscribeOptions(
          reconnectDelay: 1,
          onConnect: () {
            if (connections == 2) {
              unsubscribe();
              reconnected.complete();
            }
          },
          onDisconnect: () {
            disconnects++;
          },
        ));
    addTearDown(unsubscribe);
    await reconnected.future.timeout(const Duration(seconds: 2));
    await Future<void>.delayed(const Duration(milliseconds: 20));
    expect(connections, 2);
    expect(disconnects, 1);
  });
}
