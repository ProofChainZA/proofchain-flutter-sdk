import 'dart:convert';

import 'package:proofchain_sdk/proofchain.dart';
import 'package:test/test.dart';

import 'support/local_api.dart';

void main() {
  test('voucherAllFeeFree is the API sentinel', () {
    expect(voucherAllFeeFree, 'ALL_FEE_FREE');
  });

  test('listVoucherProducts sends every filter, including fee_free=false',
      () async {
    String? query;
    final api = await LocalApi.start((request) async {
      query = request.uri.query;
      await respond(request, [
        {
          'id': 'p1',
          'name': 'Coffee',
          'category': 'merchant_card',
          'currency_codes': ['GBP'],
          'countries': ['GB'],
          'skus': <Object?>[],
          'description': 'Desc',
          'disclosure': '<p>Terms</p>',
          'usage_instructions': 'Use online',
          'fee_free': true,
        },
        {
          'id': 'p2',
          'name': 'Charity',
          'category': 'charity',
          'currency_codes': ['GBP'],
          'countries': ['GB'],
          'skus': <Object?>[],
        },
      ]);
    });
    final sdk = ProofChain(ProofChainOptions(baseUrl: api.url, maxRetries: 0));
    addTearDown(sdk.close);
    final products = await sdk.rewards.listVoucherProducts(
        country: 'GB',
        currency: 'GBP',
        category: ['merchant_card', 'charity'],
        subcategory: ['food_and_drink', 'entertainment'],
        feeFree: false);
    expect(Uri.splitQueryString(query!), {
      'country': 'GB',
      'currency': 'GBP',
      'category': 'merchant_card,charity',
      'subcategory': 'food_and_drink,entertainment',
      'fee_free': 'false',
    });
    expect(products[0].description, 'Desc');
    expect(products[0].disclosure, '<p>Terms</p>');
    expect(products[0].usage_instructions, 'Use online');
    expect(products[0].fee_free, true);
    expect(products[1].fee_free, false);
    expect(products[1].disclosure, null);

    await sdk.rewards.listVoucherProducts();
    expect(query, '');
  });

  test('createDefinition sends voucher_language and voucher_message', () async {
    Map<String, Object?>? body;
    final api = await LocalApi.start((request) async {
      body =
          jsonDecode(await utf8.decodeStream(request)) as Map<String, Object?>;
      await respond(request, {
        'id': 'd1',
        'voucher_product_ids': ['p1', 'p2'],
        'voucher_language': 'fr',
        'voucher_message': 'Merci',
      });
    });
    final sdk = ProofChain(ProofChainOptions(baseUrl: api.url, maxRetries: 0));
    addTearDown(sdk.close);
    final definition = await sdk.rewards.createDefinition(
        CreateRewardDefinitionRequest(
            name: 'Gift',
            slug: 'gift',
            reward_type: 'voucher',
            value: 10,
            value_currency: 'GBP',
            voucher_product_ids: [voucherAllFeeFree],
            voucher_language: 'fr',
            voucher_message: 'Merci',
            voucher_delivery_methods: [
              voucherDeliveryLink,
              voucherDeliveryEmail
            ]));
    expect(body!['voucher_product_ids'], ['ALL_FEE_FREE']);
    expect(body!['voucher_language'], 'fr');
    expect(body!['voucher_message'], 'Merci');
    expect(body!['voucher_delivery_methods'], ['link', 'email']);
    expect(definition.voucher_language, 'fr');
    expect(definition.voucher_message, 'Merci');
    expect(definition.voucher_delivery_methods, null);
    expect(
        RewardDefinition.fromJson({
          'voucher_delivery_methods': ['link', 'sms']
        }).voucher_delivery_methods,
        ['link', 'sms']);
  });

  group('claimVoucher delivery', () {
    late List<String> bodies;
    late ProofChain sdk;
    setUp(() async {
      bodies = [];
      final api = await LocalApi.start((request) async {
        bodies.add(await utf8.decodeStream(request));
        await respond(request, {
          'success': true,
          'reward_id': 'e1',
          'status': 'claimed',
          'redemption_url': null,
          'expires_at': null,
          'delivery_method': 'email',
          'delivery_status': 'pending',
        });
      });
      sdk = ProofChain(ProofChainOptions(baseUrl: api.url, maxRetries: 0));
      addTearDown(sdk.close);
    });

    test('sends exact delivery bodies and decodes delivery fields', () async {
      final result = await sdk.rewards.claimVoucher('e1',
          delivery: const VoucherDelivery(
              method: voucherDeliveryEmail,
              email: 'fan@example.com',
              name: 'Sam'));
      await sdk.rewards.claimVoucher('e1',
          delivery: const VoucherDelivery(
              method: voucherDeliverySms, phone: '+447911123456'));
      await sdk.rewards.claimVoucher('e1',
          delivery: const VoucherDelivery(method: voucherDeliveryLink));
      expect(bodies.map(jsonDecode).toList(), [
        {
          'delivery': {
            'method': 'email',
            'email': 'fan@example.com',
            'name': 'Sam'
          }
        },
        {
          'delivery': {'method': 'sms', 'phone': '+447911123456'}
        },
        {
          'delivery': {'method': 'link'}
        },
      ]);
      expect(result.redemption_url, null);
      expect(result.delivery_method, 'email');
      expect(result.delivery_status, 'pending');
    });

    test('sends no delivery when absent', () async {
      await sdk.rewards.claimVoucher('e1');
      final body = bodies.single;
      expect(body.isEmpty || body == '{}', isTrue);
    });
  });

  test('EarnedReward decodes delivery tracking fields', () {
    final reward = EarnedReward.fromJson({
      'voucher_delivery_method': 'sms',
      'voucher_delivery_status': 'failed',
      'voucher_delivery_failure': 'sms_delivery_failed',
      'voucher_status_updated_at': '2026-10-30T12:00:00Z',
    });
    expect(reward.voucher_delivery_method, 'sms');
    expect(reward.voucher_delivery_status, 'failed');
    expect(reward.voucher_delivery_failure, 'sms_delivery_failed');
    expect(reward.voucher_status_updated_at, '2026-10-30T12:00:00Z');
  });
}
