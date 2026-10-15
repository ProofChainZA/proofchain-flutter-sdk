import 'dart:convert';
import 'dart:io' as io;

import 'airkit.dart';
import 'attestations.dart';
import 'cohorts.dart';
import 'credentials.dart';
import 'dataviews.dart';
import 'fanpass_leaderboard.dart';
import 'http.dart';
import 'json.dart';
import 'models.dart';
import 'nft.dart';
import 'notifications.dart';
import 'partner_keys.dart';
import 'passports.dart';
import 'quests.dart';
import 'resources.dart';
import 'rewards.dart';
import 'schemas.dart';
import 'upload.dart';
import 'users.dart';
import 'wallets.dart';

JsonMap _renamed(JsonMap input, Map<String, String> fields) => {
      for (final entry in fields.entries)
        if (input.containsKey(entry.key)) entry.value: input[entry.key],
    };

class DocumentsResource {
  final HttpClient http;
  DocumentsResource(this.http);

  Future<AttestationResult> attest(AttestRequest request) async {
    final file = request.file;
    return decodeModel(
        await http.requestMultipart('/tenant/documents', files: {
          'file': UploadFile(file.bytes,
              filename:
                  jsTruthy(request.filename) ? request.filename! : 'document',
              contentType: file.contentType),
        }, fields: {
          'user_id': request.userId,
          'event_type': jsTruthy(request.eventType)
              ? request.eventType!
              : 'document_uploaded',
          if (request.metadata != null)
            'metadata': jsonEncode(request.metadata),
          if (request.encrypt == true) 'encrypt': '1',
        }),
        AttestationResult.fromJson);
  }

  Future<Event> get(String ipfsHash) async => decodeModel(
      await http.get('/tenant/events/by-hash/$ipfsHash'), Event.fromJson);
}

class EventsResource {
  final HttpClient http;
  EventsResource(this.http);

  Future<Event> create(CreateEventRequest request) async => decodeModel(
      await http.post('/tenant/events', {
        'event_type': request.eventType,
        'user_id': request.userId,
        'event_source': jsTruthy(request.source) ? request.source : 'api',
        'data': request.data ?? <String, Object?>{},
      }),
      Event.fromJson);

  Future<Event> get(String eventId) async =>
      decodeModel(await http.get('/tenant/events/$eventId'), Event.fromJson);

  Future<List<Event>> list(
      [ListEventsRequest request = const ListEventsRequest()]) async {
    final response = asJsonMap(await http.get(
        '/tenant/events',
        _renamed(request.toJson(), {
          'userId': 'user_id',
          'eventType': 'event_type',
          'status': 'status',
          'startDate': 'start_date',
          'endDate': 'end_date',
          'limit': 'limit',
          'offset': 'offset',
        })));
    return decodeList(response['events'] ?? <Object?>[], Event.fromJson);
  }

  Future<SearchResult> search(SearchRequest request) async => decodeModel(
      await http.post(
          '/search',
          _renamed(request.toJson(), {
            'query': 'query',
            'userId': 'user_id',
            'eventType': 'event_type',
            'startDate': 'start_date',
            'endDate': 'end_date',
            'limit': 'limit',
            'page': 'page',
          })),
      SearchResult.fromJson);

  Future<Event> byHash(String ipfsHash) async => decodeModel(
      await http.get('/tenant/events/by-hash/$ipfsHash'), Event.fromJson);

  Future<List<Event>> createBatch(List<CreateEventRequest> events) async {
    final results = <Event>[];
    for (final event in events) {
      results.add(await create(event));
    }
    return results;
  }
}

class ChannelsResource {
  final HttpClient http;
  ChannelsResource(this.http);

  Future<Channel> create(CreateChannelRequest request) async =>
      decodeModel(await http.post('/channels', request), Channel.fromJson);
  Future<Channel> get(String channelId) async =>
      decodeModel(await http.get('/channels/$channelId'), Channel.fromJson);
  Future<ChannelStatus> status(String channelId) async => decodeModel(
      await http.get('/channels/$channelId/status'), ChannelStatus.fromJson);
  Future<List<Channel>> list([num limit = 50, num offset = 0]) async {
    final response = asJsonMap(
        await http.get('/channels', {'limit': limit, 'offset': offset}));
    return decodeList(response['channels'] ?? <Object?>[], Channel.fromJson);
  }

  Future<StreamAck> stream(String channelId, StreamEventRequest request) async {
    final body = _renamed(request.toJson(),
        {'eventType': 'event_type', 'userId': 'user_id', 'data': 'data'});
    body['event_source'] = jsTruthy(request.source) ? request.source : 'sdk';
    return decodeModel(await http.post('/channels/$channelId/stream', body),
        StreamAck.fromJson);
  }

  Future<JsonMap> streamBatch(
          String channelId, List<StreamEventRequest> events) async =>
      asJsonMap(await http
          .post('/channels/$channelId/stream/batch', {'events': events}));
  Future<Settlement> settle(String channelId) async => decodeModel(
      await http.post('/channels/$channelId/settle'), Settlement.fromJson);
  Future<Channel> close(String channelId) async => decodeModel(
      await http.post('/channels/$channelId/close'), Channel.fromJson);
}

class CertificatesResource {
  final HttpClient http;
  CertificatesResource(this.http);

  Future<Certificate> issue(IssueCertificateRequest request) async =>
      decodeModel(
          await http.post(
              '/certificates',
              _renamed(request.toJson(), {
                'recipientName': 'recipient_name',
                'recipientEmail': 'recipient_email',
                'title': 'title',
                'description': 'description',
                'metadata': 'metadata',
                'expiresAt': 'expires_at',
              })),
          Certificate.fromJson);
  Future<Certificate> get(String certificateId) async => decodeModel(
      await http.get('/certificates/$certificateId'), Certificate.fromJson);
  Future<List<Certificate>> list(
      [ListCertificatesRequest request =
          const ListCertificatesRequest()]) async {
    final response = asJsonMap(await http.get(
        '/certificates',
        _renamed(request.toJson(), {
          'recipientEmail': 'recipient_email',
          'limit': 'limit',
          'offset': 'offset',
        })));
    return decodeList(
        response['certificates'] ?? <Object?>[], Certificate.fromJson);
  }

  Future<Certificate> revoke(String certificateId, [String? reason]) async =>
      decodeModel(
          await http.post('/certificates/$certificateId/revoke',
              {if (reason != null) 'reason': reason}),
          Certificate.fromJson);
  Future<JsonMap> verify(String certificateId) async =>
      asJsonMap(await http.get('/verify/cert/$certificateId'));
}

class WebhooksResource {
  final HttpClient http;
  WebhooksResource(this.http);

  Future<Webhook> create(CreateWebhookRequest request) async =>
      decodeModel(await http.post('/webhooks', request), Webhook.fromJson);
  Future<Webhook> get(String webhookId) async =>
      decodeModel(await http.get('/webhooks/$webhookId'), Webhook.fromJson);
  Future<List<Webhook>> list() async {
    final response = asJsonMap(await http.get('/webhooks'));
    return decodeList(response['webhooks'] ?? <Object?>[], Webhook.fromJson);
  }

  Future<Webhook> update(
          String webhookId, UpdateWebhookRequest request) async =>
      decodeModel(
          await http.patch('/webhooks/$webhookId', request), Webhook.fromJson);
  Future<void> delete(String webhookId) async {
    await http.delete('/webhooks/$webhookId');
  }

  Future<JsonMap> test(String webhookId) async =>
      asJsonMap(await http.post('/webhooks/$webhookId/test'));
}

/// Native Dart entry point for ProofChain API resources.
///
/// Resources share one HTTP transport. Use [ProofChain.forEndUser] in native
/// applications and keep backend API keys on trusted servers. Call [close]
/// after all requests and notification subscriptions are no longer needed.
class ProofChain {
  final HttpClient _http;
  late final DocumentsResource documents = DocumentsResource(_http);
  late final EventsResource events = EventsResource(_http);
  late final ChannelsResource channels = ChannelsResource(_http);
  late final CertificatesResource certificates = CertificatesResource(_http);
  late final WebhooksResource webhooks = WebhooksResource(_http);
  late final VaultResource vault = VaultResource(_http);
  late final SearchResource search = SearchResource(_http);
  late final VerifyResource verifyResource = VerifyResource(_http);
  late final TenantResource tenant = TenantResource(_http);
  late final PassportClient passports = PassportClient(_http);
  late final WalletClient wallets = WalletClient(_http);
  late final EndUsersClient users = EndUsersClient(_http);
  late final RewardsClient rewards = RewardsClient(_http);
  late final QuestsClient quests = QuestsClient(_http);
  late final SchemasClient schemas = SchemasClient(_http);
  late final DataViewsClient dataViews = DataViewsClient(_http);
  late final CohortLeaderboardClient cohorts = CohortLeaderboardClient(_http);
  late final FanpassLeaderboardClient fanpassLeaderboard =
      FanpassLeaderboardClient(_http);
  late final NotificationsClient notifications = NotificationsClient(_http);
  late final CredentialsClient credentials = CredentialsClient(_http);
  late final NftClient nft = NftClient(_http);
  late final PartnerKeysClient partnerKeys = PartnerKeysClient(_http);
  late final AttestationsClient attestations = AttestationsClient(_http);
  late final AirKitClient airkit = AirKitClient(_http);

  /// Creates a client with explicit authentication and routing [options].
  ProofChain(ProofChainOptions options) : _http = HttpClient(options);

  /// Creates an end-user client using a JWT and its tenant scope.
  ///
  /// Does not request or refresh tokens. [timeout] is the header-phase timeout
  /// in milliseconds (default 30000); [maxRetries] defaults to 3 additional
  /// attempts for eligible pre-header network failures.
  factory ProofChain.forEndUser(
          {required String userToken,
          required String tenantId,
          String? baseUrl,
          num? timeout,
          num? maxRetries}) =>
      ProofChain(ProofChainOptions(
          userToken: userToken,
          tenantId: tenantId,
          baseUrl: baseUrl,
          timeout: timeout,
          maxRetries: maxRetries));

  /// Creates a backend client from `PROOFCHAIN_API_KEY` and optional
  /// `PROOFCHAIN_BASE_URL` environment variables.
  ///
  /// Throws [StateError] for a missing or empty key. Do not use this backend
  /// credential flow in distributed native applications.
  factory ProofChain.fromEnv() {
    final apiKey = io.Platform.environment['PROOFCHAIN_API_KEY'];
    if (apiKey == null || apiKey.isEmpty) {
      throw StateError('PROOFCHAIN_API_KEY environment variable not set');
    }
    return ProofChain(ProofChainOptions(
        apiKey: apiKey,
        baseUrl: io.Platform.environment['PROOFCHAIN_BASE_URL']));
  }

  /// Reads public verification information for an IPFS hash.
  Future<VerificationResult> verify(String ipfsHash) async => decodeModel(
      await _http.get('/verify/$ipfsHash'), VerificationResult.fromJson);

  /// Reads information about the authenticated tenant.
  Future<TenantInfo> tenantInfo() async =>
      decodeModel(await _http.get('/tenant/me'), TenantInfo.fromJson);

  /// Reads tenant usage for [period], defaulting to `month`.
  Future<UsageStats> usage([String period = 'month']) async => decodeModel(
      await _http.get('/tenant/usage', {'period': period}),
      UsageStats.fromJson);

  /// Idempotently releases sockets and all notification subscriptions.
  ///
  /// Active requests are force-closed. Separately constructed ingestion clients
  /// and transports are not owned by this instance.
  void close() {
    notifications.close();
    _http.close();
  }
}
