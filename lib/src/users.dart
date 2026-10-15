import 'dart:typed_data';

import 'http.dart';
import 'json.dart';
import 'models.dart';

class EndUsersClient {
  EndUsersClient(this.http);

  final HttpClient http;

  String _externalPath(String externalId) =>
      '/end-users/by-external/${encodeComponent(externalId)}';

  String _truthyQuery(JsonMap options, List<String> keys) => queryString({
        for (final key in keys)
          if (jsTruthy(options[key])) key: options[key],
      });

  Future<EndUserListResponse> list(
      [ListEndUsersOptions options = const ListEndUsersOptions()]) async {
    final params = <String, Object?>{};
    final values = options.toJson();
    for (final key in ['page', 'page_size', 'search', 'status', 'segment']) {
      if (jsTruthy(values[key])) params[key] = values[key];
    }
    for (final key in ['has_wallet', 'min_events']) {
      if (values[key] != null) params[key] = values[key];
    }
    for (final key in ['sort_by', 'sort_order']) {
      if (jsTruthy(values[key])) params[key] = values[key];
    }
    return decodeModel(await http.get('/end-users?${queryString(params)}'),
        EndUserListResponse.fromJson);
  }

  Future<EndUser> get(String externalId) async =>
      decodeModel(await http.get(_externalPath(externalId)), EndUser.fromJson);

  Future<EndUser> getByInternalId(String userId) async =>
      decodeModel(await http.get('/end-users/$userId'), EndUser.fromJson);

  Future<EndUser> create(CreateEndUserRequest data) async =>
      decodeModel(await http.post('/end-users', data), EndUser.fromJson);

  Future<EndUser> update(String externalId, UpdateEndUserRequest data) async =>
      decodeModel(
          await http.patch(_externalPath(externalId), data), EndUser.fromJson);

  Future<void> delete(String userId) async {
    await http.delete('/end-users/$userId');
  }

  Future<EndUser> linkWallet(
          String externalId, LinkWalletRequest request) async =>
      decodeModel(
          await http.post('${_externalPath(externalId)}/link-wallet', request),
          EndUser.fromJson);

  Future<UserActivityResponse> getActivity(String externalId,
          [JsonMap options = const {}]) async =>
      decodeModel(
          await http.get('${_externalPath(externalId)}/activity?'
              '${_truthyQuery(options, ['page', 'page_size', 'event_type'])}'),
          UserActivityResponse.fromJson);

  Future<EndUser> addPoints(String externalId, num points,
          [String? reason]) async =>
      decodeModel(
          await http.post(
              '${_externalPath(externalId)}/add-points?'
              '${queryString({
                    'points': points,
                    if (jsTruthy(reason)) 'reason': reason
                  })}',
              const <String, Object?>{}),
          EndUser.fromJson);

  Future<EndUser> merge(MergeUsersRequest request) async => decodeModel(
      await http.post('/end-users/merge', request), EndUser.fromJson);

  Future<EndUser> updateByInternalId(
          String userId, UpdateEndUserRequest data) async =>
      decodeModel(
          await http.patch('/end-users/$userId', data), EndUser.fromJson);

  Future<UserRewardsResponse> getRewards(String externalId,
          [JsonMap options = const {}]) async =>
      decodeModel(
          await http.get('${_externalPath(externalId)}/rewards?'
              '${_truthyQuery(options, ['status', 'page', 'page_size'])}'),
          UserRewardsResponse.fromJson);

  Future<UserRewardsResponse> getRewardsByInternalId(String userId,
          [JsonMap options = const {}]) async =>
      decodeModel(
          await http.get('/end-users/$userId/rewards?'
              '${_truthyQuery(options, ['status', 'page', 'page_size'])}'),
          UserRewardsResponse.fromJson);

  Future<WalletCreationResult> createWallet(String externalId,
          [CreateUserWalletRequest request =
              const CreateUserWalletRequest()]) async =>
      decodeModel(
          await http.post(
              '${_externalPath(externalId)}/create-wallet', request),
          WalletCreationResult.fromJson);

  Future<WalletCreationResult> registerWallet(
          String externalId, RegisterWalletRequest request) async =>
      decodeModel(
          await http.post(
              '${_externalPath(externalId)}/register-wallet', request),
          WalletCreationResult.fromJson);

  Future<EnsureWalletResult> ensureWallet(String externalId,
      [String network = 'base-mainnet']) async {
    try {
      final response =
          await http.get('/wallets/user/${encodeComponent(externalId)}/all');
      final result =
          response == null ? const <String, Object?>{} : asJsonMap(response);
      final assets = result['asset_wallets'] as List<Object?>?;
      final smarts = result['smart_wallets'] as List<Object?>?;
      final eoaValue =
          assets != null && assets.isNotEmpty ? assets.first : null;
      final smartValue =
          smarts != null && smarts.isNotEmpty ? smarts.first : null;
      if (jsTruthy(eoaValue) && jsTruthy(smartValue)) {
        final eoa = asJsonMap(eoaValue);
        return EnsureWalletResult.fromJson({
          'user_id': externalId,
          'asset_wallet': eoa,
          'smart_wallet': smartValue,
          'network': eoa['network'],
          'created': false,
        });
      }
      if (jsTruthy(eoaValue) && !jsTruthy(smartValue)) {
        final eoa = asJsonMap(eoaValue);
        final smartWallet = await http.post('/wallets', {
          'user_id': externalId,
          'wallet_type': 'smart',
          if (eoa.containsKey('network')) 'network': eoa['network'],
          'metadata': {
            if (eoa.containsKey('wallet_id'))
              'owner_wallet_id': eoa['wallet_id'],
          },
        });
        return EnsureWalletResult.fromJson({
          'user_id': externalId,
          'asset_wallet': eoa,
          'smart_wallet': smartWallet,
          'network': eoa['network'],
          'created': true,
        });
      }
      if (jsTruthy(smartValue) && !jsTruthy(eoaValue)) {
        final smart = asJsonMap(smartValue);
        final eoaWallet = await http.post('/wallets', {
          'user_id': externalId,
          'wallet_type': 'eoa',
          if (smart.containsKey('network')) 'network': smart['network'],
        });
        return EnsureWalletResult.fromJson({
          'user_id': externalId,
          'asset_wallet': eoaWallet,
          'smart_wallet': smart,
          'network': smart['network'],
          'created': true,
        });
      }
    } catch (_) {
      // The JavaScript SDK also creates a dual pair after any lookup or
      // single-wallet creation error, not only a not-found response.
    }
    final dual = asJsonMap(await http.post('/wallets/dual', {
      'user_id': externalId,
      'network': network,
    }));
    return EnsureWalletResult.fromJson({...dual, 'created': true});
  }

  Future<EndUser> updateAttributes(
          String externalId, JsonMap attributes) async =>
      decodeModel(
          await http
              .patch(_externalPath(externalId), {'attributes': attributes}),
          EndUser.fromJson);

  Future<EndUser> removeAttributes(String externalId, List<String> keys) async {
    final user = await get(externalId);
    final attributes = Map<String, Object?>.of(user.attributes);
    for (final key in keys) {
      attributes.remove(key);
    }
    return decodeModel(
        await http.patch(_externalPath(externalId), {'attributes': attributes}),
        EndUser.fromJson);
  }

  Future<EndUser> setProfile(
          String externalId, SetProfileRequest profile) async =>
      decodeModel(await http.patch(_externalPath(externalId), profile),
          EndUser.fromJson);

  Future<GDPRPreviewResponse> gdprPreview(String userId) async => decodeModel(
      await http.get('/end-users/$userId/gdpr/preview'),
      GDPRPreviewResponse.fromJson);

  Future<GDPRDeletionResponse> gdprDelete(
          String userId, GDPRDeletionRequest request) async =>
      decodeModel(
          await http.request('DELETE', '/end-users/$userId/gdpr',
              body: request),
          GDPRDeletionResponse.fromJson);

  /// Returns CSV/JSON bytes through the configured API rather than browser fetch.
  Future<Uint8List> export([JsonMap options = const {}]) async {
    final response = await http.openStream(
        '/end-users/export?'
        '${_truthyQuery(options, ['segment', 'format'])}',
        headers: {'Accept': 'text/csv'});
    final bytes = BytesBuilder(copy: false);
    await for (final chunk in response) {
      bytes.add(chunk);
    }
    return bytes.takeBytes();
  }
}
