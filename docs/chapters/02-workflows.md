# 6. Users, profiles, and pagination

These recipes target native Android/iOS and the Dart VM, not Flutter Web. Each
Dart block is an independent library importing `package:proofchain_sdk/proofchain.dart`.
Add the SDK dependency before using them. Functions accept an already configured
`ProofChain` and known identifiers; the caller owns and eventually closes that
client. Functions do not run merely by being imported.

Values such as `acme`, `user-demo`, `quest-demo`, `lesson_completed`, and sample
metadata are replaceable fixtures, not pre-existing records or a backend
protocol. Use identifiers returned by your deployment. Every request is subject
to server authorization and tenant isolation. A JWT identifies an end user; it
does not grant access to administrative routes. Put privileged operations in a
trusted backend or explicitly authorized native administration process, never
ship a privileged API key inside a mobile application.

## 6.1 External IDs and editable profile data

`users.get`, `update`, `setProfile`, and attribute helpers address the user's
external ID. Methods explicitly named `getByInternalId` and
`updateByInternalId` address the internal ID. `delete`, GDPR preview, and GDPR
deletion use the internal ID. Do not exchange these identifiers just because
both are strings.

A profile editor should submit only permitted fields and render the returned
user, rather than assuming that a local edit was accepted. This example changes
a display name and application metadata; it requires the corresponding
server-authorized user scope.

```dart
import 'package:proofchain_sdk/proofchain.dart';

Future<EndUser> saveProfile(
  ProofChain client,
  String externalId,
  String displayName,
) async {
  await client.users.setProfile(
    externalId,
    SetProfileRequest(display_name: displayName, language: 'en'),
  );
  return client.users.updateAttributes(externalId, {
    'preferred_topic': 'developer-learning',
    'onboarding_version': 1,
  });
}
```

The SDK sends `{'attributes': attributes}` for `updateAttributes`; it does not
merge the supplied map with a locally fetched copy. Confirm your server's patch
semantics before relying on preservation of unrelated keys. `removeAttributes`
reads the existing attributes, removes keys, then writes the resulting map.
That read-modify-write is not atomic: concurrent editors can overwrite changes.
Keep secrets and sensitive personal information out of unneeded metadata.

## 6.2 Backend/admin: provision users and enumerate pages

Provisioning and whole-tenant enumeration belong in authorized administration.
Creation is not an upsert and the SDK does not invent a duplicate-resolution
policy. An external ID should be stable within your own identity system.

```dart
import 'package:proofchain_sdk/proofchain.dart';

Future<EndUser> provisionUser(
  ProofChain admin,
  String externalId,
) {
  return admin.users.create(CreateEndUserRequest(
    external_id: externalId,
    display_name: 'Acme learner',
    attributes: {'source': 'acme-enrolment'},
  ));
}

Stream<EndUser> enumerateUsers(ProofChain admin) async* {
  num page = 1;
  while (true) {
    final result = await admin.users.list(
      ListEndUsersOptions(page: page, page_size: 50),
    );
    for (final user in result.users) {
      yield user;
    }
    if (!result.has_more) break;
    page = result.page + 1;
  }
}
```

`EndUserListResponse` exposes `users`, `total`, `page`, `page_size`, and
`has_more`. This is page-based pagination, unlike APIs using `limit`/`offset`.
The sample size of 50 is an application choice, not a documented server maximum.
For large directories, consume the stream incrementally instead of retaining
all users. Directory changes during traversal can affect page membership; the
SDK does not provide a snapshot cursor.

Filters include `search`, `status`, `segment`, `has_wallet`, `min_events`,
`sort_by`, and `sort_order`. Boolean `false` and numeric zero are retained for
`has_wallet` and `min_events`. Avoid assuming every other API treats falsy
options identically. `users.export` returns CSV/JSON bytes, not a browser
 download. Its options map accepts `segment` and `format`; the caller must choose
where to save bytes and how to protect exported personal information.

Adding points, merging identities, linking/provisioning wallets, and GDPR
operations need explicit policy and authorization. None is invoked by these
recipes. In particular, do not trigger deletion while merely loading a profile.

# 7. Documents, binary files, certificates, and event evidence

## 7.1 Attest a selected document

`UploadFile` is an in-memory value. Obtain bytes using your app's picker or a
caller-supplied native file path; the SDK does not request picker permissions.
The following library additionally depends on Dart's `dart:io`. It reads only
the supplied path and does not assume any bundled fixture file exists.

```dart
import 'dart:io';
import 'package:proofchain_sdk/proofchain.dart';

Future<AttestationResult> attestSelectedDocument(
  ProofChain client,
  String userId,
  String selectedPath,
  String filename,
) async {
  final bytes = await File(selectedPath).readAsBytes();
  return client.documents.attest(AttestRequest(
    file: UploadFile(bytes, filename: filename),
    filename: filename,
    userId: userId,
    eventType: 'document_uploaded',
    metadata: {'application': 'acme-learning'},
    encrypt: true,
  ));
}
```

This is a multipart request, not a JSON-encoded file. Metadata is serialized as
JSON within a multipart field. `encrypt: true` sends `encrypt=1`; omitted or
false does not send that flag. Encryption is a server request, not client-side
cryptography or a promise about key ownership.

Set a nonempty filename explicitly in **both** the upload value and request.
`UploadFile` defaults to `document`, but `documents.attest` chooses the request's
`filename` or `document`, and vault upload chooses the request's filename or
`file`. NFT minting chooses `imageFilename` or `image.png`. An
`UploadFile.filename` alone therefore is not a universal filename override.
Use `contentType` when known; its default is `application/octet-stream`.

`AttestationResult` contains `id`, `ipfsHash`, `documentHash`, `gatewayUrl`,
`verifyUrl`, `certificateId`, `status`, `attestationMode`, and `timestamp`, with
optional `blockchainTx` and `proof`. Preserve these distinctions: a document
hash, an IPFS hash, an event ID, and a certificate ID are not interchangeable.
A returned record or queued status does not by itself mean blockchain finality.
`documents.get(ipfsHash)` returns an `Event`, not document bytes.

## 7.2 Vault storage and authenticated binary retrieval

Vault storage is a separate resource from document attestation. Uploading to the
vault does not call `documents.attest`. The next recipe returns downloaded bytes
to its caller rather than writing an arbitrary destination or opening a URL.
It needs `dart:typed_data` in addition to the SDK dependency.

```dart
import 'dart:typed_data';
import 'package:proofchain_sdk/proofchain.dart';

Future<Uint8List> storeAndReadVaultFile(
  ProofChain client,
  String userId,
  Uint8List bytes,
  String filename,
) async {
  final stored = await client.vault.upload(VaultUploadRequest(
    file: UploadFile(bytes, filename: filename),
    filename: filename,
    userId: userId,
    accessMode: 'private',
  ));
  return client.vault.download(stored.id);
}
```

`vault.download` returns `Uint8List` through the configured authenticated HTTP
client. It is not the `gatewayUrl` returned by attestation. Both upload and
binary retrieval buffer data in memory; set application size limits before
reading a large selected file. No SDK upload-size maximum is enforced here.
Folders, moves, and expiring shares are server resources; `share(fileId,
expiresInHours)` uses hours, not milliseconds. Share response data is `JsonMap`:
inspect the actual server contract rather than assuming an undocumented URL
key. Vault deletions are explicit operations and are not part of this recipe.

## 7.3 Consume certificate verification without inventing a boolean

Use the typed verification resource when you want the modeled response.
`certificates.verify` returns a raw `JsonMap`; `verifyResource.certificate`
returns `CertificateVerifyResult`. The typed result has `status`, not a `valid`
boolean. Present the actual status, expiration, and revocation information using
your product's verification policy.

```dart
import 'package:proofchain_sdk/proofchain.dart';

Future<CertificateVerifyResult> inspectCertificate(
  ProofChain client,
  String certificateId,
  void Function(String status, String? revokedAt) present,
) async {
  final result = await client.verifyResource.certificate(certificateId);
  present(result.status, result.revokedAt);
  return result;
}
```

The response also includes recipient/title, issue and optional expiry times,
IPFS hash, verification URL, and optional blockchain metadata. A network failure
is not a negative verification decision. Keep “could not check” distinct from
a server-reported revoked or otherwise unacceptable certificate.

For other evidence, `client.verify(ipfsHash)` is the main hash verification
route; `verifyResource.event(ipfsHash)` returns raw event verification data.
`eventBatchProof(eventId)` retrieves a batch proof; `proof(leaf, proof, root)`
submits explicit proof material. `batch(batchId)` and `batchVerify(items)` are
different calls with different identifiers/payloads. The SDK does not locally
prove authenticity merely by deserializing these responses.

## 7.4 Backend/admin: issue a certificate

Certificate issuance is a privileged business operation. Keep recipient policy,
consent, and allowed metadata on the trusted side. It is separate from obtaining
a certificate ID as part of event ingestion.

```dart
import 'package:proofchain_sdk/proofchain.dart';

Future<Certificate> issueCourseCertificate(
  ProofChain admin,
  String recipientName,
  String recipientEmail,
) {
  return admin.certificates.issue(IssueCertificateRequest(
    recipientName: recipientName,
    recipientEmail: recipientEmail,
    title: 'Acme developer course',
    metadata: {'course': 'developer-basics'},
  ));
}
```

Listing certificates uses `ListCertificatesRequest` with optional recipient
email and `limit`/`offset`. Revocation is an explicit authorized action,
`revoke(certificateId, reason)`, not a side effect of verification.

# 8. Events, search, history, and channels

## 8.1 Write an authorized event and search its domain

Event writes must be permitted by the server for the current caller. If an
ordinary mobile user should submit only end-user ingestion events, use chapter
9 rather than granting tenant event-write privileges. A client-supplied `source`
is metadata, not proof of authorization.

```dart
import 'package:proofchain_sdk/proofchain.dart';

Future<SearchResult> recordAndSearchLesson(
  ProofChain client,
  String userId,
  String lessonId,
) async {
  await client.events.create(CreateEventRequest(
    eventType: 'lesson_completed',
    userId: userId,
    source: 'acme-learning',
    data: {'lesson_id': lessonId},
  ));
  return client.events.search(SearchRequest(
    query: lessonId,
    userId: userId,
    eventType: 'lesson_completed',
    page: 1,
    limit: 20,
  ));
}
```

`SearchResult` exposes `events`, `total`, `page`, and `limit`; render the result
set instead of treating search success as confirmation that a just-written event
is already indexed. `events.list` returns `List<Event>` and uses offset-based
options. `events.createBatch` is a sequential loop over `create`, **not** an
atomic batch endpoint: earlier writes can succeed before a later failure.
Do not retry the whole list blindly after an ambiguous response.

`search.query` is a separate structured `SearchQueryRequest` API, with filters,
offset, limit, and `includeData`. `search.quick` accepts a text query and optional
positional limit. Do not copy a `SearchRequest` into `search.query` or substitute
one response model for another.

## 8.2 User history is a bounded query

```dart
import 'package:proofchain_sdk/proofchain.dart';

Future<UserEventHistoryResponse> loadRecentHistory(
  ProofChain client,
  String userId,
  num offset,
) async {
  return client.search.byUser(
    userId,
    UserEventHistoryOptions(days: 30, limit: 25, offset: offset),
  );
}
```

The result exposes `results`, `total`, `offset`, `limit`, `query_time_ms`, optional
`pagination`, and optional `retention_warning`. Surface retention warnings where
users might otherwise mistake a partial history for a complete audit trail.
Advance offsets according to the returned page and product requirements.
The SDK also accepts a legacy numeric limit as the second positional argument,
but a typed options object makes the day window explicit. `users.getActivity`
is another user-activity endpoint with `page`, `page_size`, and `event_type` in a
`JsonMap`; it is not this history response.

## 8.3 Backend/admin: channels and explicit settlement ownership

Channels group event submission and settlement. Their `stream` method is an
HTTP POST; it does not open a WebSocket or return a Dart stream. The following
function submits to an existing authorized channel and returns its acknowledgment.

```dart
import 'package:proofchain_sdk/proofchain.dart';

Future<StreamAck> submitChannelLesson(
  ProofChain admin,
  String channelId,
  String userId,
  String lessonId,
) {
  return admin.channels.stream(channelId, StreamEventRequest(
    eventType: 'lesson_completed',
    userId: userId,
    source: 'acme-learning',
    data: {'lesson_id': lessonId},
  ));
}

Future<Channel> createLearningChannel(ProofChain admin) {
  return admin.channels.create(const CreateChannelRequest(
    name: 'Acme learning events',
    description: 'Authorized course completion events',
  ));
}
```

Use `status(channelId)` to inspect the channel. `list(limit, offset)` has
positional defaults 50 and 0. `streamBatch(channelId, events)` posts an `events`
envelope and returns `JsonMap`; do not assume it shares standalone ingestion's
batch limits or response fields. `settle` and `close` are explicit server
mutations, not local socket cleanup. Assign their timing to an authorized
backend workflow. These examples intentionally do not settle or close a channel
as an automatic consequence of a screen leaving the foreground.

# 9. Standalone ingestion: two distinct modes

These clients are independent of `ProofChain`: passing a configured main client
does not configure them. Their transports, timeouts, endpoints, and wire
payloads differ from the shared HTTP resource client.

| Property | `IngestionClient` | `EndUserIngestionClient` |
| --- | --- | --- |
| Intended authority | Trusted backend/native administration process | Mobile end-user JWT |
| Required options | `apiKey` | `userToken`, `tenantId` |
| Optional options | `ingestUrl`, `timeout` | `apiUrl`, `timeout` |
| Default origin | `https://ingest.proofchain.co.za` | `https://api.proofchain.co.za` |
| Single route | `/events/ingest` | `/end-user/events/ingest` |
| Batch route | `/events/ingest/batch` | `/end-user/events/ingest/batch` |
| Batch body | Raw event array | Object containing `events` array |
| Local batch maximum | 1,000 | 100 |
| Client-controlled source | `eventSource`, default `sdk` | Ignored; server stamps provenance |
| Schema IDs | Single request: `X-Schemas` header | Not sent |
| Automatic retries | None | None |

The actual mobile class is **`EndUserIngestionClient`**, not
`IngestionUserClient`. Both use `IngestEventRequest` and `BatchIngestRequest` as
Dart inputs even though their wire batch envelopes differ.

## 9.1 Mobile JWT ingestion

Obtain a JWT from your existing authorized identity flow; this SDK does not
define a login route. Pass the tenant and API origin belonging to that identity.
`apiUrl` is the API origin used before the `/end-user/...` path, not the main
client's tenant-prefixed resource URL.

```dart
import 'package:proofchain_sdk/proofchain.dart';

Future<IngestEventResponse> ingestMobileLesson(
  String userToken,
  String tenantId,
  String apiOrigin,
  String userId,
  String lessonId,
) async {
  final ingestion = EndUserIngestionClient(EndUserIngestionClientOptions(
    userToken: userToken,
    tenantId: tenantId,
    apiUrl: apiOrigin,
    timeout: 30000,
  ));
  return ingestion.ingest(IngestEventRequest(
    userId: userId,
    eventType: 'lesson_completed',
    data: {'lesson_id': lessonId},
    timestamp: DateTime.now().toUtc().toIso8601String(),
  ));
}
```

`setToken(newToken)` updates a retained end-user ingestion client after your
identity layer refreshes credentials. It does not refresh tokens itself.
`ProofChain` has no equivalent token setter: manage its lifetime separately.
Neither standalone ingestion class has a `close()` method. Every operation
creates and closes its own `dart:io` transport in a `finally` block, including
failure/timeout paths. Do not add a nonexistent cleanup call.

## 9.2 Backend/admin: direct ingestion with schema selection

The API key in this recipe must come from trusted runtime configuration. Never
compile it into a mobile binary, include it in a checked-in example, or return
it from an application backend to an untrusted client.

```dart
import 'package:proofchain_sdk/proofchain.dart';

Future<IngestEventResponse> ingestTrustedLesson(
  String apiKey,
  String ingestOrigin,
  String userId,
  String lessonId,
  List<String> schemaIds,
) async {
  final ingestion = IngestionClient(IngestionClientOptions(
    apiKey: apiKey,
    ingestUrl: ingestOrigin,
    timeout: 30000,
  ));
  return ingestion.ingest(IngestEventRequest(
    userId: userId,
    eventType: 'lesson_completed',
    eventSource: 'acme-backend',
    schemaIds: schemaIds,
    data: {'lesson_id': lessonId},
  ));
}
```

A nonempty `schemaIds` list becomes the comma-separated `X-Schemas` header for
**direct single-event ingestion only**. Direct batches ignore per-event schema
IDs. End-user ingestion ignores both schema IDs and `eventSource`; adding them
does not grant privileged provenance. `hot: true` is sent when requested;
`hot: false` is omitted. `timestamp` is an optional caller-supplied string; the
SDK does not infer a domain timestamp or validate its semantics.

## 9.3 Batch accounting and limits

Do not confuse successful HTTP delivery with all events being queued or
confirmed. Consume `totalEvents`, `queued`, `failed`, and individual `results`.
The normalized per-event fields are `eventId`, `certificateId`, and `status`.
Single responses can additionally expose `queuePosition` and
`estimatedConfirmation`; those queue fields are not retained in batch results.

```dart
import 'package:proofchain_sdk/proofchain.dart';

Future<BatchIngestResponse> ingestMobileBatch(
  EndUserIngestionClient ingestion,
  List<IngestEventRequest> events,
  void Function(num queued, num failed) presentCounts,
) async {
  if (events.length > 100) {
    throw ArgumentError.value(events.length, 'events', 'Maximum is 100');
  }
  final result = await ingestion.ingestBatch(
    BatchIngestRequest(events: events),
  );
  presentCounts(result.queued, result.failed);
  return result;
}
```

For direct ingestion, use the same `BatchIngestRequest` with
`IngestionClient.ingestBatch`, up to 1,000 events. Oversized batches throw
`ValidationError` before sending. The SDK does not enforce a nonempty minimum.
Partition larger work in the application and preserve each batch's outcome;
do not assume atomicity, automatic rollback, or a backend idempotency key.

`timeout` is in milliseconds and defaults to 30,000 when omitted or falsy.
Batch calls use twice the configured timeout. Unlike the shared HTTP client's
connection/header deadline, standalone ingestion applies its timeout to the
whole operation, including response-body reading, and closes that operation's
transport on timeout. `ingest` and `ingestBatch` report timeout as `NetworkError`.
Direct `getEventStatus(eventId)` returns the raw wire-keyed `JsonMap`, uses the
single timeout, and can throw `dart:async` `TimeoutException` instead.
End-user ingestion has no status method.

Neither mode retries automatically, including network errors or HTTP 429.
Handle `RateLimitError` and transient failures at an application boundary;
an ambiguous write failure can mean the server already accepted the event.
Do not infer a universal retry-safe property from the request returning an
exception. The shared resource HTTP client retries network errors, not HTTP
status responses; that separate behavior does not apply to these clients.

# 10. Quests, rewards, credentials, and NFT REST

## 10.1 Load an authorized quest journey

```dart
import 'package:proofchain_sdk/proofchain.dart';

Future<QuestWithProgress> openQuest(
  ProofChain client,
  String questId,
  String userId,
) async {
  return client.quests.getWithProgress(questId, userId);
}

Future<List<QuestWithProgress>> availableQuests(
  ProofChain client,
  String userId,
) {
  return client.quests.listAvailable(userId, {'category': 'learning'});
}
```

`quests.list(ListQuestsOptions(...))` supports status, category, public/featured
flags, limit, and offset. `listAvailable(userId, options)` uses only its category
filter. `listWithProgress(userId, options)` delegates to that available-quests
route and forwards category only: it does **not** preserve every list filter.

`getWithProgress` fetches the quest and progress concurrently. It suppresses
progress-fetch errors to a nullable progress result while still failing if the
quest fetch fails. Consequently, absent progress can mean more than “not yet
started.” If the distinction matters to your UI, call `getUserProgress`
explicitly and handle its errors separately. Use `resolveCtaLink` only with a
trusted quest ID/model or server-advertised path; the helper can accept a path,
and callers should not turn arbitrary untrusted input into navigation policy.

## 10.2 Start, complete an eligible step, then claim when allowed

The SDK has `startQuest`, `startStep`, `completeStep`, and `claimReward`; it has
no generic `completeQuest` method. Use the step index required by the backend
for the loaded quest. Do not substitute a step ID or assume an array position
without checking the quest definition and server contract.

```dart
import 'package:proofchain_sdk/proofchain.dart';

Future<UserQuestProgress> beginQuest(
  ProofChain client,
  String questId,
  String userId,
) {
  return client.quests.startQuest(questId, userId);
}

Future<ClaimRewardResult?> completeEligibleStep(
  ProofChain client,
  String questId,
  String userId,
  num stepIndex,
) async {
  await client.quests.startStep(questId, userId, stepIndex);
  final completed = await client.quests.completeStep(
    questId,
    userId,
    stepIndex,
  );
  if (!completed.can_claim) return null;
  return client.quests.claimReward(questId, userId);
}
```

Call completion only when the real-world action and server policy allow it,
not on screen mount. Some quest types depend on ingested events or other
criteria: a POST is not a shortcut around those rules. `StepCompletionResult`
reports `step_completed`, `quest_completed`, `can_claim`, current/target counts,
and points earned. A claim response reports `status`, `points_awarded`, optional
`reward_earned_id`, and `claimed_at`; a reward ID is not a confirmed NFT mint.
Refresh progress for authoritative status, completion percentage, step progress,
and earned reward information. Partial failure between start, completion, and
claim is possible; these are separate requests, not a transaction.

## 10.3 Read rewards and credentials; request an eligible NFT claim

These functions require server-authorized access to the requested user's
records. A wallet address must already be validated/selected by the application;
this library does not establish wallet ownership by signing a challenge.

```dart
import 'package:proofchain_sdk/proofchain.dart';

Future<List<RewardUserReward>> loadUserRewards(
  ProofChain client,
  String userId,
) {
  return client.rewards.getUserRewards(userId);
}

Future<UserCredentialsSummary> loadUserCredentials(
  ProofChain client,
  String externalId,
) {
  return client.credentials.getUserCredentials(externalId);
}

Future<ClaimNFTResult> claimEarnedNft(
  ProofChain client,
  String earnedRewardId,
  String walletAddress,
) {
  return client.rewards.claimNFT(earnedRewardId, walletAddress);
}

Future<NFTMint> inspectMint(ProofChain client, String mintId) {
  return client.nft.get(mintId);
}
```

`getCatalog(category)` returns reward definitions, whereas `getUserRewards`
returns user reward records and `listEarned` returns earned rewards. Their
models are not interchangeable. Claiming, distribution, attestation, anchoring,
and verification are separate calls. Inspect server states rather than
presenting a mint as complete just because a claim request was accepted.

Credential verification uses `credentials.verify(verificationCode)`; it is
separate from certificate verification and wallet attestation verification.
Credential opt-in/opt-out are server mutations affecting a user's enrollment,
not mobile notification permission prompts. Avoid invoking them automatically
while loading the user's credentials.

### Voucher (gift card) rewards

A reward with `reward_type == 'voucher'` is a gift card fulfilled off-chain.
Once its status is `awaiting_claim` or `claimed`, show a "Claim" action that
calls `claimVoucher` (no wallet address) and opens the returned link directly.
Each call returns a fresh `redemption_url`; treat it as a secret and never
persist, log, or cache it. A 409 means the voucher is not issued yet or was
revoked/failed.

```dart
import 'package:proofchain_sdk/proofchain.dart';

Future<String?> voucherRedemptionLink(
  ProofChain client,
  String earnedRewardId,
) async {
  final result = await client.rewards.claimVoucher(earnedRewardId);
  return result.redemption_url;
}
```

Email/SMS delivery: when the definition's `voucher_delivery_methods` includes
`email` or `sms` (omitted means `['link']`), the fan chooses at claim time and
the gift card is bought then (funds are committed at claim, not when earned).
Pass a `VoucherDelivery`; the provider emails or texts the voucher and
`redemption_url` is null. Phone numbers must be E.164. Contact details go
straight to the provider and are never stored, logged or audited by
Proofchain; do not persist them in your app either. Without `delivery` the
claim is a link claim. After a `failed` delivery, claim again with the same
method to re-send to a corrected address.

```dart
import 'package:proofchain_sdk/proofchain.dart';

Future<String?> emailVoucher(ProofChain client, String earnedRewardId) async {
  final result = await client.rewards.claimVoucher(earnedRewardId,
      delivery: const VoucherDelivery(
          method: voucherDeliveryEmail, email: 'fan@example.com', name: 'Sam'));
  return result.delivery_status;
}
```

The provider does not report redemption; only delivery is tracked.
`EarnedReward` exposes `voucher_delivery_method`, `voucher_delivery_status`
(`pending`, `delivered`, `failed`, `canceled`, `flagged`, `blocked`),
`voucher_delivery_failure` (e.g. `invalid_email`) and
`voucher_status_updated_at`. Backends can subscribe to the tenant webhook
events `reward.voucher.claimed` and `reward.voucher.delivery_updated` (no
contact details included).
```

Backend/admin code configures voucher definitions with `reward_type: 'voucher'`,
`value`, `value_currency`, and `voucher_product_ids` and/or
`voucher_campaign_id`; `client.rewards.listVoucherProducts(country: 'GB',
currency: 'GBP')` lists eligible catalog products (tenant credentials).
`EarnedReward.voucher_order_id` exposes the provider order id for support.

Choose your own: several `voucher_product_ids` (or a campaign) let the fan pick
a product on the redemption page; products whose range does not fit the value
are hidden. Include `voucherAllFeeFree` (`'ALL_FEE_FREE'`) to offer every
fee-free product; the server expands it to explicit ids when the definition is
saved. `voucher_language` (ISO-639-1, e.g. `'fr'`) translates the redemption
page and `voucher_message` (max 1000 chars) is shown on it.
`listVoucherProducts` also filters by `category` (e.g. `merchant_card`,
`charity`, `paypal`, `visa_card`, where the account offers them),
`subcategory` (e.g. `food_and_drink`) and `feeFree`. Products expose
`description`, `usage_instructions`, `fee_free` and `disclosure`; `disclosure`
is provider HTML, so sanitize it before rendering.

## 10.4 Backend/admin: edit definitions, award, issue, and mint

Quest creation/publishing/pausing, definition editing, manual awards,
distribution, revocation, credential issuance/type administration, and direct
NFT minting belong to trusted authorized administration. JWT construction does
not make those actions safe for a mobile client.

Step helpers are read-modify-write operations over the **full** steps array.
`addStep` appends using maximum existing order plus one when order is omitted;
`updateStep` and `deleteStep` rewrite existing editable fields;
`reorderSteps` rewrites the array using only the IDs supplied. Supply every step
ID you intend to retain and serialize administration to avoid lost updates.

```dart
import 'package:proofchain_sdk/proofchain.dart';

Future<QuestStep> addLearningStep(ProofChain admin, String questId) {
  return admin.quests.addStep(questId, const CreateQuestStepRequest(
    name: 'Complete the introduction',
    event_type: 'lesson_completed',
    required_data_fields: ['lesson_id'],
  ));
}

Future<List<EarnedReward>> awardApprovedReward(
  ProofChain admin,
  String definitionId,
  String userId,
) {
  return admin.rewards.award(ManualRewardRequest(
    definition_id: definitionId,
    user_ids: [userId],
    distribute_immediately: false,
    trigger_data: {'review': 'acme-approved'},
  ));
}

Future<IssuedCredential> issueApprovedCredential(
  ProofChain admin,
  String credentialTypeId,
  String userId,
) {
  return admin.credentials.issue(IssueCredentialRequest(
    credential_type_id: credentialTypeId,
    user_id: userId,
    issue_reason: 'Approved Acme course completion',
  ));
}
```

Direct minting is also a REST operation, not on-device signing. The following
function accepts actual image bytes and a deployment-supported network; it
sets both upload and multipart request filenames explicitly. It needs
`dart:typed_data`. Only invoke after trusted recipient and issuance checks.

```dart
import 'dart:typed_data';
import 'package:proofchain_sdk/proofchain.dart';

Future<NFTMint> mintApprovedCourseNft(
  ProofChain admin,
  String walletAddress,
  String network,
  Uint8List imageBytes,
  String filename,
) {
  return admin.nft.mint(MintNFTRequest(
    recipientAddress: walletAddress,
    name: 'Acme course completion',
    image: UploadFile(
      imageBytes,
      filename: filename,
      contentType: 'image/png',
    ),
    imageFilename: filename,
    network: network,
    metadata: {'course': 'developer-basics'},
  ));
}
```

Match the declared content type to real bytes; change it for non-PNG input.
The SDK can alternatively send `imageUrl`. It does not upload an absent image
for you, deploy arbitrary contracts, manage gas locally, or provide a wallet
signer. `nft.list` supplies recipient/network/status and limit/offset filters
for tracking server-managed mint records.

# 11. Cohorts, Fanpass, DataViews, wallets, and passports

## 11.1 Query related analytics with explicit identifiers

Cohort leaderboards operate on a cohort definition ID; Fanpass has its own
leaderboard and optional aggregation rule ID. Both accept typed string-valued
filter maps, country, limit, `top_n`, `fresh`, and `userId` context. There is no
single generic `client.leaderboards` resource in this SDK.

```dart
import 'package:proofchain_sdk/proofchain.dart';

Future<CohortLeaderboardResponse> loadCohortBoard(
  ProofChain client,
  String cohortId,
  String userId,
) {
  return client.cohorts.getLeaderboard(
    cohortId,
    CohortLeaderboardOptions(limit: 20, top_n: 10, userId: userId),
  );
}

Future<FanpassLeaderboardResponse> loadFanpassBoard(
  ProofChain client,
  String userId,
) {
  return client.fanpassLeaderboard.getLeaderboard(
    FanpassLeaderboardOptions(limit: 20, top_n: 10, userId: userId),
  );
}

Future<JsonMap> loadCustomViewData(
  ProofChain client,
  String identifier,
  String viewName,
) async {
  final view = await client.dataViews.execute(identifier, viewName);
  return view.data;
}
```

Use `cohorts.list`/`get` to discover permitted definitions rather than guessing
IDs. `getUserBreakdown` and Fanpass `getUserComparison` accept a `JsonMap` with
`filters` and `country`. `fanpassLeaderboard.listCohorts` fetches the complete
leaderboard and returns its cohorts; `getCohort` searches that list and can
return null. Neither is a separate server route for one cohort.

`fresh: true` requests fresh server evaluation; the SDK does not guarantee a
particular cache age. Avoid requesting it on every animation or rebuild.
Filter names and aggregation rules are deployment-defined; do not assume
arbitrary metadata keys are supported leaderboard filters.

DataViews offer catalog discovery, custom view execution, fan profiles by wallet
address, and activity summaries with an optional positional day count (default
30). `execute(identifier, viewName)` returns `DataViewExecuteResult` with
`view_name`, `display_name`, `identifier`, `identifier_type`, `data`,
`computed_at`, and `total_events`. Interpret `data` using the selected view's
schema, not an invented universal metrics object. Custom view creation,
updates/deletion, and previewing privileged data require backend/admin scope.
A wallet address accepted by one view is not automatically a passport user ID.

## 11.2 Wallet REST reads and passport views

The main SDK includes `WalletClient` REST APIs. The separate embedded
`wallet-sdk` is not part of this package. These REST calls do not provide local
key custody, challenge signing, transaction signing, WalletConnect, or an
embedded wallet UI.

```dart
import 'package:proofchain_sdk/proofchain.dart';

Future<ComprehensiveWalletInfo> loadWalletDetails(
  ProofChain client,
  String walletId,
) {
  return client.wallets.getInfo(walletId, {
    'includeBalances': true,
    'includeNfts': true,
    'includeActivity': false,
  });
}

Future<TransactionHistory> loadWalletHistory(
  ProofChain client,
  String walletId,
  num offset,
) {
  return client.wallets.getTransactions(walletId, {
    'limit': 25,
    'offset': offset,
  });
}

Future<PassportWithFields> loadPassportFields(
  ProofChain client,
  String userId,
) {
  return client.passports.getWithFields(userId);
}

Future<PassportV2Data> loadPassportView(
  ProofChain client,
  String userId,
  String passportId,
) {
  return client.passports.getPassportV2(userId, passportId);
}
```

`wallets.getInfo` uses camelCase option keys in a `JsonMap` and maps them to wire
snake_case. It honors explicit false. `getUserSummary(userId, includeBalances)`
uses an optional positional boolean, default true. `getBalance`, `getNFTs`,
`getUserNFTs`, and token catalog methods are separate REST reads. Avoid logging
entire wallet responses merely for debugging.

`passports.getWithFields` performs two sequential requests: passport followed
by field values. It is not a single atomic snapshot. V2 views, milestones, and
available views are different model families from the legacy passport object.
`getPassportView` delegates to `getPassportV2`. Pass an actual passport definition
ID when a specific V2 view is needed; do not assume the same ID is used by the
legacy templates API.

Passport history uses `ListOptions(limit: ..., offset: ...)`. Legacy badge and
achievement reads (`getUserBadges`, `getUserAchievements`) are distinct from
reward and credential records. Do not count one as another without a business
rule from your server.

## 11.3 Backend/admin: provisioning and sensitive wallet operations

Wallet creation/dual creation, NFT registration, token administration,
transfers/swaps, key export, and passport points/template/badge/achievement
mutations must be restricted to server-authorized workflows. Network selection
must match your deployment. Defaults such as `base-mainnet` imply real network
resources; never treat the default as a test network.

`users.ensureWallet(externalId, network)` is not a read-only lookup. It may
create a missing wallet, and after **any** lookup or single-wallet creation
error it falls back to creating a dual pair. Do not call it in a polling loop
or as a harmless wallet-existence check. Prefer explicit reads when rendering
screens. `wallets.exportKey` posts an acknowledgment flag and returns `JsonMap`;
this guide deliberately does not demonstrate exporting or displaying secrets.

Passport `setFieldValue(userId, fieldKey, value)` forwards the value directly,
not an invented `{'value': ...}` wrapper. **Current source limitation:** the
shared transport omits a body when that top-level value is `false`, `0`, an empty
string, or `null`. Do not rely on this helper to clear or disable a field with
those scalar values; do not work around it by inventing a wrapper the endpoint
does not accept. Only allow application-editable fields, and use recomputation
where your deployment defines computed fields. Linking an address does not prove
ownership through a signature.

## 11.4 Backend/admin: schemas, attestations, partner keys, and AirKit

The following small tooling library makes concrete read/session calls without
exposing generated partner secrets or invoking revocation/deletion. Its entire
surface requires the corresponding authorized server scope. Session creation
is an explicit action and must not be called just because a module is imported.

```dart
import 'package:proofchain_sdk/proofchain.dart';

Future<SchemaDetail> inspectSchemaVersion(
  ProofChain admin,
  String name,
  String version,
) {
  return admin.schemas.get(name, version);
}

Future<AttestationRecord> inspectAttestation(
  ProofChain admin,
  String attestationId,
) {
  return admin.attestations.get(attestationId);
}

Future<OTTConfigResponse> inspectPartnerConfiguration(
  ProofChain admin,
  String keyId,
) {
  return admin.partnerKeys.getOTTConfig(keyId);
}

Future<AirKitSessionResponse> beginAuthorizedAirKitSession(ProofChain admin) {
  return admin.airkit.createSession();
}
```

Schema creation/update take YAML content strings; schema names/versions are not
JSON-schema maps. `validateMultiple(schemaNames, data)` submits an array of
schema names plus one data object. Activation, deprecation, default selection,
and cloning alter tenant configuration and need controlled administration.

`attestations` manages structured attestation records and configuration; it is
not `documents.attest`. Public wallet credential methods are
`getWalletCredentials`, `getWalletCredential`, and `verifyWalletCredentials`;
they use wallet addresses and attestation UIDs rather than document hashes.

`partnerKeys.generate` and `redeem` implement one-time-token workflows defined
by the server. Do not log token/key responses or treat them as a mobile login
protocol. `getOTTConfig`/`updateOTTConfig` operate on key IDs. AirKit exposes
`createSession`; this package does not supply a native AirKit UI or invent a
subsequent session exchange protocol. Consume the returned model according to
your integration's actual server contract.

# 12. Native notifications and foreground lifecycle

## 12.1 Subscribe to native SSE and retain the cancellation handle

`notifications.subscribe` opens a native Server-Sent Events connection and
returns an `Unsubscribe` function immediately. It is not a future and should not
be awaited. The positional third argument is `SubscribeOptions`. This controller
needs only the SDK dependency and makes lifecycle ownership explicit.

```dart
import 'package:proofchain_sdk/proofchain.dart';

class ForegroundNotifications {
  final ProofChain client;
  final String userId;
  final NotificationCallback onEvent;
  final void Function(String state) onState;
  Unsubscribe? _cancel;

  ForegroundNotifications({
    required this.client,
    required this.userId,
    required this.onEvent,
    required this.onState,
  });

  void resume() {
    if (_cancel != null) return;
    _cancel = client.notifications.subscribe(
      userId,
      onEvent,
      SubscribeOptions(
        onConnect: () => onState('connected'),
        onDisconnect: () => onState('disconnected'),
        onError: (error) => onState('notification parse failure'),
        autoReconnect: true,
        reconnectDelay: 3000,
      ),
    );
  }

  void pause() {
    _cancel?.call();
    _cancel = null;
  }

  void dispose() {
    pause();
  }
}
```

Connect the controller's `resume()` to the application's foreground/resumed
lifecycle and call `pause()` when the owner leaves foreground (including hidden,
inactive, paused, or detached states according to your application policy).
In Flutter, a `WidgetsBindingObserver` or `AppLifecycleListener` in the owning
widget/service can forward those transitions; remove that observer/listener in
its disposal method. Create one controller per intended subscription owner, not
inside `build()`. A controller for a shared client cancels only its subscription;
it must not close the entire client when another screen still uses it.

On returning to foreground, refresh authoritative domain data as well as
resubscribing. Mobile operating systems can suspend or terminate an application;
SSE is not guaranteed background delivery. The client does not persist a
notification cursor, send `Last-Event-ID`, or guarantee replay of missed events.
Deduplicate/update UI using your domain records rather than assuming exactly-once
notification delivery.

## 12.2 Callback semantics and reconnect behavior

`NotificationEvent` exposes `id`, `event`, `data`, `tenant_id`, `user_id`, and
`timestamp`. Treat `data` as event-specific metadata; reload records when a
workflow needs authoritative status. Do not mutate privileged server state just
because a notification named an event.

The options have deliberately narrow semantics:

| Option | Actual behavior |
| --- | --- |
| `onConnect` | Called when a parsed JSON payload has `event: connected`, not merely when TCP/HTTP connects |
| `onDisconnect` | Called after failed connection, stream error, or stream end |
| `onError` | Reports notification JSON/model parsing or callback-processing failures; not a general transport-error callback |
| `autoReconnect` | Defaults to true; false closes after a disconnect |
| `reconnectDelay` | Fixed delay in milliseconds, default 3,000; not exponential backoff |

Only unnamed SSE messages or SSE `event: message` are dispatched. Other named
SSE event types are ignored, and comment lines are ignored. The JSON `event`
field inside an accepted message is distinct from the SSE event-line name.
Malformed data is reported through `onError`; the SDK does not forward the
underlying connection exception there. Keep callbacks short, synchronous, and
nonthrowing; schedule longer application work separately with its own error
handling.

Calling the unsubscribe function cancels connecting, connected, and reconnecting
work, aborts pending requests, closes the dedicated native transport, and stops
its timer. It is safe to call repeatedly. Explicit cancellation does not need
a server-side unsubscribe request. `notifications.close()` cancels every active
subscription owned by that resource and prevents future subscriptions; it does
not close the shared HTTP client. `ProofChain.close()` closes notifications and
the shared HTTP transport and is the final owner-level cleanup.

The SSE URL carries query authentication: `api_key` when configured, or `token`
and optional `tenant_id` for user authentication. Use HTTPS and avoid logging
full URLs in application logs, proxies, analytics, or crash reports. For mobile,
use the least-privileged user-token client, never an embedded tenant API key.
SSE reconnection reads the client's configured credentials; the main client
has no token setter. When credentials change, cancel the old subscription and
replace/reconfigure the owning main client through your identity lifecycle.

## 12.3 Browser Web Push is not native push

The SDK retains server-side Web Push compatibility APIs:
`getVapidKey`, `registerPush`, `unregisterPush`, and `generateServiceWorker`.
A VAPID key and a `PushSubscriptionJSON` are browser Web Push concepts, not
FCM/APNs device tokens. Registering arbitrary native strings as a browser
subscription does not enable mobile delivery.

On native Android/iOS, `requestPermissionAndSubscribe` returns null. It does not
request OS notification permission, create a service worker, contact
`PushManager`, or substitute Firebase Cloud Messaging or Apple Push Notification
service. `generateServiceWorker` returns JavaScript source as a string; native
Dart does not execute it. `getVapidKey` returns null on any caught failure, so
null is not proof that Web Push is intentionally disabled on the server.

Implement native background push separately with your application's actual
FCM/APNs infrastructure and backend contract if required. This SDK has no native
device-token registration route or permission bridge to demonstrate. Do not
promise a background notification merely because foreground SSE works.

These recipes document the implemented source surface. Prior SDK evidence was
clean Dart 3.13.5 analysis, 17 behavior tests, and 583 runtime parity scenarios;
those are prior implementation checks, not checks run while writing this
chapter. Android/iOS builds and real-device behavior remain unverified.
