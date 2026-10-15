import 'dart:convert';

import 'package:proofchain_sdk/proofchain.dart';
import 'package:test/test.dart';

import 'support/local_api.dart';

void main() {
  test('step edits preserve editable data and nulls across full replacements',
      () async {
    JsonMap quest = {
      'id': 'q1',
      'steps': <Object?>[
        <String, Object?>{
          'id': 's1',
          'quest_id': 'q1',
          'name': 'First',
          'order': 4,
          'step_type': 'manual',
          'is_optional': false,
          'criteria': {'count': 3},
          'required_data_fields': ['reference'],
          'step_points': 9,
          'cta_url': null,
          'server_owned': 'must not be sent back'
        },
      ]
    };
    final api = await LocalApi.start((request) async {
      if (request.method == 'PUT') {
        final input =
            jsonDecode(await utf8.decoder.bind(request).join()) as JsonMap;
        final steps = (input['steps'] as List<Object?>).cast<JsonMap>();
        expect(
            steps.any((step) =>
                step.containsKey('id') || step.containsKey('server_owned')),
            false);
        quest = {
          ...quest,
          'steps': [
            for (final step in steps)
              {
                ...step,
                'id': step['name'] == 'First' ? 's1' : 's2',
                'quest_id': 'q1'
              }
          ]
        };
      }
      await respond(request, quest);
    });
    final sdk = ProofChain(ProofChainOptions(baseUrl: api.url, maxRetries: 0));
    addTearDown(sdk.close);
    await sdk.quests.updateStep('q1', 's1', {'cta_text': 'Open'});
    final added = await sdk.quests.addStep(
        'q1',
        const CreateQuestStepRequest(
            name: 'Second', step_type: 'manual', is_optional: false));
    expect(added.order, 5);
    final reordered = await sdk.quests.reorderSteps('q1', ['s2', 's1']);
    expect(reordered.steps.map((step) => step.id).toList(), ['s2', 's1']);
    expect(reordered.steps.map((step) => step.order).toList(), [0, 1]);
    final retained = reordered.steps.last;
    expect(retained.criteria, {'count': 3});
    expect(retained.required_data_fields, ['reference']);
    expect(retained.step_points, 9);
    expect(retained.cta_text, 'Open');
    expect(retained.toJson().containsKey('cta_url'), true);
    expect(retained.toJson()['cta_url'], null);
    await sdk.quests.deleteStep('q1', 's2');
    expect((await sdk.quests.get('q1')).steps.map((step) => step.id).toList(),
        ['s1']);
  });

  test('missing user progress does not hide an available quest', () async {
    final api = await LocalApi.start((request) async {
      if (request.uri.path.contains('/progress/')) {
        await respond(request, {'detail': 'No progress yet'}, status: 404);
      } else {
        await respond(
            request, {'id': 'q1', 'name': 'Available', 'steps': <Object?>[]});
      }
    });
    final sdk = ProofChain(ProofChainOptions(baseUrl: api.url, maxRetries: 0));
    addTearDown(sdk.close);
    final result = await sdk.quests.getWithProgress('q1', 'new-fan');
    expect(result.quest.id, 'q1');
    expect(result.progress, null);
  });
}
