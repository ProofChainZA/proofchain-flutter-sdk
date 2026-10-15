# proofchain_sdk

Dart client for the ProofChain API on Flutter (Android, iOS) and the Dart VM.
It mirrors the ProofChain JavaScript SDK: 24 resource namespaces, typed
request/response models, API-key/JWT authentication, multipart uploads, binary
downloads, standalone ingestion and SSE notifications.

Flutter Web is not supported.

## Install

```yaml
dependencies:
  proofchain_sdk: ^0.1.0
```

Android apps need `android.permission.INTERNET` in `AndroidManifest.xml`.
Default endpoints use HTTPS, so no iOS ATS exception is required. The package
has no runtime dependencies and no Flutter plugins.

## Usage

Use end-user JWTs in distributed apps. Never embed a tenant/admin API key in an
app binary.

```dart
import 'package:proofchain_sdk/proofchain_sdk.dart';

Future<UserEventHistoryResponse> loadHistory(String jwt, String userId) async {
  final client = ProofChain.forEndUser(
    userToken: jwt,
    tenantId: 'acme',
    baseUrl: tenantApiUrl('acme'),
  );
  try {
    return await client.search.byUser(
      userId,
      const UserEventHistoryOptions(days: 3, limit: 50),
    );
  } finally {
    client.close();
  }
}
```

`package:proofchain_sdk/proofchain.dart` exports the same API.

Call `client.close()` when finished; keep a client alive for active
subscriptions.

## Documentation

The full developer guide (setup, authentication, recipes, error handling and
API reference) is available publicly:

- [Dart API documentation](https://pub.dev/documentation/proofchain_sdk/latest/)
- [Developer guide (PDF)](https://github.com/ProofChainZA/proofchain-flutter-sdk/blob/main/docs/proofchain-flutter-sdk-developer-guide.pdf)
- [Developer guide (HTML source/download)](https://github.com/ProofChainZA/proofchain-flutter-sdk/blob/main/docs/developer-guide.html)
- [JavaScript-to-Dart migration and platform notes](https://github.com/ProofChainZA/proofchain-flutter-sdk/blob/main/docs/chapters/03-operations.md#14-javascript-migration-and-troubleshooting)
- [Public SDK source and issues](https://github.com/ProofChainZA/proofchain-flutter-sdk)

## Runnable example

Configure `PROOFCHAIN_USER_TOKEN`, `PROOFCHAIN_TENANT_ID`, and
`PROOFCHAIN_USER_ID` through your development environment or secret manager.
Do not commit tokens or put privileged API keys in a distributed app.

```sh
dart run example/proofchain_sdk_example.dart
```

The example performs a passport read with an end-user JWT, emits only curated
status output, and closes its client. See [example configuration](https://github.com/ProofChainZA/proofchain-flutter-sdk/blob/main/example/README.md)
for the optional trusted API URL and exit codes.

## Development and verification

From this package's root:

```sh
dart pub get
dart analyze
dart test
dart format --output=none --set-exit-if-changed lib example test
dart doc --validate-links
dart pub publish --dry-run
```

The core lint configuration matches pub.dev's baseline. The generated model file
retains JavaScript/JSON field casing deliberately; its naming-lint exception is
limited to that generated file. Dartdoc comments and the executable `example/`
are included in the published package. The larger PDF/HTML and their private
builder remain in this repository, not in the pub archive.

Model regeneration is a maintainer-only operation. It requires the upstream
JavaScript SDK package at `../javascript`, including its `src/` tree and installed
TypeScript development dependency (`npm ci` in that package). Consumers do not
need JavaScript, Node.js, or the generator:

```sh
node tool/generate_models.mjs --check
```

Regenerate with `node tool/generate_models.mjs` after reviewing upstream type
changes; `DART=/path/to/dart` overrides its formatter. Resource behavior still
requires a separate parity review. See [guide build instructions](https://github.com/ProofChainZA/proofchain-flutter-sdk/blob/main/docs/README.md)
for the private Dart 3.13+ PDF builder.

GitHub publication does not replace an existing pub.dev version. The changelog
and source may describe a prepared patch before that patch is released to pub;
publish a new version only after package validation and release authorization.
