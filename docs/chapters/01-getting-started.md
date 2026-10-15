# 1. Scope, status, and platform boundaries

This guide describes source version `0.1.1` of the native Dart package
`proofchain_sdk`. Its canonical public entrypoint is
`package:proofchain_sdk/proofchain_sdk.dart`; the existing `proofchain.dart`
entrypoint exports the same API. The package mirrors the JavaScript SDK's API
surface and wire behavior; it is not a JavaScript bridge and does not run Node.js.

## 1.1 What you can build

Use the package from Flutter on Android/iOS or from a native Dart VM application.
Its transport uses `dart:io`; **Flutter Web and browser Dart are not supported**.
The package requires Dart `>=3.4.0 <4.0.0` and has no runtime package dependencies.
A Flutter app still depends on the Flutter SDK normally.

The main client exposes REST resources, including users, events, quests, rewards,
passports, credentials, and wallet REST operations. Native server-sent events
(SSE) are available through the notification client. SSE is an application
connection, not FCM/APNs push delivery, and does not imply reliable background
execution on a phone. The separate embedded `wallet-sdk` is outside this package
and this guide. `ProofChain.wallets` does not establish an embedded signing UI or
local private-key custody.

## 1.2 Evidence and limits

Before this documentation task, the implementation was reported as passing
analysis under Dart 3.13.5, 17 behavior tests, and 583 runtime parity scenarios
against the local JS SDK. Those are prior implementation results, not checks run
while writing these chapters. Android/iOS builds, physical devices, and platform
lifecycle behavior have **not** been verified by that evidence. A successful
parity case also does not establish that a particular production JWT may call an
endpoint: the server still decides authorization.

Examples use replaceable synthetic fixtures such as tenant slug `acme`, tenant
identifier `tenant-demo`, user identifier `user-demo`, and quest identifier
`quest-demo`. These are not provisioned accounts. Obtain real identifiers and an
appropriately scoped JWT through your existing authenticated application flow.
Never copy a privileged API key into a mobile application to make an example
succeed.

# 2. Install the package and configure networking

## 2.1 Use a published release or a reviewed local checkout

The package is available on pub.dev. In your app's `pubspec.yaml`, merge this
dependency into the existing `dependencies` section:

```yaml
dependencies:
  flutter:
    sdk: flutter
  proofchain_sdk: ^0.1.0
```

The constraint accepts compatible published 0.1.x releases. A GitHub push does
not publish a new registry version. To use source changes that have not yet been
released, clone the public Flutter SDK repository beside your app instead:

```text
workspace/
  mobile_app/
    pubspec.yaml
    lib/
  proofchain-flutter-sdk/
    pubspec.yaml
    lib/proofchain_sdk.dart
```

Replace the registry dependency with a path dependency; do not declare both:

```yaml
dependencies:
  flutter:
    sdk: flutter
  proofchain_sdk:
    path: ../proofchain-flutter-sdk
```

The path is relative to the app's `pubspec.yaml`, not the shell's working
directory. From `workspace/mobile_app`, run:

```sh
flutter pub get
```

For a native Dart application, omit the Flutter SDK dependency and run
`dart pub get` from that application's root. Import a public entrypoint rather
than `lib/src` files. Path dependencies reflect the local checkout, so pin and
review the source used by your team and CI.

## 2.2 Android: grant Internet access in the main manifest

In the app's `android/app/src/main/AndroidManifest.xml`, add the Internet
permission as a direct child of the existing `manifest` element, outside
`application`. A permission present only in a debug manifest does not establish
release-app access.

```xml
<uses-permission android:name="android.permission.INTERNET" />
```

This is a manifest declaration, not a runtime permission prompt. Use HTTPS and
normal certificate verification. Do not broadly enable cleartext traffic to
work around a deployment or certificate problem.

## 2.3 iOS: keep HTTPS and transport security intact

The default service URLs use HTTPS. Use a trusted HTTPS endpoint for custom
`baseUrl` values as well. Do not add `NSAllowsArbitraryLoads`, disable certificate
verification, or add broad App Transport Security exceptions for this SDK.
The package does not configure your app's `Info.plist`, signing, deployment
target, or network entitlements. Check device reachability and certificate trust
in your app's environment; a desktop Dart request is not an iOS deployment test.

# 3. Choose routing, credentials, and client lifetime

## 3.1 Endpoint precedence

`ProofChain(ProofChainOptions(...))` selects its base URL in this order:

1. A nonempty `baseUrl`, used explicitly.
2. Otherwise a nonempty `tenant` slug, expanded by `tenantApiUrl(tenant)` to
   `https://<slug>.proofchain.co.za/api`.
3. Otherwise `https://api.proofchain.co.za`.

One trailing slash is removed. The SDK appends resource paths to that base; it
does not automatically add `/api` to an explicit URL. For example, an explicit
`https://acme.proofchain.co.za/api` keeps the `/api` path. Configure the exact base
agreed with your service operator.

`tenant` is a hostname-routing slug. `tenantId` is the tenant identity sent with
an end-user bearer token; they are not interchangeable. Setting `tenantId` alone
does not change the base URL. `forEndUser` accepts `tenantId` and an optional
explicit `baseUrl`, but no `tenant` slug argument.

| `ProofChainOptions` field | Type | Default / behavior |
| --- | --- | --- |
| `apiKey` | `String?` | Unset; nonempty value sends `X-API-Key`. Trusted backend only. |
| `userToken` | `String?` | Unset; nonempty value sends `Authorization: Bearer …`. |
| `tenantId` | `String?` | Unset; sends `X-Tenant-ID` only when both token and tenant ID are nonempty. |
| `baseUrl` | `String?` | Explicit endpoint; wins over `tenant`. Empty string falls through. |
| `tenant` | `String?` | Optional routing slug; wins over the global default. |
| `timeout` | `num?` | Milliseconds; omitted or zero uses `30000`, converted to an integer. |
| `maxRetries` | `num?` | `3`; `0` disables transport network-error retries. |

Use sensible positive integer timeout values and nonnegative integer retry
counts even though the signatures use `num`. Timeout covers opening a connection,
sending the request, redirects, and obtaining response headers; it is **not** a
whole-response-body or full-operation deadline. Retry delays add elapsed time.

The shared HTTP transport retries network failures, not HTTP status responses.
It does not automatically retry 429, 401, 403, or 5xx responses, and its typed
`TimeoutError` is not retried by that network-failure loop. The default permits
up to three retries after the initial transport attempt. See chapter 5 before
allowing retries around writes.

## 3.2 Mobile: use an end-user JWT

Your authenticated host supplies the JWT, tenant ID, and user identity. The SDK
does not implement login, exchange credentials for tokens, store tokens, refresh
tokens, or select a secure-storage package. Token acquisition and persistence
remain application/backend responsibilities. Do not log tokens or put them in
source code, assets, crash reports, URLs, or production build-time defines.

This standalone library creates a client from already acquired credentials. It
makes no network request; its caller owns and must close the returned client.
`baseUrl` should come from trusted application configuration, not untrusted UI
input. Credentials are sent to that endpoint.

```dart
import 'package:proofchain_sdk/proofchain.dart';

ProofChain createMobileClient({
  required String jwt,
  required String tenantId,
  String? baseUrl,
}) {
  return ProofChain.forEndUser(
    userToken: jwt,
    tenantId: tenantId,
    baseUrl: baseUrl,
    timeout: 30000,
    maxRetries: 0,
  );
}
```

The JWT is a capability, not proof that every resource is accessible. A
particular read or write can still receive 403. This example chooses zero
network retries to make transport replay an explicit application decision;
that is not an assertion that all reads require zero retries.

Client credentials are fixed at construction. On refresh or account/tenant
switch, stop subscriptions using the old credentials, replace the main
`ProofChain` client, and restart only the subscriptions the new session may use.
`ProofChain.close()` closes its notifications and HTTP transport. Explicitly
cancel any app-owned stream listeners/timers as well. Do not keep resource
objects from the old client and expect them to pick up a new token. Closing is
resource cleanup, not a public per-request cancellation API or a guarantee that
a write already accepted by the server was rolled back.

## 3.3 Backend-only API keys and environment configuration

Use privileged API keys only in a trusted server or administrative Dart VM
process. Mobile binaries, obfuscation, and build defines cannot keep such keys
secret. Although the generic options allow both auth fields, do not combine a
privileged key with an end-user token to bypass mobile authorization.

`ProofChain.fromEnv()` reads exactly `PROOFCHAIN_API_KEY` and
`PROOFCHAIN_BASE_URL` from `Platform.environment`. It throws `StateError` if the
API key is absent or empty. It does not load `.env` files, read `--dart-define`,
or read JWT, tenant ID, tenant slug, timeout, or retry environment variables.
Supply those through explicit options when needed. Environment configuration is
for the trusted Dart process, not a mobile secret-injection strategy.

This standalone backend program uses the deployment-provided environment. Its
`tenantInfo()` call requires authorization. No credentials are embedded:

```dart
import 'dart:io' show exitCode, stderr;
import 'package:proofchain_sdk/proofchain.dart';

Future<void> main() async {
  ProofChain? client;
  try {
    client = ProofChain.fromEnv();
    await client.tenantInfo();
    print('Authorized tenant information was received.');
  } catch (_) {
    stderr.writeln('Tenant lookup failed. Check configuration and credentials.');
    exitCode = 1;
  } finally {
    client?.close();
  }
}
```

# 4. Read data and integrate an authenticated Flutter screen

## 4.1 First executable API read

This complete native Dart program takes an ephemeral local-demo JWT, tenant ID,
and known external user ID as arguments. It reads `users.get(externalId)`;
`getByInternalId` is a different method. Run it only with a disposable demo token
in a controlled local environment: command arguments can appear in process
listings or shell history and are not a production credential channel. The
program deliberately does not print the user payload or token.

Save as `bin/read_user.dart` in a Dart/Flutter project with the path dependency.
Invoke with three actual demo arguments using `dart run bin/read_user.dart`.
There are no bundled credentials, fake responses, or authentication endpoints.
The token must be authorized to read the supplied external user.

```dart
import 'dart:io' show exitCode, stderr;
import 'package:proofchain_sdk/proofchain.dart';

Future<void> main(List<String> args) async {
  if (args.length != 3) {
    stderr.writeln('Expected a local-demo JWT, tenant ID, and external user ID.');
    exitCode = 64;
    return;
  }
  final client = ProofChain.forEndUser(
    userToken: args[0],
    tenantId: args[1],
    maxRetries: 0,
  );
  try {
    final user = await client.users.get(args[2]);
    print('User read completed; status: ${user.status}');
  } catch (_) {
    stderr.writeln('User read failed. Check the demo session and permissions.');
    exitCode = 1;
  } finally {
    client.close();
  }
}
```

Creation occurs before `try` because no owned client exists if construction
fails. Once construction succeeds, `finally` runs for both successful reads and
exceptions. In a long-lived app, retain a client for the authenticated session
rather than constructing and closing one in every widget build.

## 4.2 Flutter integration: a complete authenticated screen library

The following is Flutter-only code. Save it as `lib/proofchain_app.dart` in a
Flutter app with the Flutter SDK and `proofchain_sdk` path dependencies. It is a
complete library, not a replacement authentication implementation.

`buildProofChainApp` is the entry into an **existing authenticated bootstrap**:
call it instead of that bootstrap's existing `runApp` once it has a real JWT,
tenant ID, and user ID. It calls `runApp` itself; do not nest it inside another
widget builder. It intentionally has no invented `main` or login API. A host
that already owns the top-level `MaterialApp` can instead mount
`ProofChainEventsScreen` under that app, supplying the same constructor values.

Here `userId` is the user identifier expected by the events API, not automatically
a `users.get` external ID. Use the correct identity from your host's authorized
session/domain mapping. This requests the first 20 matching events, not a
complete paginated history. The server must permit the JWT to list those events.

```dart
import 'package:flutter/material.dart';
import 'package:proofchain_sdk/proofchain.dart' as pc;

void buildProofChainApp({
  required String jwt,
  required String tenantId,
  required String userId,
  String? baseUrl,
}) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'ProofChain activity',
    home: ProofChainEventsScreen(
      jwt: jwt,
      tenantId: tenantId,
      userId: userId,
      baseUrl: baseUrl,
    ),
  ));
}

class ProofChainEventsScreen extends StatefulWidget {
  const ProofChainEventsScreen({
    super.key,
    required this.jwt,
    required this.tenantId,
    required this.userId,
    this.baseUrl,
  });

  final String jwt;
  final String tenantId;
  final String userId;
  final String? baseUrl;

  @override
  State<ProofChainEventsScreen> createState() => _EventsState();
}

class _EventsState extends State<ProofChainEventsScreen> {
  late pc.ProofChain _client;
  late Future<List<pc.Event>> _events;

  @override
  void initState() {
    super.initState();
    _openSession();
  }

  void _openSession() {
    _client = pc.ProofChain.forEndUser(
      userToken: widget.jwt,
      tenantId: widget.tenantId,
      baseUrl: widget.baseUrl,
      maxRetries: 0,
    );
    _events = _readEvents();
  }

  Future<List<pc.Event>> _readEvents() {
    return _client.events.list(pc.ListEventsRequest(
      userId: widget.userId,
      limit: 20,
    ));
  }

  @override
  void didUpdateWidget(covariant ProofChainEventsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.jwt != widget.jwt ||
        oldWidget.tenantId != widget.tenantId ||
        oldWidget.userId != widget.userId ||
        oldWidget.baseUrl != widget.baseUrl) {
      _client.close();
      _openSession();
    }
  }

  void _reload() {
    if (!mounted) return;
    setState(() {
      _events = _readEvents();
    });
  }

  @override
  void dispose() {
    _client.close();
    super.dispose();
  }

  String _errorMessage(Object? error) {
    if (error is pc.AuthenticationError) {
      return 'Your session needs attention. Return to sign-in.';
    }
    if (error is pc.AuthorizationError) {
      return 'This session cannot view these events.';
    }
    if (error is pc.RateLimitError) {
      return 'Too many requests. Wait before trying again.';
    }
    if (error is pc.NetworkError || error is pc.TimeoutError) {
      return 'Could not reach the service. Check your connection.';
    }
    return 'Events could not be loaded.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recent activity')),
      body: FutureBuilder<List<pc.Event>>(
        future: _events,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(_errorMessage(snapshot.error)),
                  TextButton(
                    onPressed: _reload,
                    child: const Text('Try read again'),
                  ),
                ],
              ),
            );
          }
          final events = snapshot.data ?? const <pc.Event>[];
          if (events.isEmpty) {
            return const Center(child: Text('No recent events.'));
          }
          return ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              return ListTile(
                title: Text(event.eventType),
                subtitle: Text(event.timestamp),
              );
            },
          );
        },
      ),
    );
  }
}
```

The `Future` is cached in state, never created in `build`; layout rebuilds do
not trigger repeated requests. `FutureBuilder` owns async rendering, so there
is no manual `setState` after awaiting network work. The retry callback checks
`mounted` before updating state. During reload or credential replacement,
loading takes precedence over any data retained by `FutureBuilder`, preventing
old-session data from being rendered while the new future is pending.

The screen constructs and owns its client, so it closes it in `dispose` and
replaces it in `didUpdateWidget`. A host refreshes credentials by rebuilding
with new constructor values; it does not mutate the old client. This screen
has no subscriptions. If adding SSE later, stop old listeners before opening
the replacement session and cancel app-owned subscriptions in `dispose`. If you
instead inject a shared client, its session owner—not every child widget—must
close it. Never close a host-owned shared client merely because one route exits.

# 5. Model, JSON, and error semantics

## 5.1 Typed constructors do not normalize every field name

Named TypeScript interfaces become Dart classes with named constructor
arguments, getters, `fromJson(JsonMap)`, and `toJson()`. Anonymous object and
`Partial<...>` inputs generally remain `JsonMap`, which is
`Map<String, Object?>`. Use the signature of the actual method rather than
translating JS syntax mechanically. Optional positional method arguments remain
positional: `events.list(request)`, not `events.list(request: request)`.

Field casing follows the source interface, not a universal Dart style rule.
For example, `ListEventsRequest.userId` is camelCase, while
`UpdateEndUserRequest.display_name` is snake_case. Resource methods can rename
fields when preparing wire requests: `events.list` maps `userId` to `user_id`.
Do not apply a global casing transform to models or manually rename typed
constructor arguments.

Reserved source names are mapped where necessary. `SchemaField.defaultValue`
is the Dart property for the JSON key `default`. `SchemaField.required` is
actually named `required`; do not invent a `required_` property. This standalone
serialization example performs no network operation:

```dart
import 'package:proofchain_sdk/proofchain.dart';

JsonMap schemaFieldJson() {
  const field = SchemaField(
    name: 'attendance',
    type: 'string',
    required: true,
    defaultValue: 'pending',
  );
  final decoded = SchemaField.fromJson(field.toJson());
  return decoded.toJson();
}
```

## 5.2 Omitted and explicitly null are different

For the models illustrated here, normal constructors omit optional null fields
from `toJson`. Passing `email: null` to `UpdateEndUserRequest` therefore does
**not** itself express an explicit JSON null. Models decoded with `fromJson`
retain the original map for `toJson`, preserving explicit nulls and extra
keys. For example:

```dart
import 'package:proofchain_sdk/proofchain.dart';

Map<String, JsonMap> compareUpdatePayloads() {
  const omitted = UpdateEndUserRequest(email: null);
  final explicit = UpdateEndUserRequest.fromJson(
    <String, Object?>{'email': null},
  );
  return {
    'omitted': omitted.toJson(),
    'explicit': explicit.toJson(),
  };
}
```

The returned `omitted` payload has no `email` key; `explicit` contains that key
with a null value. This is a serialization distinction, not a promise that the
backend allows clearing an email. Field-level null/clear semantics still belong
to the endpoint contract and server validation.

Do not use `fromJson` as a schema validator. Incorrect field types can cause
cast errors during decoding; missing required fields can cause errors when
required getters are accessed. Treat the input map as immutable after decoding:
retained original maps are not deep-copied, and mutating them is not a reliable
way to update already decoded getters. To derive a request, construct a new
model or a new map. `toJson` output may contain personal data; do not log entire
responses by default.

## 5.3 Partial updates use explicit maps

`quests.update(String questId, JsonMap data)` accepts a partial object and uses
HTTP PUT internally. Do not infer its signature from the HTTP verb, invent an
`UpdateQuestRequest`, or send a whole fetched model when only one field should
change. The following complete library accepts a configured client; its caller
retains ownership. This is an authorized write, normally a trusted administrative
operation. `quest-demo` is a replaceable fixture, not a known server record.

```dart
import 'package:proofchain_sdk/proofchain.dart';

Future<Quest> renameQuest(ProofChain client, String questId) {
  final JsonMap changes = {'name': 'Acme welcome quest'};
  return client.quests.update(questId, changes);
}
```

Map keys are backend/source field names. Omit a key to leave it out of the
request; include a null only when the server documents that null behavior.
Keep nested values JSON-compatible: strings, booleans, finite numbers, nulls,
lists, maps with string keys, or supported SDK models. Do not pass arbitrary
`DateTime`, `File`, or custom application objects to a JSON request. Timestamps
in models are strings; parse them explicitly in your presentation layer when
needed. Types expressed as `num` are not automatically integer-only validators.

## 5.4 Handle typed failures without leaking raw payloads

Catch specific errors before `ProofChainError`. Exceptions are not returned as
success models. The shared HTTP status mapping is:

| Failure | SDK exception | Application response |
| --- | --- | --- |
| 401 | `AuthenticationError` | Ask the host session manager to reauthenticate or refresh. |
| 403 | `AuthorizationError` | Explain access denial; do not retry with a privileged mobile key. |
| 404 | `NotFoundError` | Handle a missing record in the current authorized context. |
| 400 or 422 | `ValidationError` | Inspect safely shaped details; correct the request. |
| 429 | `RateLimitError` | Respect a usable delay and your application retry policy. |
| 5xx | `ServerError` | Surface a service failure; reconcile writes before resubmission. |
| Other non-success status | `ProofChainError` | Inspect `statusCode` without assuming a known subtype. |
| Transport failure after network retries | `NetworkError` | Distinguish uncertain write outcome from a confirmed rejection. |
| Connection/header deadline exceeded | `TimeoutError` | Handle timeout; it is not evidence that a write did not run. |

This table describes the main client's shared HTTP transport, not every exported
helper. Standalone ingestion clients have their own timeout and lifecycle
behavior; do not assume all SDK timeouts become `TimeoutError`.

`ProofChainError` exposes `message`, nullable `statusCode`, and nullable
`responseBody`; do not assume all subclasses retain a response body. Even an
error message may contain server-controlled or sensitive content. Display
curated UI messages and use redacted diagnostics.

`ValidationError.rawErrors` is `Object?`: the server can send a map, string,
list, null, or other shape. Its lazy `errors` getter expects a list of
`ValidationErrorDetail`-shaped entries and may throw for nonstandard data. Do
not blindly evaluate it inside a catch block. `RateLimitError.retryAfter` is
nullable `num` in **seconds**, not a `Duration` or milliseconds. Header parsing
can produce a nonfinite number for unusable input; it does not implement full
HTTP-date scheduling. Check nullability, finiteness, and sign before using it.

This standalone library produces safe, bounded summaries for an application's
error boundary. It handles arbitrary raw validation shapes without echoing
server strings. Its return value is a message, not a retry action.

```dart
import 'package:proofchain_sdk/proofchain.dart';

int countFieldErrors(Object? raw) {
  if (raw is! List) return 0;
  var count = 0;
  for (final item in raw) {
    if (item is ValidationErrorDetail) {
      count++;
    } else if (item is Map &&
        item['field'] is String &&
        item['message'] is String) {
      count++;
    }
  }
  return count;
}

String describeFailure(Object error) {
  if (error is AuthenticationError) return 'Sign-in needs attention.';
  if (error is AuthorizationError) return 'Access is not permitted.';
  if (error is NotFoundError) return 'The requested record was not found.';
  if (error is ValidationError) {
    final count = countFieldErrors(error.rawErrors);
    return count == 0
        ? 'The request was rejected. Check the submitted values.'
        : 'The request has $count field validation issue(s).';
  }
  if (error is RateLimitError) {
    final seconds = error.retryAfter;
    if (seconds != null && seconds.isFinite && seconds >= 0) {
      return 'Rate limited; suggested wait: $seconds seconds.';
    }
    return 'Rate limited; no usable retry delay was supplied.';
  }
  if (error is TimeoutError) return 'The request timed out.';
  if (error is NetworkError) return 'A network failure occurred.';
  if (error is ServerError) return 'The service could not complete the request.';
  if (error is ProofChainError) return 'The API request failed.';
  return 'An unexpected application or response-format error occurred.';
}
```

A catch-all boundary is still needed for malformed successful JSON, model cast
errors, and application failures, which are not necessarily wrapped in
`ProofChainError`. Do not relabel every unexpected exception as a network error.

## 5.5 Avoid blind write retries

A connection can fail after the server has applied a write but before the app
receives its response. The shared network retry loop is not restricted to GET;
with its default retry setting, transport failures can replay writes as well.
There is no general SDK idempotency-key facility or automatic write
reconciliation. A timeout, socket failure, or 5xx therefore must not trigger an
unconditional application-level retry of operations such as points awards,
claims, wallet creation, settlement, or event creation.

For sensitive workflows, configure `maxRetries: 0` when constructing the client
and use an endpoint-specific reconciliation/confirmation policy supplied by
your backend. Do not silently add another retry loop around a helper that
already performs multiple requests. For reads, offer an explicit bounded retry
or user retry after considering authorization, rate limits, and the actual
failure. The Flutter screen's button retries only its event **read**; it is not
a pattern for replaying arbitrary mutations.
