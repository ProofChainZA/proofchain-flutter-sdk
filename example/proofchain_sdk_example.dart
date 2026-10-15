import 'dart:io';

import 'package:proofchain_sdk/proofchain_sdk.dart';

/// Reads the authenticated user's passport without printing personal data.
///
/// Required environment: PROOFCHAIN_USER_TOKEN (end-user JWT),
/// PROOFCHAIN_TENANT_ID, and PROOFCHAIN_USER_ID (the authorized passport user).
/// Optional PROOFCHAIN_BASE_URL selects an API root, including a loopback server.
Future<void> main(List<String> arguments) async {
  final environment = Platform.environment;
  const requiredVariables = [
    'PROOFCHAIN_USER_TOKEN',
    'PROOFCHAIN_TENANT_ID',
    'PROOFCHAIN_USER_ID',
  ];
  final missing = requiredVariables
      .where((name) => (environment[name] ?? '').trim().isEmpty)
      .toList(growable: false);
  if (arguments.isNotEmpty || missing.isNotEmpty) {
    stderr.writeln('Usage: dart run example/proofchain_sdk_example.dart');
    stderr.writeln('Set PROOFCHAIN_USER_TOKEN, PROOFCHAIN_TENANT_ID, and '
        'PROOFCHAIN_USER_ID in your environment.');
    stderr
        .writeln('Optional: PROOFCHAIN_BASE_URL (defaults to the public API).');
    stderr.writeln('Use an end-user JWT, never a backend API key.');
    exitCode = 64;
    return;
  }

  final configuredUrl = environment['PROOFCHAIN_BASE_URL'];
  if (configuredUrl != null) {
    final uri = Uri.tryParse(configuredUrl);
    final loopback = uri != null &&
        (uri.host == 'localhost' ||
            (InternetAddress.tryParse(uri.host)?.isLoopback ?? false));
    if (uri == null ||
        !uri.hasAuthority ||
        uri.userInfo.isNotEmpty ||
        uri.hasQuery ||
        uri.hasFragment ||
        (uri.scheme != 'https' && !(uri.scheme == 'http' && loopback))) {
      stderr.writeln('PROOFCHAIN_BASE_URL must be an HTTPS API root '
          '(HTTP is allowed only for loopback development).');
      exitCode = 64;
      return;
    }
  }

  final client = ProofChain.forEndUser(
    userToken: environment['PROOFCHAIN_USER_TOKEN']!,
    tenantId: environment['PROOFCHAIN_TENANT_ID']!,
    baseUrl: configuredUrl,
  );
  try {
    await client.passports.get(environment['PROOFCHAIN_USER_ID']!);
    stdout.writeln('Passport read succeeded. No personal data is displayed.');
  } on AuthenticationError {
    stderr.writeln('Authentication failed. Obtain a valid end-user JWT.');
    exitCode = 1;
  } on AuthorizationError {
    stderr.writeln('Access denied. Check the token tenant and user scope.');
    exitCode = 1;
  } on NotFoundError {
    stderr.writeln('Passport not found for the configured user.');
    exitCode = 1;
  } on RateLimitError {
    stderr.writeln('Rate limit reached. Try again later.');
    exitCode = 1;
  } on TimeoutError {
    stderr.writeln('The request timed out before response headers arrived.');
    exitCode = 1;
  } on NetworkError {
    stderr
        .writeln('Network request failed. Check connectivity and API routing.');
    exitCode = 1;
  } on ProofChainError {
    stderr
        .writeln('The API rejected the read. No server payload is displayed.');
    exitCode = 1;
  } catch (_) {
    stderr.writeln(
        'Unable to read the passport. No sensitive details displayed.');
    exitCode = 1;
  } finally {
    client.close();
  }
}
