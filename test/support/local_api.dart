import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;

import 'package:test/test.dart';

class LocalApi {
  final io.HttpServer _server;
  String get url => 'http://127.0.0.1:${_server.port}';
  LocalApi._(this._server);

  static Future<LocalApi> start(
      FutureOr<void> Function(io.HttpRequest) handle) async {
    final server = await io.HttpServer.bind(io.InternetAddress.loopbackIPv4, 0);
    addTearDown(() => server.close(force: true));
    server.listen((request) async {
      try {
        await handle(request);
      } catch (error, stack) {
        Zone.current.handleUncaughtError(error, stack);
      }
    });
    return LocalApi._(server);
  }
}

Future<void> respond(io.HttpRequest request, Object? body,
    {int status = 200}) async {
  request.response.statusCode = status;
  request.response.headers.contentType = io.ContentType.json;
  request.response.write(jsonEncode(body));
  await request.response.close();
}
