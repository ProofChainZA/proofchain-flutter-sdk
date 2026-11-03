## Unreleased

- Add voucher (gift card) rewards: `reward_type` `'voucher'`,
  `RewardsClient.claimVoucher(earnedRewardId)` returning `ClaimVoucherResult`,
  and `RewardsClient.listVoucherProducts({country, currency})` returning
  `List<VoucherProduct>` (with `VoucherProductSku`).
- `RewardDefinition` and `CreateRewardDefinitionRequest` gain
  `voucher_product_ids` / `voucher_campaign_id`; `EarnedReward` gains
  `voucher_order_id`.
- Choose-your-own vouchers: several `voucher_product_ids` or the
  `voucherAllFeeFree` sentinel (`'ALL_FEE_FREE'`) let the fan choose on the
  redemption page; categories include charity/PayPal/prepaid where the account
  offers them. Definitions gain `voucher_language` / `voucher_message`.
- `listVoucherProducts` gains `category`, `subcategory` (comma-joined lists)
  and `feeFree` filters; `VoucherProduct` gains `description`, `disclosure`
  (provider HTML: sanitize before rendering), `usage_instructions` and
  `fee_free` (defaults to `false`).
- Email/SMS voucher delivery: `claimVoucher(earnedRewardId, {delivery})` takes
  an optional `VoucherDelivery` (`method`, `email`, `phone`, `name`; constants
  `voucherDeliveryLink`/`Email`/`Sms`), sent as `{"delivery": ...}` only when
  given. Contact details go to the provider and are never stored by Proofchain.
  `ClaimVoucherResult.redemption_url` is now nullable and the result gains
  `delivery_method` / `delivery_status`. Definitions gain
  `voucher_delivery_methods`; `EarnedReward` gains `voucher_delivery_method`,
  `voucher_delivery_status`, `voucher_delivery_failure` and
  `voucher_status_updated_at` (delivery only; redemption is not reported).

## 0.1.1

- Add generated model and core-client Dart API documentation.
- Add a runnable, environment-configured end-user example.
- Adopt pub.dev's core lint rules while retaining JavaScript model field casing.
- Link the standalone public Flutter SDK repository and developer guides.
- No runtime API or wire-format changes.

## 0.1.0

- Initial release. Native Dart client for Android, iOS and the Dart VM,
  mirroring the ProofChain JavaScript SDK: 24 resource namespaces, typed
  request/response models, API-key/JWT authentication, multipart uploads,
  binary downloads, standalone ingestion and SSE notifications.
