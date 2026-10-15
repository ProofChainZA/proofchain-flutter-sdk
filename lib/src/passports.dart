import 'http.dart';
import 'json.dart';
import 'models.dart';

class PassportClient {
  PassportClient(this.http);

  final HttpClient http;

  String _userPath(String userId) => '/passports/${encodeComponent(userId)}';

  String _listQuery(ListOptions options) => queryString({
        if (jsTruthy(options.limit)) 'limit': options.limit,
        if (jsTruthy(options.offset)) 'offset': options.offset,
      });

  Future<List<Passport>> list(
          [ListOptions options = const ListOptions()]) async =>
      decodeList(await http.get('/passports?${_listQuery(options)}'),
          Passport.fromJson);

  Future<Passport> get(String userId) async =>
      decodeModel(await http.get(_userPath(userId)), Passport.fromJson);

  Future<PassportWithFields> getWithFields(String userId) async {
    final passport = await get(userId);
    final fields = await getFieldValues(userId);
    return PassportWithFields.fromJson({
      ...passport.toJson(),
      'field_values': fields.map((field) => field.toJson()).toList(),
    });
  }

  Future<Passport> create(CreatePassportRequest data) async =>
      decodeModel(await http.post('/passports', data), Passport.fromJson);

  Future<Passport> update(String userId, UpdatePassportRequest data) async =>
      decodeModel(await http.put(_userPath(userId), data), Passport.fromJson);

  Future<void> delete(String userId) async {
    await http.delete(_userPath(userId));
  }

  Future<Passport> addPoints(String userId, num points,
          [String? reason]) async =>
      decodeModel(
          await http.post('${_userPath(userId)}/add-points', {
            'points': points,
            if (reason != null) 'reason': reason,
          }),
          Passport.fromJson);

  Future<Passport> levelUp(String userId) async => decodeModel(
      await http
          .post('${_userPath(userId)}/level-up', const <String, Object?>{}),
      Passport.fromJson);

  Future<Passport> linkWallet(String userId, String walletAddress) =>
      update(userId, UpdatePassportRequest(wallet_address: walletAddress));

  Future<List<FieldValue>> getFieldValues(String userId) async => decodeList(
      await http.get('${_userPath(userId)}/fields'), FieldValue.fromJson);

  Future<void> setFieldValue(
      String userId, String fieldKey, Object? value) async {
    await http.put('${_userPath(userId)}/fields/$fieldKey', value);
  }

  Future<JsonMap> recomputeFields(String userId) async => asJsonMap(await http
      .post('${_userPath(userId)}/recompute', const <String, Object?>{}));

  Future<void> assignTemplate(String userId, String templateId) async {
    await http.post('${_userPath(userId)}/assign-template/$templateId',
        const <String, Object?>{});
  }

  Future<List<PassportTemplate>> listTemplates() async => decodeList(
      await http.get('/passports/templates'), PassportTemplate.fromJson);

  Future<PassportTemplate> getTemplate(String templateId) async => decodeModel(
      await http.get('/passports/templates/$templateId'),
      PassportTemplate.fromJson);

  Future<PassportTemplate> createTemplate(CreateTemplateRequest data) async =>
      decodeModel(await http.post('/passports/templates', data),
          PassportTemplate.fromJson);

  Future<TemplateField> addTemplateField(
          String templateId, CreateTemplateFieldRequest field) async =>
      decodeModel(
          await http.post('/passports/templates/$templateId/fields', field),
          TemplateField.fromJson);

  Future<void> deleteTemplate(String templateId) async {
    await http.delete('/passports/templates/$templateId');
  }

  Future<List<Badge>> listBadges() async =>
      decodeList(await http.get('/passports/badges'), Badge.fromJson);

  Future<Badge> createBadge(CreateBadgeRequest data) async =>
      decodeModel(await http.post('/passports/badges', data), Badge.fromJson);

  Future<UserBadge> awardBadge(String userId, String badgeId,
          [JsonMap? metadata]) async =>
      decodeModel(
          await http.post('${_userPath(userId)}/badges/$badgeId', {
            if (metadata != null) 'metadata': metadata,
          }),
          UserBadge.fromJson);

  Future<List<UserBadge>> getUserBadges(String userId) async => decodeList(
      await http.get('${_userPath(userId)}/badges'), UserBadge.fromJson);

  Future<List<Achievement>> listAchievements() async => decodeList(
      await http.get('/passports/achievements'), Achievement.fromJson);

  Future<Achievement> createAchievement(CreateAchievementRequest data) async =>
      decodeModel(await http.post('/passports/achievements', data),
          Achievement.fromJson);

  Future<List<UserAchievement>> getUserAchievements(String userId) async =>
      decodeList(await http.get('${_userPath(userId)}/achievements'),
          UserAchievement.fromJson);

  Future<UserAchievement> updateAchievementProgress(
          String userId, String achievementId, num progress) async =>
      decodeModel(
          await http.put('${_userPath(userId)}/achievements/$achievementId',
              {'progress': progress}),
          UserAchievement.fromJson);

  Future<List<PassportHistory>> getHistory(String userId,
          [ListOptions options = const ListOptions()]) async =>
      decodeList(
          await http.get('${_userPath(userId)}/history?${_listQuery(options)}'),
          PassportHistory.fromJson);

  Future<PassportV2Data> getPassportV2(String userId,
          [String? passportId]) async =>
      decodeModel(
          await http.get('/passport-v2/users/${encodeComponent(userId)}'
              '${jsTruthy(passportId) ? '?passport_id=$passportId' : ''}'),
          PassportV2Data.fromJson);

  Future<PassportV2Data> getPassportView(String userId, [String? passportId]) =>
      getPassportV2(userId, passportId);

  Future<List<Milestone>> getMilestones(String userId,
          [String? passportId]) async =>
      decodeList(
          await http
              .get('/passport-v2/users/${encodeComponent(userId)}/milestones'
                  '${jsTruthy(passportId) ? '?passport_id=$passportId' : ''}'),
          Milestone.fromJson);

  Future<List<AvailableView>> listAvailableViews() async => decodeList(
      await http.get('/passport-v2/available-views'), AvailableView.fromJson);

  Future<List<PassportDefinition>> listPassportDefinitions() async =>
      decodeList(await http.get('/passport-v2/definitions'),
          PassportDefinition.fromJson);

  Future<PassportDefinition> createPassportDefinition(
          CreatePassportDefinitionRequest definition) async =>
      decodeModel(await http.post('/passport-v2/definitions', definition),
          PassportDefinition.fromJson);
}
