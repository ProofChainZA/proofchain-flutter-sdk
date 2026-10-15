import 'http.dart';
import 'json.dart';
import 'models.dart';

class QuestsClient {
  QuestsClient(this.http);

  final HttpClient http;

  Future<List<Quest>> list(
      [ListQuestsOptions options = const ListQuestsOptions()]) async {
    final params = <String, Object?>{
      if (jsTruthy(options.status)) 'status': options.status,
      if (jsTruthy(options.category)) 'category': options.category,
      if (options.is_public != null) 'is_public': options.is_public,
      if (options.is_featured != null) 'is_featured': options.is_featured,
      if (jsTruthy(options.limit)) 'limit': options.limit,
      if (jsTruthy(options.offset)) 'offset': options.offset,
    };
    return decodeList(
        await http.get('/quests?${queryString(params)}'), Quest.fromJson);
  }

  Future<Quest> get(String questId) async =>
      decodeModel(await http.get('/quests/$questId'), Quest.fromJson);

  Future<List<QuestWithProgress>> listAvailable(String userId,
          [JsonMap options = const {}]) async =>
      decodeList(
          await http.get('/quests/available?${queryString({
                'user_id': userId,
                if (jsTruthy(options['category']))
                  'category': options['category'],
              })}'),
          QuestWithProgress.fromJson);

  Future<Quest> create(CreateQuestRequest data) async =>
      decodeModel(await http.post('/quests', data), Quest.fromJson);

  Future<Quest> update(String questId, JsonMap data) async =>
      decodeModel(await http.put('/quests/$questId', data), Quest.fromJson);

  Future<void> delete(String questId) async {
    await http.delete('/quests/$questId');
  }

  Future<Quest> publish(String questId) async => decodeModel(
      await http.post('/quests/$questId/publish', const <String, Object?>{}),
      Quest.fromJson);

  Future<Quest> activate(String questId) => publish(questId);

  Future<Quest> pause(String questId) async => decodeModel(
      await http.post('/quests/$questId/pause', const <String, Object?>{}),
      Quest.fromJson);

  Future<QuestWithProgress> getWithProgress(
      String questId, String userId) async {
    final results = await Future.wait<Object?>([
      get(questId),
      getUserProgress(questId, userId).then<UserQuestProgress?>(
          (progress) => progress,
          onError: (Object _, StackTrace __) => null),
    ], eagerError: true);
    return QuestWithProgress(
        quest: results[0] as Quest, progress: results[1] as UserQuestProgress?);
  }

  Future<List<QuestWithProgress>> listWithProgress(String userId,
          [ListQuestsOptions options = const ListQuestsOptions()]) =>
      listAvailable(userId, {'category': options.category});

  Future<UserQuestProgress> startQuest(String questId, String userId) async =>
      decodeModel(
          await http.post(
              '/quests/$questId/start?user_id=${encodeComponent(userId)}',
              const <String, Object?>{}),
          UserQuestProgress.fromJson);

  /// [quest] accepts a quest ID, a server-advertised path, a [Quest], or a
  /// JSON object with `id` and optional `cta_link_url` fields.
  Future<QuestCtaLink> resolveCtaLink(Object quest, [String? userId]) async {
    final String path;
    if (quest is String) {
      path = quest.startsWith('/')
          ? quest
          : '/quests/${encodeComponent(quest)}/cta-link';
    } else {
      final data = quest is Quest ? quest.toJson() : asJsonMap(quest);
      final advertised = data['cta_link_url'];
      path = jsTruthy(advertised)
          ? advertised as String
          : '/quests/${encodeComponent(data['id'] as String)}/cta-link';
    }
    final query =
        jsTruthy(userId) ? '?user_id=${encodeComponent(userId!)}' : '';
    return decodeModel(await http.get('$path$query'), QuestCtaLink.fromJson);
  }

  Future<List<QuestCtaResolver>> listCtaResolvers() async => decodeList(
      await http.get('/quests/cta-resolvers'), QuestCtaResolver.fromJson);

  Future<UserQuestProgress> getUserProgress(
          String questId, String userId) async =>
      decodeModel(
          await http
              .get('/quests/$questId/progress/${encodeComponent(userId)}'),
          UserQuestProgress.fromJson);

  Future<StepStartResult> startStep(
          String questId, String userId, num stepIndex) async =>
      decodeModel(
          await http.post(
              '/quests/$questId/progress/${encodeComponent(userId)}/step/${jsString(stepIndex)}/start',
              const <String, Object?>{}),
          StepStartResult.fromJson);

  Future<StepCompletionResult> completeStep(
          String questId, String userId, num stepIndex) async =>
      decodeModel(
          await http.post(
              '/quests/$questId/progress/${encodeComponent(userId)}/step/${jsString(stepIndex)}/complete',
              const <String, Object?>{}),
          StepCompletionResult.fromJson);

  Future<List<UserQuestProgress>> getAllUserProgress(String userId) async =>
      decodeList(
          await http.get('/quests/user/${encodeComponent(userId)}/progress'),
          UserQuestProgress.fromJson);

  Future<ClaimRewardResult> claimReward(String questId, String userId) async =>
      decodeModel(
          await http.post(
              '/quests/$questId/progress/${encodeComponent(userId)}/claim',
              const <String, Object?>{}),
          ClaimRewardResult.fromJson);

  // PUT replaces the full steps array. Retain every editable field, including
  // explicit nulls from API responses, but omit server-owned IDs and metadata.
  JsonMap _stepPayload(QuestStep step) {
    final data = step.toJson();
    return {
      for (final key in const [
        'name',
        'description',
        'order',
        'step_type',
        'event_type',
        'event_types',
        'criteria',
        'required_data_fields',
        'step_points',
        'cta_text',
        'cta_url',
        'icon_url',
        'is_optional',
      ])
        if (data.containsKey(key)) key: data[key],
    };
  }

  Future<QuestStep> addStep(String questId, CreateQuestStepRequest step) async {
    final quest = await get(questId);
    num newOrder = step.order ?? 0;
    if (step.order == null && quest.steps.isNotEmpty) {
      newOrder = quest.steps.first.order;
      for (final existing in quest.steps.skip(1)) {
        if (existing.order > newOrder) newOrder = existing.order;
      }
      newOrder += 1;
    }
    final updated = await update(questId, {
      'steps': [
        for (final existing in quest.steps) _stepPayload(existing),
        {...step.toJson(), 'order': newOrder},
      ],
    });
    for (final added in updated.steps) {
      if (added.order == newOrder) return added;
    }
    return updated.steps.last;
  }

  Future<QuestStep> updateStep(
      String questId, String stepId, JsonMap data) async {
    final quest = await get(questId);
    final updated = await update(questId, {
      'steps': [
        for (final step in quest.steps)
          {..._stepPayload(step), if (step.id == stepId) ...data},
      ],
    });
    for (final step in updated.steps) {
      if (step.id == stepId) return step;
    }
    throw StateError('Step $stepId not found after update');
  }

  Future<void> deleteStep(String questId, String stepId) async {
    final quest = await get(questId);
    await update(questId, {
      'steps': [
        for (final step in quest.steps)
          if (step.id != stepId) _stepPayload(step),
      ],
    });
  }

  Future<Quest> reorderSteps(String questId, List<String> stepIds) async {
    final quest = await get(questId);
    final stepMap = {for (final step in quest.steps) step.id: step};
    final steps = <JsonMap>[];
    for (var index = 0; index < stepIds.length; index++) {
      final id = stepIds[index];
      final step = stepMap[id];
      if (step == null) {
        throw StateError('Step $id not found in quest $questId');
      }
      steps.add({..._stepPayload(step), 'order': index});
    }
    return update(questId, {'steps': steps});
  }
}
