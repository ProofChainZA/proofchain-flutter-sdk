import 'http.dart';
import 'json.dart';
import 'models.dart';
import 'upload.dart';

class RewardsClient {
  final HttpClient http;
  RewardsClient(this.http);

  Future<List<RewardDefinition>> listDefinitions(
      [ListRewardsOptions? options]) async {
    final params = <String, Object?>{};
    if (options?.is_active != null) params['is_active'] = options!.is_active;
    if (jsTruthy(options?.reward_type)) {
      params['reward_type'] = options!.reward_type;
    }
    return decodeList(
        await http.get('/rewards/definitions?${queryString(params)}'),
        RewardDefinition.fromJson);
  }

  Future<RewardDefinition> getDefinition(String definitionId) async =>
      decodeModel(await http.get('/rewards/definitions/$definitionId'),
          RewardDefinition.fromJson);
  Future<RewardDefinition> createDefinition(
          CreateRewardDefinitionRequest data) async =>
      decodeModel(await http.post('/rewards/definitions', data),
          RewardDefinition.fromJson);
  Future<RewardDefinition> updateDefinition(
          String definitionId, JsonMap data) async =>
      decodeModel(await http.patch('/rewards/definitions/$definitionId', data),
          RewardDefinition.fromJson);
  Future<void> deleteDefinition(String definitionId) async {
    await http.delete('/rewards/definitions/$definitionId');
  }

  Future<RewardDefinition> activateDefinition(String definitionId) async =>
      decodeModel(
          await http
              .post('/rewards/definitions/$definitionId/activate', const {}),
          RewardDefinition.fromJson);
  Future<RewardDefinition> deactivateDefinition(String definitionId) async =>
      decodeModel(
          await http
              .post('/rewards/definitions/$definitionId/deactivate', const {}),
          RewardDefinition.fromJson);
  Future<List<EarnedReward>> listEarned([JsonMap options = const {}]) async {
    final params = <String, Object?>{};
    for (final key in const [
      'user_id',
      'definition_id',
      'status',
      'limit',
      'offset'
    ]) {
      if (jsTruthy(options[key])) params[key] = options[key];
    }
    return decodeList(await http.get('/rewards/earned?${queryString(params)}'),
        EarnedReward.fromJson);
  }

  Future<List<RewardUserReward>> getUserRewards(String userId,
      [JsonMap options = const {}]) async {
    final params = <String, Object?>{};
    for (final key in const ['status', 'reward_type', 'category']) {
      if (jsTruthy(options[key])) params[key] = options[key];
    }
    final query = queryString(params);
    return decodeList(
        await http.get(
            '/rewards/users/$userId/rewards${query.isEmpty ? '' : '?$query'}'),
        RewardUserReward.fromJson);
  }

  Future<List<RewardDefinition>> getCatalog([String? category]) async {
    final query = queryString({if (jsTruthy(category)) 'category': category});
    return decodeList(
        await http.get('/rewards/catalog${query.isEmpty ? '' : '?$query'}'),
        RewardDefinition.fromJson);
  }

  Future<ClaimNFTResult> claimNFT(
          String earnedRewardId, String walletAddress) async =>
      decodeModel(
          await http.post(
              '/rewards/earned/$earnedRewardId/claim?wallet_address=${encodeComponent(walletAddress)}',
              const {}),
          ClaimNFTResult.fromJson);
  Future<ClaimNFTResult> claimReward(
          String earnedRewardId, String walletAddress) =>
      claimNFT(earnedRewardId, walletAddress);
  Future<List<EarnedReward>> award(ManualRewardRequest request) async =>
      decodeList(
          await http.post('/rewards/award', request), EarnedReward.fromJson);
  Future<List<EarnedReward>> awardManual(ManualRewardRequest request) =>
      award(request);
  Future<DistributeResult> distribute(
          String earnedRewardId) async =>
      decodeModel(
          await http
              .post('/rewards/earned/$earnedRewardId/distribute', const {}),
          DistributeResult.fromJson);
  Future<DistributeResult> distributePending(String earnedRewardId) =>
      distribute(earnedRewardId);
  Future<JsonMap> distributeAll() async =>
      asJsonMap(await http.post('/rewards/distribute-all-pending', const {}));
  Future<RevokeResult> revoke(String earnedRewardId, String reason) async =>
      decodeModel(
          await http.post(
              '/rewards/earned/$earnedRewardId/revoke?reason=${encodeComponent(reason)}',
              const {}),
          RevokeResult.fromJson);
  Future<RewardAsset> uploadAsset(
          String definitionId, UploadFile file, String assetType) async =>
      decodeModel(
          await http.requestMultipart(
              '/rewards/definitions/$definitionId/assets',
              files: {'file': file},
              fields: {'asset_type': assetType}),
          RewardAsset.fromJson);
  Future<List<RewardAsset>> listAssets(String definitionId) async => decodeList(
      await http.get('/rewards/definitions/$definitionId/assets'),
      RewardAsset.fromJson);
  Future<RewardAttestationResult> attest(String earnedRewardId) async =>
      decodeModel(
          await http.post('/rewards/earned/$earnedRewardId/attest', const {}),
          RewardAttestationResult.fromJson);
  Future<AnchorResult> anchor(String earnedRewardId) async => decodeModel(
      await http.post('/rewards/earned/$earnedRewardId/anchor', const {}),
      AnchorResult.fromJson);
  Future<RewardAttestationResult> getAttestation(String earnedRewardId) async =>
      decodeModel(await http.get('/rewards/earned/$earnedRewardId/attestation'),
          RewardAttestationResult.fromJson);
  Future<RewardVerifyResult> verifyAttestation(String earnedRewardId) async =>
      decodeModel(await http.get('/rewards/earned/$earnedRewardId/verify'),
          RewardVerifyResult.fromJson);
}
