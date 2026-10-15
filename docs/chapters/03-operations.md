# 13. Production integration and security

## 13.1 Ownership and the application boundary

Use a session-scoped `ProofChain` instance, not a new instance in every widget `build()`. It owns the shared native HTTP connection pool and notification subscriptions. Resource objects such as `client.users` are views over that client's transport and credentials, not independently authenticated sessions. Pass the configured client into repositories/services that need it. A method that accepts a caller-owned client should not close it; the session owner closes it on sign-out, replacement, or final disposal.

A foreground notification owner should cancel its `Unsubscribe` callback when the screen/session is no longer active. The SDK does not observe Flutter's lifecycle for you. If your policy pauses streaming when the app leaves the foreground, connect that cancellation to your app's `WidgetsBindingObserver` or existing lifecycle controller, then create a new subscription on resume. Do not assume a native SSE socket will survive background suspension. Renew authentication before reconnecting if the session has expired.

The two ingestion clients do not share the main client, do not have `close()` methods, and own an HTTP transport per operation. `EndUserIngestionClient.setToken()` affects subsequent requests; it does not retroactively change an in-flight request. There is no corresponding token setter on the main `ProofChain` client.

## 13.2 Keep credentials on the correct side of the boundary

| Concern | Application rule |
|---|---|
| Tenant/admin API keys | Keep in trusted backend/native administrative processes only. Never ship them in app assets, source, build defines or obfuscated binaries. |
| End-user JWT | Obtain from your existing authenticated backend flow. Use the tenant and user context bound to that session; server authorization remains mandatory. |
| Token storage | Choose and configure secure storage at the app layer. This SDK does not persist or encrypt credentials for you. |
| Endpoint selection | Configure approved HTTPS origins. An untrusted `baseUrl`, ingestion `apiUrl`, or `ingestUrl` can receive the credentials you supply. |
| Logs and diagnostics | Redact `Authorization`, `X-API-Key`, sensitive request/response bodies and notification stream query parameters. Avoid sending personal data to crash reporters. |
| Logout/session switch | Cancel app-owned work, close the old client, clear app-owned credentials, and recreate only the resources allowed for the new session. |
| Administration | User deletion, key management, grants, minting, issuance, schema/quest/reward administration and tenant operations require appropriate server-side authorization. Merely having a client method grants nothing. |

**SSE query authentication is a compatibility constraint.** `notifications.subscribe()` builds a stream URL containing `user_id` plus `token`/`tenant_id` for JWT authentication, or `api_key` for API-key authentication. That matches the current JavaScript protocol. The application should not manually assemble or log this URL; configure reverse proxies, telemetry and access-log pipelines to redact these parameters. Never use privileged-key streaming inside a distributed mobile app.

Credentials are sent to the configured origin. The main `ProofChain` shared HTTP transport follows same-origin redirects and refuses authenticated cross-origin redirects. Standalone ingestion and native SSE use separate transports and do not implement that same explicit redirect guard; configure their approved endpoints and proxies not to redirect credentials across origins. Fix routing rather than weakening certificate verification. This SDK provides no certificate-pinning configuration hook.

## 13.3 Write semantics, duplicates and concurrent edits

The default shared transport permits network-error retries. A connection failure can occur after a server has accepted a mutation but before the client sees the response. Retrying that mutation may duplicate a user, event, issuance, payment-related operation or mint. `maxRetries: 0` disables this shared transport replay; it does not make a write atomic or prove that a failed request had no effect. Do not add blind outer retries around writes. Reconcile with authoritative server state or use an explicit backend-provided idempotency contract when that endpoint actually supports one; the SDK does not invent an idempotency key protocol.

The following helpers are not transactions:

- `events.createBatch()` calls individual creates sequentially. If an intermediate request fails, earlier events may already exist. It is not the standalone ingestion batch endpoint.
- Quest step helpers read the quest and replace its steps array. Concurrent administrators can overwrite each other's edits. Serialize editing or use a backend concurrency policy; no optimistic version check is added by the SDK.
- `quests.reorderSteps()` submits the IDs you pass. Supply the complete intended set in the desired order; omitted steps are not automatically preserved by that replacement. Unknown IDs throw before the update, but the helper is not a general duplicate/completeness validator.
- `users.removeAttributes()` reads attributes and patches a modified object. Coordinate concurrent updates rather than treating it as a field-level atomic removal endpoint.
- `users.ensureWallet()` may create wallets. Its inherited JavaScript behavior falls back to dual-wallet creation after lookup/single-wallet errors, not only after a not-found result. Do not treat it as a side-effect-free probe or proof of exactly-once provisioning.

Concurrent identical GET requests on one main client share an in-flight request. Once it settles, the entry is removed: this is neither persistent response caching nor a freshness/TTL policy. Mutations are not coalesced, and separate `ProofChain` instances do not share that in-flight map.

## 13.4 Timeouts, memory and binary data

| Path | Timeout/retry behavior |
|---|---|
| Main JSON and multipart methods | `timeout` is milliseconds, default 30000; connection/request/header deadline, not a response-body deadline. Network-error retry loop only; typed timeout and HTTP error responses are not replayed by that loop. |
| Vault binary download | Uses the connection/header deadline, buffers response bytes, and does not use the JSON transport's retry loop. Non-2xx responses become `ProofChainError`; transport/timeout failures are wrapped as `NetworkError`. |
| `users.export()` | Uses configured native URL/authentication and returns bytes. Like the source implementation, HTTP error statuses are not converted to typed exceptions; error-response bytes can therefore be returned. |
| Ingestion single request | Whole-operation deadline, no retries. Ingest timeout is surfaced as `NetworkError`. |
| Ingestion batch | Twice the configured ingestion timeout, no retries. Batch-size validation happens before network I/O. |
| Direct `getEventStatus()` | Whole-operation deadline; timeout is a `dart:async` `TimeoutException`, unlike ingest/ingestBatch. |
| Notifications | Separate SSE lifecycle and reconnect options. Do not assume the main client's JSON timeout describes the entire lifetime of a stream. |

A `Future.timeout()` in application code can stop waiting without canceling the underlying SDK request. It is not a rollback mechanism and does not provide a public per-request abort handle. Avoid presenting a timed-out mutation as certainly uncommitted.

`UploadFile` takes an in-memory byte list. Vault downloads and user exports return a fully buffered `Uint8List`. There is no public chunked upload, download-to-file stream, progress callback or resume API. Size and validate files before reading them into memory; choose app-specific limits based on device memory and backend policy. File picking, media permissions, temporary-directory selection and opening/sharing a downloaded file belong to the app and its chosen plugins. SDK networking itself does not require adding camera or broad storage permissions.

# 14. JavaScript migration and troubleshooting

## 14.1 Mechanical migration rules

| JavaScript concept | Dart implementation |
|---|---|
| Main package import | `import 'package:proofchain_sdk/proofchain.dart';` |
| Named interface argument | A model with named constructor parameters, such as `UserEventHistoryOptions(days: 3, limit: 50)`. |
| Anonymous object / `Partial<T>` input | `JsonMap`, retaining the actual expected wire keys. |
| Optional positional argument | Remains positional. Do not turn `byUser(userId, options)` into `byUser(userId, options: options)`. |
| Promise | `Future<T>`; use `await` and typed exception handling. |
| File / Blob / Buffer input | `UploadFile(bytes, filename: ..., contentType: ...)`, often inside a typed request. Endpoint request-level filename fields can override the file's name. |
| Binary result | `Uint8List`; storage/display is the app's responsibility. |
| String-literal union | Dart `String` alias. The server still validates allowed values. |
| JSON key casing | Preserved, including snake_case. Do not mechanically camel-case every field. |
| Reserved Dart member | A `Value` suffix where required, e.g. `SchemaField.defaultValue` serializes under `default`. |
| Browser notifications | Native SSE is implemented. Web Push registration/service-worker source methods remain; the browser permission helper returns null on native. |
| Embedded wallet provider | Not ported by this package. Main SDK wallet REST methods remain available. |

`fromJson()` retains the original wire map, including unknown fields and explicit nulls. A normal named constructor omits optional null fields in `toJson()`. Use a `JsonMap` update or a request's `fromJson()` when an explicit JSON null is the intended payload. Do not rely on mutating a response's raw map to update its already decoded typed getters; treat response models and their raw maps as read-only snapshots.

Not all similarly named types have the same purpose. `ValidationError` is an HTTP exception; `SchemaValidationError` is a schema-validation model. `AttestationRecord` is distinct from document `AttestationResult`. User wallet creation uses `CreateUserWalletRequest`; wallet resource creation uses its own request type. Reward verification is `RewardVerifyResult`. These names resolve collisions in the exported JavaScript surface.

## 14.2 Troubleshooting by symptom

| Symptom | Check / corrective action |
|---|---|
| Package import cannot be resolved | Verify the registry constraint or path relative to the app's pubspec, run `flutter pub get` in the app, and use `package:proofchain_sdk/proofchain_sdk.dart`. GitHub source changes are not available through pub until a new version is published. |
| Build targets a browser | This package imports `dart:io`; choose Android/iOS/native Dart. A browser-compatible transport is not included. |
| Works in debug but not Android release | Verify `INTERNET` is in the main manifest, not only a debug variant. Inspect the release build's actual endpoint and certificate trust. |
| 401 | Check JWT expiration or the trusted process's API key. Replace the main client after token refresh. Do not print credentials while debugging. |
| 403 | Check server-side authorization, tenant identity and user scope. Do not insert an admin key into the mobile app. Ingestion maps some non-401/validation/rate/server statuses to the base `ProofChainError`, rather than the main transport's specialized class. |
| Wrong tenant or route/404 | Distinguish `tenant` slug from `tenantId`; explicitly configure the correct base path, including `/api` when the deployment requires it. External and internal user IDs are not interchangeable. |
| Validation details are not `{field, message}` | Inspect/redact `ValidationError.rawErrors`; do not unconditionally read the typed `errors` getter on an arbitrary server detail shape. |
| 429 is not retried | Expected current source behavior. `retryAfter` is seconds when numeric; null or non-finite values need an application fallback. HTTP-date Retry-After values are not parsed as dates. |
| Request exceeds the configured milliseconds | Main timeout stops at response headers; retries add elapsed time, and response-body reading has no main whole-operation deadline. |
| Export bytes do not decode as expected CSV | The inherited export method can return an HTTP error body as bytes. Do not equate a nonempty buffer with successful authorized export or show raw bytes as user-facing error text. |
| Required response getter throws | Check raw `toJson()` and API version/response shape. The typed source interfaces can require keys omitted by the server; a typed getter is not a runtime completeness guarantee. |
| Notification stream is silent/disconnects | Verify authorized user/tenant, proxy SSE support, server connectivity and app foreground state. Inspect sanitized callbacks. Do not assume background push or automatic token refresh. |
| Duplicate writes after a connectivity failure | Reconcile server state before replay. Disable automatic network retries for sensitive sessions/operations where the backend lacks a safe idempotency contract. |
| Local development endpoint is unreachable from a device | The device's loopback host is not your development workstation. Use your platform's documented simulator/emulator networking and an approved reachable development endpoint; avoid globally weakening TLS. |

## 14.3 Platform behavior that must not be mistaken for parity

The port mirrors the current local JavaScript API, not every browser capability or every possible backend version. Native `users.export()` uses the SDK's configured base URL and credentials instead of browser-relative fetch and returns `Uint8List`. The main client's shared HTTP transport deliberately refuses authenticated cross-origin redirects; this is not a blanket guarantee for standalone ingestion or SSE. Dart URI normalization may render RFC3986-equivalent unreserved characters differently without changing the URL's meaning.

`requestPermissionAndSubscribe()` does not request Android/iOS notification permission and returns null. Generated service-worker source is for a separate browser deployment, not a native isolate. FCM/APNs integration, reliable background delivery, embedded wallet signing/provider UX, login/token refresh, offline persistence/queues and Flutter Web are not supplied by this package. Do not label an app as supporting these simply because an adjacent REST method exists.

# 15. Development, verification and release checklist

## 15.1 SDK checks

From the Flutter SDK package root, with Dart on PATH:

```sh
dart pub get
dart analyze
dart test
dart format --output=none --set-exit-if-changed lib example test
```

The maintainer-only model generator requires the upstream JavaScript SDK package at `../javascript`, including its `src/` tree and installed TypeScript development dependency. That upstream checkout is not bundled in the standalone public Flutter repository and is not needed to consume the SDK or generate Dart API documentation. Run the first command in the upstream JavaScript package and the remaining commands in the Flutter SDK package:

```sh
npm ci
```

```sh
node tool/generate_models.mjs --check
```

After reviewing changes to JavaScript interfaces, regenerate intentionally:

```sh
node tool/generate_models.mjs
```

`DART=/absolute/path/to/dart` selects the formatter used by the model generator. Generated models must not be edited by hand. Generation covers model declarations; it does not automatically implement newly added JavaScript resource methods. Review method signatures, URL/body mapping, return decoding and observable error behavior whenever the reference SDK changes.

## 15.2 Rebuild this guide

The documentation builder has its own private Dart package under `tool/docs`; its analyzer/Markdown dependencies are not runtime dependencies of `proofchain_sdk`. It requires Dart 3.13 or newer and a Chromium-family executable for PDF generation. The example checker statically analyzes standalone native Dart code blocks from these chapters; Flutter-importing blocks are explicitly reported as not checked by that native-only step.

From the package's `tool/docs` directory:

```sh
dart pub get
dart analyze
dart test
dart run build_guide.dart --check-examples --pdf
```

Set `CHROME_BIN` to your Chromium/Chrome executable path if it is not named `chromium`. The builder refreshes the source-derived API reference, JSON reference manifest, self-contained HTML and `docs/proofchain-flutter-sdk-developer-guide.pdf`. Run `dart run build_guide.dart` without `--pdf` to regenerate the editable/viewable HTML and reference without launching a renderer. Author chapters 01–03 and `docs/print.css`; chapter 04 is generated. Treat the PDF as an output artifact, not the editable source.

## 15.3 Before releasing an app

- Use a reviewed SDK checkout and verify the app's actual release dependency resolution.
- Analyze and test the app; run its Android/iOS release builds on the appropriate host/toolchains. iOS signing and distribution require the corresponding Apple environment.
- Exercise real tenant/user authorization in an approved test environment: expired token, wrong tenant, forbidden operation, missing resource, validation and rate-limit paths.
- Verify the main Android manifest and the configured HTTPS deployment on real devices; do not substitute desktop HTTP fixture tests for platform checks.
- Exercise foreground/background/resume, account switch and logout with SSE active, including reconnection after the network changes.
- Check that stale asynchronous results cannot update disposed widgets or a newly authenticated session.
- Verify upload/download sizes, filenames and error handling under realistic device memory and network conditions.
- Ensure no API key is distributed and no JWT or SSE query credential appears in app/proxy/crash logs.
- Reconcile ambiguous write failures before enabling retry/replay behavior; verify any backend idempotency promises separately.
- Pin a reviewed published SDK release, or explicitly select a reviewed path/Git checkout. A GitHub push does not replace an immutable pub.dev release.

The prior native implementation verification establishes local behavior and source compatibility, not production deployment readiness. Documentation checks establish that the examples agree with current Dart declarations and that the PDF renders; they do not authenticate a live tenant, mint a real token, provision a wallet or validate a device build.

## 15.4 Initial guide verification (0.1.0)

These results were recorded for the initial guide edition. They are historical
evidence, not a substitute for running the current checkout's release checks.

| Check | Observed result |
|---|---|
| Documentation tool analysis | Dart 3.13.5; no issues |
| Renderer-security regression tests | 3 passed; active HTML/assets are removed and declaration/example text remains literal |
| Native Dart example analysis | All 28 standalone examples passed against this SDK checkout |
| Executed sample workflows | 10 real loopback HTTP/SSE requests covering initialization, profile updates, two-page pagination, multipart/binary round-trip, end-user ingestion, notification lifecycle, environment configuration and safe CLI failure boundaries |
| Flutter screen / Android/iOS | Not built or device-tested; Flutter toolchain unavailable in this documentation session |
| Live service / production credentials | Not used; smoke scenarios used fixture credentials and local servers only |

The PDF is an implementation guide, not a claim of device certification,
production-tenant access, background push integration or package publication.
