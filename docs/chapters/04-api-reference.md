# 16. API reference

This reference is generated from the Dart syntax tree, not handwritten method lists. Names, parameter positions, defaults and return types are the current source declarations. Signatures are reference notation, not standalone Dart programs. All `client.*` resources share the configuration and authentication of their owning `ProofChain` instance. Method availability does not grant authorization: the server must allow the requested operation for the current identity.

`JsonMap` means `Map<String, Object?>`; `UploadFile` carries bytes, a filename and content type; downloads use `Uint8List`. Optional positional parameters appear inside `[...]`; named parameters inside `{...}`. `Future<T>` must be awaited. A `JsonMap` return value has no stronger SDK field guarantee than the current server response.

## 16.1 Construction, lifecycle and top-level operations

```text
ProofChain(ProofChainOptions options)
```

```text
factory ProofChain.forEndUser({required String userToken, required String tenantId, String? baseUrl, num? timeout, num? maxRetries})
```

```text
factory ProofChain.fromEnv()
```

`ProofChain.fromEnv()` reads `PROOFCHAIN_API_KEY` and optional `PROOFCHAIN_BASE_URL` only. Missing/empty API key throws `StateError`. `tenantApiUrl(String slug)` returns `https://<slug>.proofchain.co.za/api`; it constructs a URL and does not discover, create or authenticate a tenant.

### `client.verify`

```text
Future<VerificationResult> verify(String ipfsHash)
```

### `client.tenantInfo`

```text
Future<TenantInfo> tenantInfo()
```

### `client.usage`

```text
Future<UsageStats> usage([String period = 'month'])
```

### `client.close` — native lifecycle

```text
void close()
```

## client.documents

Multipart document attestation and hash lookup.

Source: `lib/src/client.dart` · Class: `DocumentsResource`.

### `client.documents.attest`

```text
Future<AttestationResult> attest(AttestRequest request)
```

### `client.documents.get`

```text
Future<Event> get(String ipfsHash)
```

## client.events

Create, list, search and retrieve tenant events.

Source: `lib/src/client.dart` · Class: `EventsResource`.

### `client.events.create`

```text
Future<Event> create(CreateEventRequest request)
```

### `client.events.get`

```text
Future<Event> get(String eventId)
```

### `client.events.list`

```text
Future<List<Event>> list([ListEventsRequest request = const ListEventsRequest()])
```

### `client.events.search`

```text
Future<SearchResult> search(SearchRequest request)
```

### `client.events.byHash`

```text
Future<Event> byHash(String ipfsHash)
```

### `client.events.createBatch`

```text
Future<List<Event>> createBatch(List<CreateEventRequest> events)
```

## client.channels

Channel lifecycle, streaming and settlement.

Source: `lib/src/client.dart` · Class: `ChannelsResource`.

### `client.channels.create`

```text
Future<Channel> create(CreateChannelRequest request)
```

### `client.channels.get`

```text
Future<Channel> get(String channelId)
```

### `client.channels.status`

```text
Future<ChannelStatus> status(String channelId)
```

### `client.channels.list`

```text
Future<List<Channel>> list([num limit = 50, num offset = 0])
```

### `client.channels.stream`

```text
Future<StreamAck> stream(String channelId, StreamEventRequest request)
```

### `client.channels.streamBatch`

```text
Future<JsonMap> streamBatch(String channelId, List<StreamEventRequest> events)
```

### `client.channels.settle`

```text
Future<Settlement> settle(String channelId)
```

### `client.channels.close`

```text
Future<Channel> close(String channelId)
```

## client.certificates

Certificate issuance, lookup, revocation and verification.

Source: `lib/src/client.dart` · Class: `CertificatesResource`.

### `client.certificates.issue`

```text
Future<Certificate> issue(IssueCertificateRequest request)
```

### `client.certificates.get`

```text
Future<Certificate> get(String certificateId)
```

### `client.certificates.list`

```text
Future<List<Certificate>> list([ListCertificatesRequest request = const ListCertificatesRequest()])
```

### `client.certificates.revoke`

```text
Future<Certificate> revoke(String certificateId, [String? reason])
```

### `client.certificates.verify`

```text
Future<JsonMap> verify(String certificateId)
```

## client.webhooks

Manage and test server-to-server webhooks.

Source: `lib/src/client.dart` · Class: `WebhooksResource`.

### `client.webhooks.create`

```text
Future<Webhook> create(CreateWebhookRequest request)
```

### `client.webhooks.get`

```text
Future<Webhook> get(String webhookId)
```

### `client.webhooks.list`

```text
Future<List<Webhook>> list()
```

### `client.webhooks.update`

```text
Future<Webhook> update(String webhookId, UpdateWebhookRequest request)
```

### `client.webhooks.delete`

```text
Future<void> delete(String webhookId)
```

### `client.webhooks.test`

```text
Future<JsonMap> test(String webhookId)
```

## client.vault

Store, list, download, retrieve and remove vault documents.

Source: `lib/src/resources.dart` · Class: `VaultResource`.

### `client.vault.list`

```text
Future<VaultListResponse> list([String? folderId])
```

### `client.vault.upload`

```text
Future<VaultFile> upload(VaultUploadRequest request)
```

### `client.vault.get`

```text
Future<VaultFile> get(String fileId)
```

### `client.vault.download`

```text
Future<Uint8List> download(String fileId)
```

### `client.vault.delete`

```text
Future<void> delete(String fileId)
```

### `client.vault.move`

```text
Future<VaultFile> move(String fileId, String folderId)
```

### `client.vault.createFolder`

```text
Future<VaultFolder> createFolder(String name, [String? parentId])
```

### `client.vault.deleteFolder`

```text
Future<void> deleteFolder(String folderId)
```

### `client.vault.stats`

```text
Future<VaultStats> stats()
```

### `client.vault.share`

```text
Future<JsonMap> share(String fileId, [num? expiresInHours])
```

## client.search

Tenant search, user event history and event counts.

Source: `lib/src/resources.dart` · Class: `SearchResource`.

### `client.search.query`

```text
Future<SearchResponse> query([SearchQueryRequest? request])
```

### `client.search.quick`

```text
Future<SearchResponse> quick(String query, [num limit = 20])
```

### `client.search.byUser`

```text
Future<UserEventHistoryResponse> byUser(String userId, [Object? optionsOrLimit, num? offset])
```

### `client.search.byCertificate`

```text
Future<Event> byCertificate(String certificateId)
```

### `client.search.facets`

```text
Future<FacetsResponse> facets([String? fromDate, String? toDate])
```

### `client.search.stats`

```text
Future<SearchStats> stats()
```

## client.verifyResource

Verification lookups and proof operations.

Source: `lib/src/resources.dart` · Class: `VerifyResource`.

### `client.verifyResource.certificate`

```text
Future<CertificateVerifyResult> certificate(String certificateId)
```

### `client.verifyResource.event`

```text
Future<JsonMap> event(String ipfsHash)
```

### `client.verifyResource.proof`

```text
Future<ProofVerifyResult> proof(String leaf, List<String> proof, String root)
```

### `client.verifyResource.batch`

```text
Future<BatchVerifyResult> batch(String batchId)
```

### `client.verifyResource.eventBatchProof`

```text
Future<EventBatchProof> eventBatchProof(String eventId)
```

### `client.verifyResource.batchVerify`

```text
Future<JsonMap> batchVerify(List<JsonMap> items)
```

## client.tenant

Tenant context, API-key administration, usage and blockchain operations.

Source: `lib/src/resources.dart` · Class: `TenantResource`.

### `client.tenant.listApiKeys`

```text
Future<List<ApiKey>> listApiKeys()
```

### `client.tenant.createApiKey`

```text
Future<ApiKey> createApiKey(CreateApiKeyRequest request)
```

### `client.tenant.deleteApiKey`

```text
Future<void> deleteApiKey(String keyId)
```

### `client.tenant.usageDetailed`

```text
Future<JsonMap> usageDetailed([String? fromDate, String? toDate])
```

### `client.tenant.context`

```text
Future<JsonMap> context()
```

### `client.tenant.blockchainStats`

```text
Future<BlockchainStats> blockchainStats()
```

### `client.tenant.blockchainVerify`

```text
Future<BlockchainProof> blockchainVerify(String certificateId)
```

### `client.tenant.blockchainCertificates`

```text
Future<JsonMap> blockchainCertificates([num? limit, num? offset])
```

### `client.tenant.forceBatch`

```text
Future<JsonMap> forceBatch()
```

### `client.tenant.settleAll`

```text
Future<JsonMap> settleAll()
```

### `client.tenant.settleEvent`

```text
Future<JsonMap> settleEvent(String eventId)
```

## client.passports

User passports, categories, linked events and grants.

Source: `lib/src/passports.dart` · Class: `PassportClient`.

### `client.passports.list`

```text
Future<List<Passport>> list([ListOptions options = const ListOptions()])
```

### `client.passports.get`

```text
Future<Passport> get(String userId)
```

### `client.passports.getWithFields`

```text
Future<PassportWithFields> getWithFields(String userId)
```

### `client.passports.create`

```text
Future<Passport> create(CreatePassportRequest data)
```

### `client.passports.update`

```text
Future<Passport> update(String userId, UpdatePassportRequest data)
```

### `client.passports.delete`

```text
Future<void> delete(String userId)
```

### `client.passports.addPoints`

```text
Future<Passport> addPoints(String userId, num points, [String? reason])
```

### `client.passports.levelUp`

```text
Future<Passport> levelUp(String userId)
```

### `client.passports.linkWallet`

```text
Future<Passport> linkWallet(String userId, String walletAddress)
```

### `client.passports.getFieldValues`

```text
Future<List<FieldValue>> getFieldValues(String userId)
```

### `client.passports.setFieldValue`

```text
Future<void> setFieldValue(String userId, String fieldKey, Object? value)
```

### `client.passports.recomputeFields`

```text
Future<JsonMap> recomputeFields(String userId)
```

### `client.passports.assignTemplate`

```text
Future<void> assignTemplate(String userId, String templateId)
```

### `client.passports.listTemplates`

```text
Future<List<PassportTemplate>> listTemplates()
```

### `client.passports.getTemplate`

```text
Future<PassportTemplate> getTemplate(String templateId)
```

### `client.passports.createTemplate`

```text
Future<PassportTemplate> createTemplate(CreateTemplateRequest data)
```

### `client.passports.addTemplateField`

```text
Future<TemplateField> addTemplateField(String templateId, CreateTemplateFieldRequest field)
```

### `client.passports.deleteTemplate`

```text
Future<void> deleteTemplate(String templateId)
```

### `client.passports.listBadges`

```text
Future<List<Badge>> listBadges()
```

### `client.passports.createBadge`

```text
Future<Badge> createBadge(CreateBadgeRequest data)
```

### `client.passports.awardBadge`

```text
Future<UserBadge> awardBadge(String userId, String badgeId, [JsonMap? metadata])
```

### `client.passports.getUserBadges`

```text
Future<List<UserBadge>> getUserBadges(String userId)
```

### `client.passports.listAchievements`

```text
Future<List<Achievement>> listAchievements()
```

### `client.passports.createAchievement`

```text
Future<Achievement> createAchievement(CreateAchievementRequest data)
```

### `client.passports.getUserAchievements`

```text
Future<List<UserAchievement>> getUserAchievements(String userId)
```

### `client.passports.updateAchievementProgress`

```text
Future<UserAchievement> updateAchievementProgress(String userId, String achievementId, num progress)
```

### `client.passports.getHistory`

```text
Future<List<PassportHistory>> getHistory(String userId, [ListOptions options = const ListOptions()])
```

### `client.passports.getPassportV2`

```text
Future<PassportV2Data> getPassportV2(String userId, [String? passportId])
```

### `client.passports.getPassportView`

```text
Future<PassportV2Data> getPassportView(String userId, [String? passportId])
```

### `client.passports.getMilestones`

```text
Future<List<Milestone>> getMilestones(String userId, [String? passportId])
```

### `client.passports.listAvailableViews`

```text
Future<List<AvailableView>> listAvailableViews()
```

### `client.passports.listPassportDefinitions`

```text
Future<List<PassportDefinition>> listPassportDefinitions()
```

### `client.passports.createPassportDefinition`

```text
Future<PassportDefinition> createPassportDefinition(CreatePassportDefinitionRequest definition)
```

## client.wallets

Wallet REST operations; not a local signing/provider implementation.

Source: `lib/src/wallets.dart` · Class: `WalletClient`.

### `client.wallets.create`

```text
Future<Wallet> create(CreateWalletRequest data)
```

### `client.wallets.get`

```text
Future<Wallet> get(String walletId)
```

### `client.wallets.listByUser`

```text
Future<List<Wallet>> listByUser(String userId)
```

### `client.wallets.stats`

```text
Future<WalletStats> stats()
```

### `client.wallets.listUsersWithWallets`

```text
Future<UsersWithWalletsResponse> listUsersWithWallets([num limit = 50, num offset = 0])
```

### `client.wallets.createDual`

```text
Future<DualWallets> createDual(CreateDualWalletsRequest data)
```

### `client.wallets.createDualBulk`

```text
Future<List<DualWallets>> createDualBulk(List<String> userIds, [String network = 'base-mainnet'])
```

### `client.wallets.getBalance`

```text
Future<WalletBalanceResponse> getBalance(String walletId)
```

### `client.wallets.getInfo`

```text
Future<ComprehensiveWalletInfo> getInfo(String walletId, [JsonMap options = const {}])
```

### `client.wallets.getUserSummary`

```text
Future<UserWalletSummary> getUserSummary(String userId, [bool includeBalances = true])
```

### `client.wallets.exportKey`

```text
Future<JsonMap> exportKey(String walletId)
```

### `client.wallets.transfer`

```text
Future<TransferResult> transfer(TransferRequest request)
```

### `client.wallets.getSwapQuote`

```text
Future<SwapQuote> getSwapQuote(SwapQuoteRequest request)
```

### `client.wallets.executeSwap`

```text
Future<SwapResult> executeSwap(ExecuteSwapRequest request)
```

### `client.wallets.getNFTs`

```text
Future<List<NFT>> getNFTs(String walletId)
```

### `client.wallets.getUserNFTs`

```text
Future<List<NFT>> getUserNFTs(String userId)
```

### `client.wallets.addNFT`

```text
Future<NFT> addNFT(String walletId, AddNFTRequest nft)
```

### `client.wallets.getTransactions`

```text
Future<TransactionHistory> getTransactions(String walletId, [JsonMap options = const {}])
```

### `client.wallets.createToken`

```text
Future<Token> createToken(CreateTokenRequest request)
```

### `client.wallets.listTokens`

```text
Future<List<Token>> listTokens([JsonMap options = const {}])
```

### `client.wallets.listGlobalTokens`

```text
Future<List<Token>> listGlobalTokens([String? network])
```

### `client.wallets.getToken`

```text
Future<Token> getToken(String tokenId)
```

### `client.wallets.getTokenByContract`

```text
Future<Token> getTokenByContract(String contractAddress, String network)
```

### `client.wallets.updateToken`

```text
Future<Token> updateToken(String tokenId, UpdateTokenRequest request)
```

### `client.wallets.deleteToken`

```text
Future<JsonMap> deleteToken(String tokenId)
```

## client.users

End-user lifecycle, profiles, linked wallets, attributes, GDPR and exports.

Source: `lib/src/users.dart` · Class: `EndUsersClient`.

### `client.users.list`

```text
Future<EndUserListResponse> list([ListEndUsersOptions options = const ListEndUsersOptions()])
```

### `client.users.get`

```text
Future<EndUser> get(String externalId)
```

### `client.users.getByInternalId`

```text
Future<EndUser> getByInternalId(String userId)
```

### `client.users.create`

```text
Future<EndUser> create(CreateEndUserRequest data)
```

### `client.users.update`

```text
Future<EndUser> update(String externalId, UpdateEndUserRequest data)
```

### `client.users.delete`

```text
Future<void> delete(String userId)
```

### `client.users.linkWallet`

```text
Future<EndUser> linkWallet(String externalId, LinkWalletRequest request)
```

### `client.users.getActivity`

```text
Future<UserActivityResponse> getActivity(String externalId, [JsonMap options = const {}])
```

### `client.users.addPoints`

```text
Future<EndUser> addPoints(String externalId, num points, [String? reason])
```

### `client.users.merge`

```text
Future<EndUser> merge(MergeUsersRequest request)
```

### `client.users.updateByInternalId`

```text
Future<EndUser> updateByInternalId(String userId, UpdateEndUserRequest data)
```

### `client.users.getRewards`

```text
Future<UserRewardsResponse> getRewards(String externalId, [JsonMap options = const {}])
```

### `client.users.getRewardsByInternalId`

```text
Future<UserRewardsResponse> getRewardsByInternalId(String userId, [JsonMap options = const {}])
```

### `client.users.createWallet`

```text
Future<WalletCreationResult> createWallet(String externalId, [CreateUserWalletRequest request = const CreateUserWalletRequest()])
```

### `client.users.registerWallet`

```text
Future<WalletCreationResult> registerWallet(String externalId, RegisterWalletRequest request)
```

### `client.users.ensureWallet`

```text
Future<EnsureWalletResult> ensureWallet(String externalId, [String network = 'base-mainnet'])
```

### `client.users.updateAttributes`

```text
Future<EndUser> updateAttributes(String externalId, JsonMap attributes)
```

### `client.users.removeAttributes`

```text
Future<EndUser> removeAttributes(String externalId, List<String> keys)
```

### `client.users.setProfile`

```text
Future<EndUser> setProfile(String externalId, SetProfileRequest profile)
```

### `client.users.gdprPreview`

```text
Future<GDPRPreviewResponse> gdprPreview(String userId)
```

### `client.users.gdprDelete`

```text
Future<GDPRDeletionResponse> gdprDelete(String userId, GDPRDeletionRequest request)
```

### `client.users.export`

```text
Future<Uint8List> export([JsonMap options = const {}])
```

## client.rewards

Reward definitions, assignment, redemption and verification.

Source: `lib/src/rewards.dart` · Class: `RewardsClient`.

### `client.rewards.listDefinitions`

```text
Future<List<RewardDefinition>> listDefinitions([ListRewardsOptions? options])
```

### `client.rewards.getDefinition`

```text
Future<RewardDefinition> getDefinition(String definitionId)
```

### `client.rewards.createDefinition`

```text
Future<RewardDefinition> createDefinition(CreateRewardDefinitionRequest data)
```

### `client.rewards.updateDefinition`

```text
Future<RewardDefinition> updateDefinition(String definitionId, JsonMap data)
```

### `client.rewards.deleteDefinition`

```text
Future<void> deleteDefinition(String definitionId)
```

### `client.rewards.activateDefinition`

```text
Future<RewardDefinition> activateDefinition(String definitionId)
```

### `client.rewards.deactivateDefinition`

```text
Future<RewardDefinition> deactivateDefinition(String definitionId)
```

### `client.rewards.listEarned`

```text
Future<List<EarnedReward>> listEarned([JsonMap options = const {}])
```

### `client.rewards.getUserRewards`

```text
Future<List<RewardUserReward>> getUserRewards(String userId, [JsonMap options = const {}])
```

### `client.rewards.getCatalog`

```text
Future<List<RewardDefinition>> getCatalog([String? category])
```

### `client.rewards.claimNFT`

```text
Future<ClaimNFTResult> claimNFT(String earnedRewardId, String walletAddress)
```

### `client.rewards.claimReward`

```text
Future<ClaimNFTResult> claimReward(String earnedRewardId, String walletAddress)
```

### `client.rewards.claimVoucher`

```text
Future<ClaimVoucherResult> claimVoucher(String earnedRewardId, {VoucherDelivery? delivery})
```

### `client.rewards.listVoucherProducts`

```text
Future<List<VoucherProduct>> listVoucherProducts({String? country, String? currency, List<String>? category, List<String>? subcategory, bool? feeFree})
```

### `client.rewards.award`

```text
Future<List<EarnedReward>> award(ManualRewardRequest request)
```

### `client.rewards.awardManual`

```text
Future<List<EarnedReward>> awardManual(ManualRewardRequest request)
```

### `client.rewards.distribute`

```text
Future<DistributeResult> distribute(String earnedRewardId)
```

### `client.rewards.distributePending`

```text
Future<DistributeResult> distributePending(String earnedRewardId)
```

### `client.rewards.distributeAll`

```text
Future<JsonMap> distributeAll()
```

### `client.rewards.revoke`

```text
Future<RevokeResult> revoke(String earnedRewardId, String reason)
```

### `client.rewards.uploadAsset`

```text
Future<RewardAsset> uploadAsset(String definitionId, UploadFile file, String assetType)
```

### `client.rewards.listAssets`

```text
Future<List<RewardAsset>> listAssets(String definitionId)
```

### `client.rewards.attest`

```text
Future<RewardAttestationResult> attest(String earnedRewardId)
```

### `client.rewards.anchor`

```text
Future<AnchorResult> anchor(String earnedRewardId)
```

### `client.rewards.getAttestation`

```text
Future<RewardAttestationResult> getAttestation(String earnedRewardId)
```

### `client.rewards.verifyAttestation`

```text
Future<RewardVerifyResult> verifyAttestation(String earnedRewardId)
```

## client.quests

Quest definitions, steps, user progress and completion.

Source: `lib/src/quests.dart` · Class: `QuestsClient`.

### `client.quests.list`

```text
Future<List<Quest>> list([ListQuestsOptions options = const ListQuestsOptions()])
```

### `client.quests.get`

```text
Future<Quest> get(String questId)
```

### `client.quests.listAvailable`

```text
Future<List<QuestWithProgress>> listAvailable(String userId, [JsonMap options = const {}])
```

### `client.quests.create`

```text
Future<Quest> create(CreateQuestRequest data)
```

### `client.quests.update`

```text
Future<Quest> update(String questId, JsonMap data)
```

### `client.quests.delete`

```text
Future<void> delete(String questId)
```

### `client.quests.publish`

```text
Future<Quest> publish(String questId)
```

### `client.quests.activate`

```text
Future<Quest> activate(String questId)
```

### `client.quests.pause`

```text
Future<Quest> pause(String questId)
```

### `client.quests.getWithProgress`

```text
Future<QuestWithProgress> getWithProgress(String questId, String userId)
```

### `client.quests.listWithProgress`

```text
Future<List<QuestWithProgress>> listWithProgress(String userId, [ListQuestsOptions options = const ListQuestsOptions()])
```

### `client.quests.startQuest`

```text
Future<UserQuestProgress> startQuest(String questId, String userId)
```

### `client.quests.resolveCtaLink`

```text
Future<QuestCtaLink> resolveCtaLink(Object quest, [String? userId])
```

### `client.quests.listCtaResolvers`

```text
Future<List<QuestCtaResolver>> listCtaResolvers()
```

### `client.quests.getUserProgress`

```text
Future<UserQuestProgress> getUserProgress(String questId, String userId)
```

### `client.quests.startStep`

```text
Future<StepStartResult> startStep(String questId, String userId, num stepIndex)
```

### `client.quests.completeStep`

```text
Future<StepCompletionResult> completeStep(String questId, String userId, num stepIndex)
```

### `client.quests.getAllUserProgress`

```text
Future<List<UserQuestProgress>> getAllUserProgress(String userId)
```

### `client.quests.claimReward`

```text
Future<ClaimRewardResult> claimReward(String questId, String userId)
```

### `client.quests.addStep`

```text
Future<QuestStep> addStep(String questId, CreateQuestStepRequest step)
```

### `client.quests.updateStep`

```text
Future<QuestStep> updateStep(String questId, String stepId, JsonMap data)
```

### `client.quests.deleteStep`

```text
Future<void> deleteStep(String questId, String stepId)
```

### `client.quests.reorderSteps`

```text
Future<Quest> reorderSteps(String questId, List<String> stepIds)
```

## client.schemas

Schema definitions, validation and inheritance.

Source: `lib/src/schemas.dart` · Class: `SchemasClient`.

### `client.schemas.list`

```text
Future<SchemaListResponse> list([ListSchemasOptions? options])
```

### `client.schemas.get`

```text
Future<SchemaDetail> get(String name, [String? version])
```

### `client.schemas.create`

```text
Future<SchemaDetail> create(String yamlContent)
```

### `client.schemas.update`

```text
Future<SchemaDetail> update(String name, String yamlContent)
```

### `client.schemas.delete`

```text
Future<void> delete(String name, [String? version])
```

### `client.schemas.activate`

```text
Future<Schema> activate(String name, [String? version])
```

### `client.schemas.deprecate`

```text
Future<Schema> deprecate(String name, [String? version])
```

### `client.schemas.setDefault`

```text
Future<Schema> setDefault(String name, String version)
```

### `client.schemas.validate`

```text
Future<ValidationResult> validate(ValidateDataRequest request)
```

### `client.schemas.validateMultiple`

```text
Future<List<ValidationResult>> validateMultiple(List<String> schemaNames, JsonMap data)
```

### `client.schemas.getUsageStats`

```text
Future<JsonMap> getUsageStats(String name)
```

### `client.schemas.clone`

```text
Future<SchemaDetail> clone(String sourceName, String newName, [String? newVersion])
```

## client.dataViews

Data-view definitions, previews and execution.

Source: `lib/src/dataviews.dart` · Class: `DataViewsClient`.

### `client.dataViews.list`

```text
Future<DataViewListResponse> list()
```

### `client.dataViews.get`

```text
Future<DataViewDetail> get(String viewName)
```

### `client.dataViews.create`

```text
Future<DataViewDetail> create(CreateDataViewRequest request)
```

### `client.dataViews.update`

```text
Future<DataViewDetail> update(String viewName, UpdateDataViewRequest request)
```

### `client.dataViews.delete`

```text
Future<void> delete(String viewName)
```

### `client.dataViews.execute`

```text
Future<DataViewExecuteResult> execute(String identifier, String viewName)
```

### `client.dataViews.preview`

```text
Future<DataViewPreviewResult> preview(DataViewPreviewRequest request)
```

### `client.dataViews.getFanProfile`

```text
Future<FanProfileView> getFanProfile(String walletAddress)
```

### `client.dataViews.getActivitySummary`

```text
Future<ActivitySummaryView> getActivitySummary(String walletAddress, [num days = 30])
```

### `client.dataViews.getEventMetadata`

```text
Future<EventMetadata> getEventMetadata()
```

### `client.dataViews.getTemplates`

```text
Future<List<ViewTemplate>> getTemplates()
```

## client.cohorts

Cohort membership and user/cohort leaderboard queries.

Source: `lib/src/cohorts.dart` · Class: `CohortLeaderboardClient`.

### `client.cohorts.list`

```text
Future<List<CohortDefinition>> list([ListCohortsOptions? options])
```

### `client.cohorts.get`

```text
Future<CohortDefinition> get(String cohortId)
```

### `client.cohorts.getLeaderboard`

```text
Future<CohortLeaderboardResponse> getLeaderboard(String cohortId, [CohortLeaderboardOptions? options])
```

### `client.cohorts.getUserBreakdown`

```text
Future<UserBreakdownResponse> getUserBreakdown(String userId, [JsonMap options = const {}])
```

## client.fanpassLeaderboard

FanPass-specific leaderboards and statistics.

Source: `lib/src/fanpass_leaderboard.dart` · Class: `FanpassLeaderboardClient`.

### `client.fanpassLeaderboard.getLeaderboard`

```text
Future<FanpassLeaderboardResponse> getLeaderboard([FanpassLeaderboardOptions? options])
```

### `client.fanpassLeaderboard.getUserComparison`

```text
Future<FanpassUserComparisonResponse> getUserComparison(String userId, [JsonMap options = const {}])
```

### `client.fanpassLeaderboard.listCohorts`

```text
Future<List<FanpassCohortStatus>> listCohorts([FanpassLeaderboardOptions? options])
```

### `client.fanpassLeaderboard.getCohort`

```text
Future<FanpassCohortStatus?> getCohort(String cohortSlug, [FanpassLeaderboardOptions? options])
```

## client.notifications

Native SSE subscriptions and Web Push server registration APIs.

Source: `lib/src/notifications.dart` · Class: `NotificationsClient`.

### `client.notifications.subscribe`

```text
Unsubscribe subscribe(String userId, NotificationCallback callback, [SubscribeOptions options = const SubscribeOptions()])
```

### `client.notifications.getVapidKey`

```text
Future<String?> getVapidKey()
```

### `client.notifications.registerPush`

```text
Future<JsonMap> registerPush(String userId, PushSubscriptionJSON subscription)
```

### `client.notifications.unregisterPush`

```text
Future<JsonMap> unregisterPush(String userId, String endpoint)
```

### `client.notifications.requestPermissionAndSubscribe`

```text
Future<PushSubscriptionJSON?> requestPermissionAndSubscribe(String userId, [String serviceWorkerPath = '/sw.js'])
```

### `client.notifications.generateServiceWorker`

```text
String generateServiceWorker([JsonMap options = const {}])
```

### `client.notifications.close` — native lifecycle

```text
void close()
```

## client.credentials

Credential types, issuance, user credentials and verification.

Source: `lib/src/credentials.dart` · Class: `CredentialsClient`.

### `client.credentials.createType`

```text
Future<CredentialType> createType(CreateCredentialTypeRequest request)
```

### `client.credentials.listTypes`

```text
Future<List<CredentialType>> listTypes([JsonMap? options])
```

### `client.credentials.getType`

```text
Future<CredentialType> getType(String typeId)
```

### `client.credentials.updateType`

```text
Future<CredentialType> updateType(String typeId, CreateCredentialTypeRequest request)
```

### `client.credentials.activateType`

```text
Future<CredentialType> activateType(String typeId)
```

### `client.credentials.archiveType`

```text
Future<CredentialType> archiveType(String typeId)
```

### `client.credentials.issue`

```text
Future<IssuedCredential> issue(IssueCredentialRequest request)
```

### `client.credentials.listIssued`

```text
Future<List<IssuedCredential>> listIssued([ListIssuedCredentialsOptions? options])
```

### `client.credentials.revoke`

```text
Future<IssuedCredential> revoke(String credentialId, [String? reason])
```

### `client.credentials.suspend`

```text
Future<IssuedCredential> suspend(String credentialId, [String? reason])
```

### `client.credentials.reinstate`

```text
Future<IssuedCredential> reinstate(String credentialId)
```

### `client.credentials.optInUser`

```text
Future<JsonMap> optInUser(String userExternalId)
```

### `client.credentials.optOutUser`

```text
Future<JsonMap> optOutUser(String userExternalId)
```

### `client.credentials.getUserCredentials`

```text
Future<UserCredentialsSummary> getUserCredentials(String userExternalId)
```

### `client.credentials.verify`

```text
Future<CredentialVerifyResult> verify(String verificationCode)
```

## client.nft

Mint NFTs and list or retrieve mint records.

Source: `lib/src/nft.dart` · Class: `NftClient`.

### `client.nft.mint`

```text
Future<NFTMint> mint(MintNFTRequest request)
```

### `client.nft.list`

```text
Future<ListMintsResponse> list([ListMintsOptions? options])
```

### `client.nft.get`

```text
Future<NFTMint> get(String mintId)
```

## client.partnerKeys

Privileged partner API-key administration.

Source: `lib/src/partner_keys.dart` · Class: `PartnerKeysClient`.

### `client.partnerKeys.generate`

```text
Future<OTTGenerateResponse> generate([OTTGenerateRequest? options])
```

### `client.partnerKeys.redeem`

```text
Future<OTTRedeemResponse> redeem(String ott)
```

### `client.partnerKeys.updateOTTConfig`

```text
Future<OTTConfigResponse> updateOTTConfig(String keyId, OTTConfigUpdate config)
```

### `client.partnerKeys.getOTTConfig`

```text
Future<OTTConfigResponse> getOTTConfig(String keyId)
```

### `client.partnerKeys.requestOTT`

```text
Future<OTTGenerateResponse> requestOTT(String keyId)
```

## client.attestations

Attestation schemas, records, configuration and revocation.

Source: `lib/src/attestations.dart` · Class: `AttestationsClient`.

### `client.attestations.listSchemas`

```text
Future<List<AttestationSchema>> listSchemas([JsonMap? options])
```

### `client.attestations.getSchema`

```text
Future<AttestationSchema> getSchema(String schemaId)
```

### `client.attestations.create`

```text
Future<AttestationRecord> create(CreateAttestationRequest request)
```

### `client.attestations.list`

```text
Future<List<AttestationRecord>> list([ListAttestationsOptions? options])
```

### `client.attestations.listBySubject`

```text
Future<List<AttestationRecord>> listBySubject(String subjectAddress, [ListAttestationsOptions? options])
```

### `client.attestations.get`

```text
Future<AttestationRecord> get(String attestationId)
```

### `client.attestations.revoke`

```text
Future<AttestationRecord> revoke(String attestationId, [String? reason])
```

### `client.attestations.anchor`

```text
Future<AttestationRecord> anchor(String attestationId)
```

### `client.attestations.getConfig`

```text
Future<AttestationConfig> getConfig()
```

### `client.attestations.updateConfig`

```text
Future<AttestationConfig> updateConfig(UpdateAttestationConfigRequest request)
```

### `client.attestations.getWalletCredentials`

```text
Future<List<WalletCredential>> getWalletCredentials(String walletAddress, [ListWalletCredentialsOptions? options])
```

### `client.attestations.getWalletCredential`

```text
Future<WalletCredential> getWalletCredential(String walletAddress, String attestationUid)
```

### `client.attestations.verifyWalletCredentials`

```text
Future<WalletCredentialVerifySummary> verifyWalletCredentials(String walletAddress)
```

## client.airkit

Create server-authorized AirKit sessions.

Source: `lib/src/airkit.dart` · Class: `AirKitClient`.

### `client.airkit.createSession`

```text
Future<AirKitSessionResponse> createSession()
```

## Standalone ingestion clients

These clients are constructed separately; they are not `ProofChain` properties. Each request owns and closes its transport. Neither class has a public `close()` method.

### IngestionClient

```text
IngestionClient(IngestionClientOptions options)
```

### `IngestionClient.ingest`

```text
Future<IngestEventResponse> ingest(IngestEventRequest request)
```

### `IngestionClient.ingestBatch`

```text
Future<BatchIngestResponse> ingestBatch(BatchIngestRequest request)
```

### `IngestionClient.getEventStatus`

```text
Future<JsonMap> getEventStatus(String eventId)
```

### EndUserIngestionClient

```text
EndUserIngestionClient(EndUserIngestionClientOptions options)
```

### `EndUserIngestionClient.setToken`

```text
void setToken(String userToken)
```

### `EndUserIngestionClient.ingest`

```text
Future<IngestEventResponse> ingest(IngestEventRequest request)
```

### `EndUserIngestionClient.ingestBatch`

```text
Future<BatchIngestResponse> ingestBatch(BatchIngestRequest request)
```

## Notification and upload support types

```text
typedef NotificationCallback = void Function(NotificationEvent event);
typedef Unsubscribe = void Function();
```

`Unsubscribe` is a synchronous cancellation function, not `StreamSubscription`. Call it to stop connecting, active and scheduled reconnect work.

```text
SubscribeOptions({this.onConnect, this.onDisconnect, this.onError, this.autoReconnect, this.reconnectDelay})
```

```text
UploadFile(List<int> bytes, {this.filename = 'document', this.contentType = 'application/octet-stream'})
```

```text
ProofChainOptions({this.apiKey, this.userToken, this.tenantId, this.baseUrl, this.tenant, this.timeout, this.maxRetries})
```

# 17. Model and type catalog

All types below are exported by `package:proofchain_sdk/proofchain.dart`. The catalog is generated from `lib/src/models.dart`. It lists each named-constructor requirement and the number of optional constructor fields; use the source constructor or IDE completion for the full optional field types. Every generated class also supplies `Type.fromJson(JsonMap)` and `toJson()`. Required constructor fields describe the typed interface, not a promise that every server response contains that field; accessing a missing required getter can fail. Use raw `toJson()` when inspecting a response with unknown fields or a version mismatch.

The catalog intentionally distinguishes model construction from API authorization: constructing `Create*Request` does not grant permission to perform that operation. Do not pass an entire response model into a partial update without selecting the intended editable keys.

## 17.1 Generated model constructors

<table class="model-index">
<thead><tr><th>Type</th><th>Required named constructor fields</th><th>Optional</th></tr></thead>
<tbody>
<tr><td><code>AirKitSessionResponse</code></td><td><code>String auth_token</code>, <code>String partner_id</code>, <code>String build_env</code>, <code>num expires_in</code></td><td>0</td></tr>
<tr><td><code>AttestationSchema</code></td><td><code>String id</code>, <code>String name</code>, <code>String slug</code>, <code>String attestation_type</code>, <code>Map&lt;String, Object?&gt; schema_definition</code>, <code>bool revocable</code>, <code>num version</code>, <code>bool is_active</code>, <code>String created_at</code></td><td>4</td></tr>
<tr><td><code>AttestationRecord</code></td><td><code>String id</code>, <code>String uid</code>, <code>String tenant_id</code>, <code>String schema_id</code>, <code>String attester_address</code>, <code>String attester_type</code>, <code>String subject_address</code>, <code>Map&lt;String, Object?&gt; data</code>, <code>String status</code>, <code>String created_at</code></td><td>11</td></tr>
<tr><td><code>WalletCredential</code></td><td><code>String uid</code>, <code>String subject_address</code>, <code>Map&lt;String, Object?&gt; data</code>, <code>String status</code>, <code>String created_at</code></td><td>7</td></tr>
<tr><td><code>WalletCredentialVerifySummary</code></td><td><code>String wallet_address</code>, <code>num total_credentials</code>, <code>Map&lt;String, num&gt; credential_types</code>, <code>Map&lt;String, Object?&gt; latest_scores</code>, <code>bool is_verified</code></td><td>0</td></tr>
<tr><td><code>AttestationConfig</code></td><td><code>String id</code>, <code>String tenant_id</code>, <code>bool auto_attest_passports</code>, <code>bool auto_attest_cohort_scores</code>, <code>bool attest_on_score_change</code>, <code>num min_score_change_threshold</code>, <code>bool anchor_attestations</code>, <code>String reward_anchoring_mode</code>, <code>bool public_attestations</code></td><td>0</td></tr>
<tr><td><code>CreateAttestationRequest</code></td><td><code>String schema_id</code>, <code>String subject_address</code>, <code>Map&lt;String, Object?&gt; data</code></td><td>4</td></tr>
<tr><td><code>ListAttestationsOptions</code></td><td>None</td><td>3</td></tr>
<tr><td><code>ListWalletCredentialsOptions</code></td><td>None</td><td>3</td></tr>
<tr><td><code>UpdateAttestationConfigRequest</code></td><td>None</td><td>6</td></tr>
<tr><td><code>AttestationResult</code></td><td><code>String id</code>, <code>String ipfsHash</code>, <code>String documentHash</code>, <code>String gatewayUrl</code>, <code>String verifyUrl</code>, <code>String certificateId</code>, <code>EventStatus status</code>, <code>AttestationMode attestationMode</code>, <code>String timestamp</code></td><td>2</td></tr>
<tr><td><code>Event</code></td><td><code>String id</code>, <code>String eventType</code>, <code>String userId</code>, <code>String ipfsHash</code>, <code>String gatewayUrl</code>, <code>String certificateId</code>, <code>EventStatus status</code>, <code>AttestationMode attestationMode</code>, <code>String timestamp</code></td><td>5</td></tr>
<tr><td><code>Channel</code></td><td><code>String channelId</code>, <code>String name</code>, <code>ChannelState state</code>, <code>String createdAt</code></td><td>0</td></tr>
<tr><td><code>ChannelStatus</code></td><td><code>String channelId</code>, <code>String name</code>, <code>ChannelState state</code>, <code>num eventCount</code>, <code>num syncedCount</code>, <code>num pendingCount</code>, <code>String createdAt</code></td><td>3</td></tr>
<tr><td><code>Settlement</code></td><td><code>String channelId</code>, <code>String txHash</code>, <code>String merkleRoot</code>, <code>num eventCount</code>, <code>num blockNumber</code>, <code>num gasUsed</code>, <code>String settledAt</code></td><td>0</td></tr>
<tr><td><code>Certificate</code></td><td><code>String certificateId</code>, <code>String recipientName</code>, <code>String title</code>, <code>String ipfsHash</code>, <code>String verifyUrl</code>, <code>String qrCodeUrl</code>, <code>String issuedAt</code>, <code>bool revoked</code></td><td>7</td></tr>
<tr><td><code>Webhook</code></td><td><code>String id</code>, <code>String url</code>, <code>List&lt;String&gt; events</code>, <code>bool active</code>, <code>String createdAt</code>, <code>num failureCount</code></td><td>1</td></tr>
<tr><td><code>VerificationResult</code></td><td><code>bool valid</code>, <code>String ipfsHash</code>, <code>bool proofVerified</code>, <code>String message</code></td><td>6</td></tr>
<tr><td><code>SearchResult</code></td><td><code>num total</code>, <code>num page</code>, <code>num limit</code>, <code>List&lt;Event&gt; events</code></td><td>0</td></tr>
<tr><td><code>UsageStats</code></td><td><code>String periodStart</code>, <code>String periodEnd</code>, <code>num eventsCreated</code>, <code>num documentsAttested</code>, <code>num verifications</code>, <code>num apiCalls</code>, <code>num storageBytes</code>, <code>num channelsCreated</code>, <code>num settlements</code></td><td>0</td></tr>
<tr><td><code>TenantInfo</code></td><td><code>String tenantId</code>, <code>String name</code>, <code>String subdomain</code>, <code>String plan</code>, <code>String createdAt</code>, <code>num apiKeysCount</code>, <code>num eventsCount</code>, <code>num storageUsedBytes</code></td><td>0</td></tr>
<tr><td><code>StreamAck</code></td><td><code>num sequence</code>, <code>String channelId</code>, <code>bool received</code></td><td>0</td></tr>
<tr><td><code>AttestRequest</code></td><td><code>UploadFile file</code>, <code>String userId</code></td><td>4</td></tr>
<tr><td><code>CreateEventRequest</code></td><td><code>String eventType</code>, <code>String userId</code></td><td>2</td></tr>
<tr><td><code>ListEventsRequest</code></td><td>None</td><td>7</td></tr>
<tr><td><code>SearchRequest</code></td><td><code>String query</code></td><td>6</td></tr>
<tr><td><code>CreateChannelRequest</code></td><td><code>String name</code></td><td>1</td></tr>
<tr><td><code>StreamEventRequest</code></td><td><code>String eventType</code>, <code>String userId</code></td><td>2</td></tr>
<tr><td><code>IssueCertificateRequest</code></td><td><code>String recipientName</code>, <code>String title</code></td><td>4</td></tr>
<tr><td><code>ListCertificatesRequest</code></td><td>None</td><td>3</td></tr>
<tr><td><code>CreateWebhookRequest</code></td><td><code>String url</code>, <code>List&lt;String&gt; events</code></td><td>1</td></tr>
<tr><td><code>UpdateWebhookRequest</code></td><td>None</td><td>3</td></tr>
<tr><td><code>VaultFile</code></td><td><code>String id</code>, <code>String filename</code>, <code>String mimeType</code>, <code>num size</code>, <code>String ipfsHash</code>, <code>String userId</code>, <code>String accessMode</code>, <code>String createdAt</code></td><td>2</td></tr>
<tr><td><code>VaultFolder</code></td><td><code>String id</code>, <code>String name</code>, <code>String createdAt</code></td><td>1</td></tr>
<tr><td><code>VaultListResponse</code></td><td><code>List&lt;VaultFile&gt; files</code>, <code>List&lt;VaultFolder&gt; folders</code>, <code>num totalFiles</code>, <code>num totalSize</code></td><td>0</td></tr>
<tr><td><code>VaultStats</code></td><td><code>num totalFiles</code>, <code>num totalFolders</code>, <code>num totalSize</code>, <code>num usedQuota</code>, <code>num maxQuota</code></td><td>0</td></tr>
<tr><td><code>VaultUploadRequest</code></td><td><code>UploadFile file</code>, <code>String userId</code></td><td>3</td></tr>
<tr><td><code>SearchFilters</code></td><td>None</td><td>9</td></tr>
<tr><td><code>SearchQueryRequest</code></td><td>None</td><td>4</td></tr>
<tr><td><code>SearchResponse</code></td><td><code>num total</code>, <code>num offset</code>, <code>num limit</code>, <code>List&lt;Event&gt; results</code></td><td>0</td></tr>
<tr><td><code>PaginationMeta</code></td><td><code>num total</code>, <code>num page</code>, <code>num page_size</code>, <code>num total_pages</code>, <code>bool has_next</code>, <code>bool has_prev</code></td><td>0</td></tr>
<tr><td><code>UserEventHistoryResult</code></td><td><code>String id</code>, <code>String event_type</code>, <code>String event_source</code>, <code>String user_id</code>, <code>String status</code>, <code>String timestamp</code>, <code>bool has_blockchain_proof</code>, <code>String? blockchain_tx_hash</code>, <code>num? fanscore_v_e</code>, <code>num? fanscore_event_score</code>, <code>num? fanscore_contribution</code>, <code>String? fanscore_cohort</code>, <code>String? fanscore_subject</code></td><td>0</td></tr>
<tr><td><code>UserEventHistoryResponse</code></td><td><code>List&lt;UserEventHistoryResult&gt; results</code>, <code>num total</code>, <code>num offset</code>, <code>num limit</code>, <code>num query_time_ms</code>, <code>PaginationMeta? pagination</code>, <code>String? retention_warning</code></td><td>0</td></tr>
<tr><td><code>UserEventHistoryOptions</code></td><td>None</td><td>3</td></tr>
<tr><td><code>Facet</code></td><td><code>String key</code>, <code>num count</code></td><td>0</td></tr>
<tr><td><code>FacetsResponse</code></td><td><code>List&lt;Facet&gt; eventTypes</code>, <code>List&lt;Facet&gt; eventSources</code>, <code>List&lt;Facet&gt; statuses</code>, <code>List&lt;Facet&gt; users</code></td><td>0</td></tr>
<tr><td><code>SearchStats</code></td><td><code>num periodDays</code>, <code>num totalEvents</code>, <code>num uniqueUsers</code>, <code>num eventsPerDay</code>, <code>num totalStorageBytes</code></td><td>0</td></tr>
<tr><td><code>CertificateVerifyResult</code></td><td><code>String certificateId</code>, <code>String status</code>, <code>String recipientName</code>, <code>String title</code>, <code>String issuedAt</code>, <code>String ipfsHash</code>, <code>String verifyUrl</code></td><td>4</td></tr>
<tr><td><code>ProofVerifyResult</code></td><td><code>bool valid</code>, <code>String message</code>, <code>String verifiedAt</code></td><td>0</td></tr>
<tr><td><code>BatchVerifyResult</code></td><td><code>String batchId</code>, <code>String merkleRoot</code>, <code>num totalEvents</code>, <code>bool verified</code></td><td>2</td></tr>
<tr><td><code>EventBatchProof</code></td><td><code>String eventId</code>, <code>String certificateId</code>, <code>String batchId</code>, <code>num leafIndex</code>, <code>List&lt;String&gt; merkleProof</code>, <code>String merkleRoot</code>, <code>bool verified</code></td><td>1</td></tr>
<tr><td><code>ApiKey</code></td><td><code>String id</code>, <code>String name</code>, <code>String keyPrefix</code>, <code>List&lt;String&gt; permissions</code>, <code>String createdAt</code>, <code>bool isActive</code></td><td>3</td></tr>
<tr><td><code>BlockchainStats</code></td><td><code>num totalTransactions</code>, <code>num totalGasUsed</code>, <code>num totalEventsAttested</code>, <code>num pendingEvents</code>, <code>num chainId</code>, <code>String chainName</code></td><td>2</td></tr>
<tr><td><code>BlockchainProof</code></td><td><code>String certificateId</code>, <code>bool verified</code>, <code>String chainName</code></td><td>5</td></tr>
<tr><td><code>CreateApiKeyRequest</code></td><td><code>String name</code></td><td>2</td></tr>
<tr><td><code>Passport</code></td><td><code>String id</code>, <code>String tenant_id</code>, <code>String user_id</code>, <code>num level</code>, <code>num points</code>, <code>num experience</code>, <code>Map&lt;String, Object?&gt; traits</code>, <code>Map&lt;String, Object?&gt; custom_metadata</code>, <code>String created_at</code>, <code>String last_updated_at</code></td><td>3</td></tr>
<tr><td><code>PassportWithFields</code></td><td><code>super.id</code>, <code>super.tenant_id</code>, <code>super.user_id</code>, <code>super.level</code>, <code>super.points</code>, <code>super.experience</code>, <code>super.traits</code>, <code>super.custom_metadata</code>, <code>super.created_at</code>, <code>super.last_updated_at</code>, <code>List&lt;FieldValue&gt; field_values</code></td><td>5</td></tr>
<tr><td><code>FieldValue</code></td><td><code>String field_key</code>, <code>String field_name</code>, <code>Object? value</code>, <code>String data_type</code>, <code>bool manually_set</code></td><td>1</td></tr>
<tr><td><code>PassportTemplate</code></td><td><code>String id</code>, <code>String tenant_id</code>, <code>String name</code>, <code>String slug</code>, <code>bool is_default</code>, <code>bool is_active</code>, <code>String created_at</code>, <code>String updated_at</code>, <code>List&lt;TemplateField&gt; fields</code></td><td>2</td></tr>
<tr><td><code>TemplateField</code></td><td><code>String id</code>, <code>String template_id</code>, <code>String name</code>, <code>String field_key</code>, <code>String data_type</code>, <code>num sort_order</code>, <code>bool is_visible</code>, <code>bool is_computed</code>, <code>String created_at</code></td><td>9</td></tr>
<tr><td><code>Badge</code></td><td><code>String id</code>, <code>String tenant_id</code>, <code>String badge_id</code>, <code>String name</code>, <code>String rarity</code>, <code>Map&lt;String, Object?&gt; requirements</code>, <code>String created_at</code></td><td>2</td></tr>
<tr><td><code>Achievement</code></td><td><code>String id</code>, <code>String tenant_id</code>, <code>String achievement_id</code>, <code>String name</code>, <code>num points_reward</code>, <code>Map&lt;String, Object?&gt; requirements</code>, <code>String created_at</code></td><td>2</td></tr>
<tr><td><code>UserBadge</code></td><td><code>String id</code>, <code>String passport_id</code>, <code>String badge_id</code>, <code>Badge badge</code>, <code>String earned_at</code></td><td>1</td></tr>
<tr><td><code>UserAchievement</code></td><td><code>String id</code>, <code>String passport_id</code>, <code>String achievement_id</code>, <code>Achievement achievement</code>, <code>String earned_at</code>, <code>num progress</code>, <code>bool completed</code></td><td>0</td></tr>
<tr><td><code>PassportHistory</code></td><td><code>String id</code>, <code>String passport_id</code>, <code>String event_type</code>, <code>String created_at</code></td><td>3</td></tr>
<tr><td><code>CreatePassportRequest</code></td><td><code>String user_id</code></td><td>6</td></tr>
<tr><td><code>UpdatePassportRequest</code></td><td>None</td><td>6</td></tr>
<tr><td><code>CreateTemplateRequest</code></td><td><code>String name</code>, <code>String slug</code></td><td>4</td></tr>
<tr><td><code>CreateTemplateFieldRequest</code></td><td><code>String name</code>, <code>String field_key</code></td><td>13</td></tr>
<tr><td><code>CreateBadgeRequest</code></td><td><code>String badge_id</code>, <code>String name</code></td><td>4</td></tr>
<tr><td><code>CreateAchievementRequest</code></td><td><code>String achievement_id</code>, <code>String name</code></td><td>4</td></tr>
<tr><td><code>ListOptions</code></td><td>None</td><td>2</td></tr>
<tr><td><code>PassportV2Data</code></td><td><code>String user_id</code>, <code>PassportDefinition passport</code>, <code>Map&lt;String, PassportFieldValue&gt; data</code>, <code>List&lt;Milestone&gt; milestones</code>, <code>String generated_at</code></td><td>0</td></tr>
<tr><td><code>PassportFieldValue</code></td><td><code>String label</code>, <code>Object? value</code></td><td>1</td></tr>
<tr><td><code>PassportDefinition</code></td><td><code>String id</code>, <code>String tenant_id</code>, <code>String name</code>, <code>List&lt;String&gt; display_columns</code>, <code>Map&lt;String, String&gt; column_labels</code>, <code>Map&lt;String, String&gt; column_formats</code>, <code>bool is_default</code>, <code>bool is_active</code>, <code>bool is_public</code>, <code>String created_at</code>, <code>num threshold_count</code></td><td>4</td></tr>
<tr><td><code>Milestone</code></td><td><code>String id</code>, <code>String name</code>, <code>String milestone_type</code>, <code>num points_reward</code>, <code>String triggered_at</code></td><td>4</td></tr>
<tr><td><code>AvailableView</code></td><td><code>String id</code>, <code>String name</code>, <code>String view_name</code>, <code>bool is_builtin</code>, <code>List&lt;ViewColumn&gt; columns</code></td><td>3</td></tr>
<tr><td><code>ViewColumn</code></td><td><code>String name</code>, <code>String type</code></td><td>1</td></tr>
<tr><td><code>CreatePassportDefinitionRequest</code></td><td><code>String name</code></td><td>8</td></tr>
<tr><td><code>Wallet</code></td><td><code>String wallet_id</code>, <code>String address</code>, <code>String user_id</code>, <code>String wallet_type</code>, <code>String network</code>, <code>String status</code>, <code>String created_at</code></td><td>5</td></tr>
<tr><td><code>DualWallets</code></td><td><code>String user_id</code>, <code>Wallet asset_wallet</code>, <code>Wallet smart_wallet</code>, <code>String network</code></td><td>0</td></tr>
<tr><td><code>WalletBalance</code></td><td><code>String wallet_id</code>, <code>String address</code>, <code>String network</code>, <code>List&lt;TokenBalance&gt; balances</code></td><td>0</td></tr>
<tr><td><code>TokenBalance</code></td><td><code>String token</code>, <code>String symbol</code>, <code>String balance</code>, <code>num decimals</code>, <code>String source</code></td><td>5</td></tr>
<tr><td><code>NFT</code></td><td><code>String id</code>, <code>String wallet_id</code>, <code>String contract_address</code>, <code>String token_id</code>, <code>String network</code>, <code>String source</code>, <code>String acquired_at</code></td><td>4</td></tr>
<tr><td><code>SwapQuote</code></td><td><code>String from_token</code>, <code>String to_token</code>, <code>String from_amount</code>, <code>String to_amount</code>, <code>String min_to_amount</code>, <code>String exchange_rate</code>, <code>String quote_id</code>, <code>num slippage_bps</code>, <code>String network</code>, <code>bool liquidity_available</code>, <code>String expires_at</code></td><td>0</td></tr>
<tr><td><code>SwapResult</code></td><td><code>String transaction_hash</code>, <code>String status</code>, <code>String from_token</code>, <code>String to_token</code>, <code>String from_amount</code>, <code>String to_amount</code>, <code>String gas_used</code></td><td>0</td></tr>
<tr><td><code>WalletStats</code></td><td><code>num total_wallets</code>, <code>Map&lt;String, num&gt; by_type</code>, <code>Map&lt;String, num&gt; by_network</code></td><td>0</td></tr>
<tr><td><code>Transaction</code></td><td><code>String hash</code>, <code>String type</code>, <code>String from</code>, <code>String to</code>, <code>Object? value</code>, <code>String asset</code>, <code>String category</code>, <code>String block_num</code>, <code>String timestamp</code></td><td>0</td></tr>
<tr><td><code>TransactionHistory</code></td><td><code>String address</code>, <code>String network</code>, <code>num total_sent</code>, <code>num total_received</code>, <code>List&lt;Transaction&gt; transactions</code></td><td>1</td></tr>
<tr><td><code>ComprehensiveWalletInfo</code></td><td><code>String wallet_id</code>, <code>String address</code>, <code>String user_id</code>, <code>String wallet_type</code>, <code>String network</code>, <code>String status</code>, <code>bool supports_export</code>, <code>String created_at</code></td><td>8</td></tr>
<tr><td><code>UserWalletSummary</code></td><td><code>String user_id</code>, <code>num total_wallets</code>, <code>num total_nfts</code>, <code>num total_swaps</code>, <code>List&lt;UserWalletSummaryWalletsItem&gt; wallets</code></td><td>0</td></tr>
<tr><td><code>CreateWalletRequest</code></td><td><code>String user_id</code></td><td>4</td></tr>
<tr><td><code>CreateDualWalletsRequest</code></td><td><code>String user_id</code></td><td>2</td></tr>
<tr><td><code>SwapQuoteRequest</code></td><td><code>String from_token</code>, <code>String to_token</code>, <code>String from_amount</code></td><td>2</td></tr>
<tr><td><code>ExecuteSwapRequest</code></td><td><code>String wallet_id</code>, <code>String from_token</code>, <code>String to_token</code>, <code>String from_amount</code></td><td>2</td></tr>
<tr><td><code>AddNFTRequest</code></td><td><code>String contract_address</code>, <code>String token_id</code>, <code>String network</code></td><td>2</td></tr>
<tr><td><code>TransferRequest</code></td><td><code>String to_address</code>, <code>String amount</code></td><td>5</td></tr>
<tr><td><code>TransferResult</code></td><td><code>String tx_hash</code>, <code>String from</code>, <code>String to</code>, <code>String amount</code>, <code>String token</code>, <code>String network</code>, <code>String status</code></td><td>1</td></tr>
<tr><td><code>Token</code></td><td><code>String id</code>, <code>String contract_address</code>, <code>String network</code>, <code>String symbol</code>, <code>String name</code>, <code>num decimals</code>, <code>String token_standard</code>, <code>bool is_native_wrapper</code>, <code>bool is_verified</code>, <code>bool is_active</code>, <code>num display_order</code>, <code>bool is_global</code></td><td>5</td></tr>
<tr><td><code>CreateTokenRequest</code></td><td><code>String contract_address</code>, <code>String network</code>, <code>String symbol</code>, <code>String name</code></td><td>8</td></tr>
<tr><td><code>UpdateTokenRequest</code></td><td>None</td><td>11</td></tr>
<tr><td><code>WalletBalanceResponse</code></td><td><code>String address</code>, <code>String network</code>, <code>String native_balance</code>, <code>String native_symbol</code>, <code>List&lt;TokenBalance&gt; balances</code></td><td>0</td></tr>
<tr><td><code>UserWithWallets</code></td><td><code>String user_id</code>, <code>List&lt;UserWithWalletsWalletsItem&gt; wallets</code></td><td>0</td></tr>
<tr><td><code>UsersWithWalletsResponse</code></td><td><code>List&lt;UserWithWallets&gt; users</code>, <code>num total</code>, <code>num limit</code>, <code>num offset</code></td><td>0</td></tr>
<tr><td><code>EndUser</code></td><td><code>String id</code>, <code>String external_id</code>, <code>String status</code>, <code>num total_events</code>, <code>List&lt;String&gt; event_types</code>, <code>List&lt;String&gt; segments</code>, <code>Map&lt;String, Object?&gt; tags</code>, <code>num points_balance</code>, <code>num lifetime_points</code>, <code>Map&lt;String, Object?&gt; attributes</code>, <code>String created_at</code></td><td>19</td></tr>
<tr><td><code>EndUserListResponse</code></td><td><code>List&lt;EndUser&gt; users</code>, <code>num total</code>, <code>num page</code>, <code>num page_size</code>, <code>bool has_more</code></td><td>0</td></tr>
<tr><td><code>UserActivity</code></td><td><code>String event_id</code>, <code>String event_type</code>, <code>String timestamp</code>, <code>Map&lt;String, Object?&gt; data</code></td><td>0</td></tr>
<tr><td><code>UserActivityResponse</code></td><td><code>String user_id</code>, <code>List&lt;UserActivity&gt; activities</code>, <code>num total</code>, <code>num page</code>, <code>num page_size</code></td><td>0</td></tr>
<tr><td><code>CreateEndUserRequest</code></td><td><code>String external_id</code></td><td>15</td></tr>
<tr><td><code>UpdateEndUserRequest</code></td><td>None</td><td>15</td></tr>
<tr><td><code>ListEndUsersOptions</code></td><td>None</td><td>9</td></tr>
<tr><td><code>LinkWalletRequest</code></td><td>None</td><td>4</td></tr>
<tr><td><code>MergeUsersRequest</code></td><td><code>List&lt;String&gt; source_user_ids</code>, <code>String target_user_id</code></td><td>0</td></tr>
<tr><td><code>CreateUserWalletRequest</code></td><td>None</td><td>2</td></tr>
<tr><td><code>RegisterWalletRequest</code></td><td><code>String wallet_address</code></td><td>1</td></tr>
<tr><td><code>UserReward</code></td><td><code>String id</code>, <code>String reward_name</code>, <code>String reward_type</code>, <code>String status</code></td><td>6</td></tr>
<tr><td><code>UserRewardsResponse</code></td><td><code>String user_id</code>, <code>List&lt;UserReward&gt; rewards</code>, <code>num total</code>, <code>num page</code>, <code>num page_size</code>, <code>bool has_more</code></td><td>0</td></tr>
<tr><td><code>GDPRDeletionRequest</code></td><td><code>bool confirm</code></td><td>3</td></tr>
<tr><td><code>GDPRDeletionResponse</code></td><td><code>bool success</code>, <code>String user_id</code>, <code>String external_id</code>, <code>Map&lt;String, num&gt; deleted_records</code></td><td>2</td></tr>
<tr><td><code>GDPRPreviewResponse</code></td><td><code>Map&lt;String, Object?&gt; user</code>, <code>Map&lt;String, num&gt; would_delete</code></td><td>1</td></tr>
<tr><td><code>WalletCreationResult</code></td><td><code>bool success</code>, <code>String user_id</code>, <code>String wallet_address</code>, <code>String source</code></td><td>2</td></tr>
<tr><td><code>EnsureWalletResult</code></td><td><code>String user_id</code>, <code>EnsureWalletResultAssetWallet asset_wallet</code>, <code>EnsureWalletResultSmartWallet smart_wallet</code>, <code>String network</code>, <code>bool created</code></td><td>0</td></tr>
<tr><td><code>SetProfileRequest</code></td><td>None</td><td>12</td></tr>
<tr><td><code>RewardDefinition</code></td><td><code>String id</code>, <code>String name</code>, <code>String slug</code>, <code>String reward_type</code>, <code>num token_decimals</code>, <code>String token_chain</code>, <code>num nft_minted_pool_count</code>, <code>bool nft_is_soulbound</code>, <code>String trigger_type</code>, <code>num current_issued</code>, <code>bool is_active</code>, <code>bool attest_on_earn</code>, <code>String anchoring_mode</code>, <code>String created_at</code></td><td>18</td></tr>
<tr><td><code>EarnedReward</code></td><td><code>String id</code>, <code>String user_id</code>, <code>String user_external_id</code>, <code>String reward_name</code>, <code>String reward_type</code>, <code>String status</code>, <code>String earned_at</code></td><td>10</td></tr>
<tr><td><code>RewardUserReward</code></td><td><code>String id</code>, <code>String reward_name</code>, <code>String reward_type</code>, <code>String status</code>, <code>String earned_at</code></td><td>11</td></tr>
<tr><td><code>RewardAsset</code></td><td><code>String id</code>, <code>String definition_id</code>, <code>String asset_type</code>, <code>String file_path</code>, <code>String mime_type</code>, <code>num file_size</code>, <code>String created_at</code></td><td>1</td></tr>
<tr><td><code>CreateRewardDefinitionRequest</code></td><td><code>String name</code>, <code>String slug</code></td><td>30</td></tr>
<tr><td><code>ManualRewardRequest</code></td><td><code>String definition_id</code>, <code>List&lt;String&gt; user_ids</code></td><td>2</td></tr>
<tr><td><code>ClaimNFTResult</code></td><td><code>bool success</code>, <code>String reward_id</code>, <code>String tx_hash</code>, <code>String wallet_address</code></td><td>1</td></tr>
<tr><td><code>ClaimVoucherResult</code></td><td><code>bool success</code>, <code>String reward_id</code>, <code>String status</code></td><td>4</td></tr>
<tr><td><code>VoucherDelivery</code></td><td><code>this.method</code></td><td>3</td></tr>
<tr><td><code>VoucherProductSku</code></td><td><code>num min</code>, <code>num max</code>, <code>String currency_code</code></td><td>0</td></tr>
<tr><td><code>VoucherProduct</code></td><td><code>String id</code>, <code>String name</code>, <code>String category</code>, <code>List&lt;String&gt; currency_codes</code>, <code>List&lt;String&gt; countries</code>, <code>List&lt;VoucherProductSku&gt; skus</code></td><td>6</td></tr>
<tr><td><code>DistributeResult</code></td><td><code>bool success</code>, <code>String reward_id</code>, <code>String message</code></td><td>0</td></tr>
<tr><td><code>RevokeResult</code></td><td><code>bool success</code>, <code>String reward_id</code>, <code>String status</code></td><td>0</td></tr>
<tr><td><code>RewardAttestationResult</code></td><td><code>String attestation_id</code>, <code>String attestation_uid</code>, <code>String status</code>, <code>String subject_address</code>, <code>String reward_id</code>, <code>String reward_name</code>, <code>String earned_at</code>, <code>String created_at</code></td><td>2</td></tr>
<tr><td><code>AnchorResult</code></td><td><code>bool success</code>, <code>String reward_id</code>, <code>String attestation_id</code>, <code>String tx_hash</code>, <code>String status</code></td><td>0</td></tr>
<tr><td><code>RewardVerifyResult</code></td><td><code>bool is_valid</code>, <code>String attestation_uid</code>, <code>String status</code>, <code>String subject_address</code>, <code>String attester_address</code>, <code>String signature_type</code>, <code>bool on_chain</code>, <code>String reward_id</code>, <code>String reward_name</code></td><td>2</td></tr>
<tr><td><code>ListRewardsOptions</code></td><td>None</td><td>4</td></tr>
<tr><td><code>Quest</code></td><td><code>String id</code>, <code>String name</code>, <code>String slug</code>, <code>bool is_ordered</code>, <code>bool is_repeatable</code>, <code>List&lt;String&gt; prerequisite_quest_ids</code>, <code>String reward_mode</code>, <code>bool is_public</code>, <code>bool is_featured</code>, <code>num display_order</code>, <code>List&lt;String&gt; tags</code>, <code>String status</code>, <code>List&lt;QuestStep&gt; steps</code>, <code>num total_participants</code>, <code>num total_completions</code>, <code>String created_at</code>, <code>String updated_at</code></td><td>35</td></tr>
<tr><td><code>QuestCtaLink</code></td><td><code>String quest_id</code>, <code>String url</code>, <code>String resolver</code>, <code>String resolved_at</code>, <code>Map&lt;String, Object?&gt; meta</code></td><td>0</td></tr>
<tr><td><code>QuestCtaResolver</code></td><td><code>String key</code>, <code>String label</code>, <code>String description</code>, <code>bool configured</code></td><td>0</td></tr>
<tr><td><code>QuestStep</code></td><td><code>String id</code>, <code>String quest_id</code>, <code>String name</code>, <code>num order</code>, <code>String step_type</code>, <code>bool is_optional</code></td><td>9</td></tr>
<tr><td><code>UserQuestProgress</code></td><td><code>String id</code>, <code>String user_id</code>, <code>String quest_id</code>, <code>String quest_name</code>, <code>String status</code>, <code>num completion_count</code>, <code>num current_step_order</code>, <code>num steps_completed</code>, <code>num total_steps</code>, <code>num completion_percentage</code>, <code>List&lt;StepProgress&gt; step_progress</code>, <code>num points_earned</code></td><td>4</td></tr>
<tr><td><code>RewardEarned</code></td><td><code>String id</code>, <code>String reward_name</code>, <code>String reward_type</code>, <code>String status</code>, <code>String earned_at</code></td><td>2</td></tr>
<tr><td><code>StepProgress</code></td><td><code>String step_id</code>, <code>String step_name</code>, <code>num order</code>, <code>String status</code></td><td>3</td></tr>
<tr><td><code>StepStartResult</code></td><td><code>num step_index</code>, <code>String status</code>, <code>String quest_id</code>, <code>String quest_name</code>, <code>String step_name</code></td><td>2</td></tr>
<tr><td><code>StepCompletionResult</code></td><td><code>num step_index</code>, <code>bool step_completed</code>, <code>bool quest_completed</code>, <code>bool can_claim</code>, <code>num current_count</code>, <code>num target_count</code>, <code>num points_earned</code></td><td>0</td></tr>
<tr><td><code>ClaimRewardResult</code></td><td><code>String quest_id</code>, <code>String quest_name</code>, <code>String status</code>, <code>num points_awarded</code>, <code>String claimed_at</code></td><td>1</td></tr>
<tr><td><code>QuestWithProgress</code></td><td><code>Quest quest</code></td><td>1</td></tr>
<tr><td><code>CreateQuestRequest</code></td><td><code>String name</code>, <code>List&lt;CreateQuestStepRequest&gt; steps</code></td><td>26</td></tr>
<tr><td><code>CreateQuestStepRequest</code></td><td><code>String name</code></td><td>12</td></tr>
<tr><td><code>ListQuestsOptions</code></td><td>None</td><td>6</td></tr>
<tr><td><code>Schema</code></td><td><code>String id</code>, <code>String name</code>, <code>String version</code>, <code>String status</code>, <code>bool is_default</code>, <code>num usage_count</code></td><td>4</td></tr>
<tr><td><code>SchemaDetail</code></td><td><code>super.id</code>, <code>super.name</code>, <code>super.version</code>, <code>super.status</code>, <code>super.is_default</code>, <code>super.usage_count</code>, <code>Map&lt;String, Object?&gt; schema_definition</code>, <code>String yaml_content</code></td><td>4</td></tr>
<tr><td><code>SchemaField</code></td><td><code>String name</code>, <code>String type</code></td><td>7</td></tr>
<tr><td><code>ValidationResult</code></td><td><code>bool valid</code>, <code>String schema_name</code>, <code>List&lt;SchemaValidationError&gt; errors</code></td><td>1</td></tr>
<tr><td><code>SchemaValidationError</code></td><td><code>String field</code>, <code>String message</code></td><td>1</td></tr>
<tr><td><code>SchemaListResponse</code></td><td><code>List&lt;Schema&gt; schemas</code>, <code>num total</code></td><td>0</td></tr>
<tr><td><code>CreateSchemaRequest</code></td><td><code>String yaml_content</code></td><td>0</td></tr>
<tr><td><code>ValidateDataRequest</code></td><td><code>String schema_name</code>, <code>Map&lt;String, Object?&gt; data</code></td><td>1</td></tr>
<tr><td><code>ListSchemasOptions</code></td><td>None</td><td>4</td></tr>
<tr><td><code>DataViewColumn</code></td><td><code>String name</code>, <code>String type</code></td><td>0</td></tr>
<tr><td><code>DataViewInfo</code></td><td><code>String id</code>, <code>String name</code>, <code>String view_name</code>, <code>String description</code>, <code>bool is_builtin</code>, <code>List&lt;DataViewColumn&gt; columns</code></td><td>0</td></tr>
<tr><td><code>DataViewListResponse</code></td><td><code>List&lt;DataViewSummary&gt; own_views</code>, <code>List&lt;DataViewSummary&gt; public_views</code>, <code>List&lt;DataViewSummary&gt; builtin_views</code></td><td>0</td></tr>
<tr><td><code>DataViewSummary</code></td><td><code>String name</code>, <code>String description</code></td><td>3</td></tr>
<tr><td><code>DataViewDetail</code></td><td><code>String id</code>, <code>String name</code>, <code>String display_name</code>, <code>String description</code>, <code>String view_type</code>, <code>Object? computation</code>, <code>List&lt;String&gt; source_categories</code>, <code>bool is_public</code>, <code>String created_at</code>, <code>String updated_at</code></td><td>0</td></tr>
<tr><td><code>DataViewComputation</code></td><td><code>String type</code></td><td>13</td></tr>
<tr><td><code>TierDefinition</code></td><td><code>String name</code>, <code>num min</code>, <code>num max</code></td><td>0</td></tr>
<tr><td><code>DataViewExecuteResult</code></td><td><code>String view_name</code>, <code>String display_name</code>, <code>String identifier</code>, <code>String identifier_type</code>, <code>Map&lt;String, Object?&gt; data</code>, <code>String computed_at</code>, <code>num total_events</code></td><td>0</td></tr>
<tr><td><code>DataViewPreviewRequest</code></td><td><code>String wallet_address</code>, <code>Object? computation</code></td><td>2</td></tr>
<tr><td><code>DataViewPreviewResult</code></td><td><code>bool preview</code>, <code>String wallet_address</code>, <code>String computation_type</code>, <code>Map&lt;String, Object?&gt; result</code>, <code>num events_processed</code>, <code>num time_window_days</code></td><td>0</td></tr>
<tr><td><code>CreateDataViewRequest</code></td><td><code>String name</code>, <code>String display_name</code>, <code>String description</code>, <code>Object? computation</code></td><td>3</td></tr>
<tr><td><code>UpdateDataViewRequest</code></td><td>None</td><td>5</td></tr>
<tr><td><code>FanProfileView</code></td><td><code>String wallet_address</code>, <code>num fan_score</code>, <code>num total_events</code>, <code>Map&lt;String, num&gt; event_breakdown</code>, <code>String first_seen</code>, <code>String last_seen</code>, <code>String loyalty_tier</code>, <code>String computed_at</code></td><td>0</td></tr>
<tr><td><code>ActivitySummaryView</code></td><td><code>String wallet_address</code>, <code>num total_events</code>, <code>Map&lt;String, num&gt; event_count_by_type</code>, <code>String last_activity</code>, <code>num active_days</code>, <code>num period_days</code>, <code>String computed_at</code></td><td>0</td></tr>
<tr><td><code>EventMetadata</code></td><td><code>List&lt;EventMetadataEventTypesItem&gt; event_types</code>, <code>num total_events</code>, <code>List&lt;String&gt; categories</code></td><td>0</td></tr>
<tr><td><code>ViewTemplate</code></td><td><code>String id</code>, <code>String name</code>, <code>String description</code>, <code>DataViewComputation computation</code></td><td>0</td></tr>
<tr><td><code>LeaderboardUserProfile</code></td><td><code>String external_id</code>, <code>String? display_name</code>, <code>String? first_name</code>, <code>String? last_name</code>, <code>String? email</code>, <code>String? avatar_url</code>, <code>String? country</code>, <code>String? city</code>, <code>Map&lt;String, Object?&gt; attributes</code></td><td>0</td></tr>
<tr><td><code>CohortLeaderboardEntry</code></td><td><code>num rank</code>, <code>String user_id</code>, <code>num score</code>, <code>num percentile_global</code>, <code>num? percentile_filtered</code></td><td>2</td></tr>
<tr><td><code>CohortGroupStats</code></td><td><code>num? filtered_avg_percentile</code>, <code>num? filtered_top_n_avg_percentile</code>, <code>num global_count</code>, <code>num global_avg_percentile</code></td><td>0</td></tr>
<tr><td><code>CohortLeaderboardResponse</code></td><td><code>String cohort_id</code>, <code>String cohort_name</code>, <code>Map&lt;String, Object?&gt; filter</code>, <code>num total_users</code>, <code>CohortGroupStats group_stats</code>, <code>List&lt;CohortLeaderboardEntry&gt; leaderboard</code>, <code>CohortLeaderboardEntry? current_user</code>, <code>bool current_user_in_leaderboard</code></td><td>0</td></tr>
<tr><td><code>CohortDefinition</code></td><td><code>String id</code>, <code>String tenant_id</code>, <code>String name</code>, <code>String slug</code>, <code>String scoring_type</code>, <code>String status</code>, <code>String created_at</code>, <code>String updated_at</code></td><td>5</td></tr>
<tr><td><code>UserCohortBreakdownEntry</code></td><td><code>String cohort_id</code>, <code>String cohort_slug</code>, <code>String cohort_name</code>, <code>num user_percentile</code>, <code>num? filtered_group_avg_percentile</code>, <code>num global_group_avg_percentile</code></td><td>2</td></tr>
<tr><td><code>UserBreakdownResponse</code></td><td><code>String user_id</code>, <code>Map&lt;String, Object?&gt; filter</code>, <code>List&lt;UserCohortBreakdownEntry&gt; cohorts</code></td><td>0</td></tr>
<tr><td><code>CohortLeaderboardOptions</code></td><td>None</td><td>6</td></tr>
<tr><td><code>ListCohortsOptions</code></td><td>None</td><td>3</td></tr>
<tr><td><code>FanpassLeaderboardUserProfile</code></td><td><code>String external_id</code>, <code>String? display_name</code>, <code>String? first_name</code>, <code>String? last_name</code>, <code>String? email</code>, <code>String? avatar_url</code>, <code>String? country</code>, <code>String? city</code>, <code>Map&lt;String, Object?&gt; attributes</code></td><td>0</td></tr>
<tr><td><code>FanpassLeaderboardEntry</code></td><td><code>num rank</code>, <code>String user_id</code>, <code>num fan_score</code>, <code>num normalized_score</code>, <code>num raw_score</code>, <code>num percentile</code></td><td>2</td></tr>
<tr><td><code>FanpassGroupStats</code></td><td><code>num avg_fan_score</code>, <code>num top_n_avg_fan_score</code>, <code>num global_count</code>, <code>num global_avg_fan_score</code></td><td>0</td></tr>
<tr><td><code>FanpassCohortStatus</code></td><td><code>String cohort_slug</code>, <code>String cohort_name</code>, <code>num users_scored</code>, <code>String status</code></td><td>0</td></tr>
<tr><td><code>FanpassLeaderboardResponse</code></td><td><code>String? aggregation_rule_id</code>, <code>String? aggregation_rule_name</code>, <code>Map&lt;String, Object?&gt; filter</code>, <code>num total_users</code>, <code>FanpassGroupStats group_stats</code>, <code>List&lt;FanpassLeaderboardEntry&gt; leaderboard</code>, <code>List&lt;FanpassCohortStatus&gt; cohorts</code>, <code>FanpassLeaderboardEntry? current_user</code>, <code>bool current_user_in_leaderboard</code></td><td>0</td></tr>
<tr><td><code>FanpassUserComparisonResponse</code></td><td><code>String user_id</code>, <code>Map&lt;String, Object?&gt; filter</code>, <code>List&lt;UserCohortBreakdownEntry&gt; cohorts</code></td><td>0</td></tr>
<tr><td><code>FanpassLeaderboardOptions</code></td><td>None</td><td>7</td></tr>
<tr><td><code>PushSubscriptionJSON</code></td><td><code>String endpoint</code>, <code>PushSubscriptionJSONKeys keys</code></td><td>0</td></tr>
<tr><td><code>NotificationEvent</code></td><td><code>String id</code>, <code>NotificationEventType event</code>, <code>Map&lt;String, Object?&gt; data</code>, <code>String tenant_id</code>, <code>String user_id</code>, <code>String timestamp</code></td><td>0</td></tr>
<tr><td><code>CredentialType</code></td><td><code>String id</code>, <code>String name</code>, <code>String slug</code>, <code>num display_order</code>, <code>Map&lt;String, Object?&gt; schema_definition</code>, <code>bool is_revocable</code>, <code>num max_active_per_user</code>, <code>bool auto_renew</code>, <code>String default_visibility</code>, <code>bool requires_opt_in</code>, <code>String status</code>, <code>num total_issued</code>, <code>num total_active</code>, <code>String created_at</code></td><td>5</td></tr>
<tr><td><code>IssuedCredential</code></td><td><code>String id</code>, <code>String credential_type_id</code>, <code>String credential_type_name</code>, <code>String credential_type_slug</code>, <code>String user_id</code>, <code>String verification_code</code>, <code>Map&lt;String, Object?&gt; credential_data</code>, <code>String visibility</code>, <code>String status</code>, <code>bool is_valid</code>, <code>String issued_at</code>, <code>num verification_count</code></td><td>5</td></tr>
<tr><td><code>CredentialVerifyResult</code></td><td><code>bool valid</code>, <code>String status</code>, <code>String credential_type</code>, <code>String credential_type_slug</code>, <code>Map&lt;String, Object?&gt; credential_data</code>, <code>String issued_at</code>, <code>String issuer</code>, <code>num verification_count</code></td><td>4</td></tr>
<tr><td><code>UserCredentialsSummary</code></td><td><code>bool credentials_enabled</code>, <code>num total_credentials</code>, <code>num active_credentials</code>, <code>List&lt;IssuedCredential&gt; credentials</code></td><td>0</td></tr>
<tr><td><code>CreateCredentialTypeRequest</code></td><td><code>String name</code></td><td>15</td></tr>
<tr><td><code>IssueCredentialRequest</code></td><td><code>String credential_type_id</code>, <code>String user_id</code></td><td>4</td></tr>
<tr><td><code>ListIssuedCredentialsOptions</code></td><td>None</td><td>5</td></tr>
<tr><td><code>MintNFTRequest</code></td><td><code>String recipientAddress</code>, <code>String name</code></td><td>10</td></tr>
<tr><td><code>NFTMint</code></td><td><code>String id</code>, <code>String tenant_id</code>, <code>String recipient_address</code>, <code>String? recipient_user_id</code>, <code>num? token_id</code>, <code>String? tx_hash</code>, <code>String contract_address</code>, <code>String network</code>, <code>String? content_hash</code>, <code>num cert_type</code>, <code>num? validity_days</code>, <code>Map&lt;String, Object?&gt;? metadata</code>, <code>String? metadata_uri</code>, <code>String image_url</code>, <code>String? image_storage_path</code>, <code>String name</code>, <code>String? description</code>, <code>String status</code>, <code>String? error_message</code>, <code>String? gas_used</code>, <code>String? created_at</code>, <code>String? updated_at</code></td><td>0</td></tr>
<tr><td><code>ListMintsOptions</code></td><td>None</td><td>5</td></tr>
<tr><td><code>ListMintsResponse</code></td><td><code>List&lt;NFTMint&gt; mints</code>, <code>num total</code></td><td>0</td></tr>
<tr><td><code>OTTGenerateRequest</code></td><td>None</td><td>2</td></tr>
<tr><td><code>OTTGenerateResponse</code></td><td><code>String ott</code>, <code>num expires_in</code></td><td>0</td></tr>
<tr><td><code>OTTRedeemResponse</code></td><td><code>String user_id</code>, <code>String tenant_id</code>, <code>String? tenant_name</code>, <code>Map&lt;String, Object?&gt; session_data</code>, <code>String issued_at</code>, <code>String expires_at</code></td><td>0</td></tr>
<tr><td><code>OTTConfigUpdate</code></td><td>None</td><td>5</td></tr>
<tr><td><code>OTTConfigResponse</code></td><td><code>String partner_key_id</code>, <code>String partner_name</code>, <code>bool ott_enabled</code>, <code>num ott_ttl_seconds</code>, <code>String ott_redemption_mode</code>, <code>num ott_jwt_ttl_seconds</code></td><td>1</td></tr>
<tr><td><code>IngestEventRequest</code></td><td><code>String userId</code>, <code>String eventType</code></td><td>5</td></tr>
<tr><td><code>IngestEventResponse</code></td><td><code>String eventId</code>, <code>String certificateId</code>, <code>String status</code></td><td>2</td></tr>
<tr><td><code>BatchIngestRequest</code></td><td><code>List&lt;IngestEventRequest&gt; events</code></td><td>0</td></tr>
<tr><td><code>BatchIngestResponse</code></td><td><code>num totalEvents</code>, <code>num queued</code>, <code>num failed</code>, <code>List&lt;IngestEventResponse&gt; results</code></td><td>0</td></tr>
<tr><td><code>IngestionClientOptions</code></td><td><code>String apiKey</code></td><td>2</td></tr>
<tr><td><code>EndUserIngestionClientOptions</code></td><td><code>String userToken</code>, <code>String tenantId</code></td><td>2</td></tr>
<tr><td><code>ComprehensiveWalletInfoBalances</code></td><td><code>String address</code>, <code>String network</code>, <code>List&lt;TokenBalance&gt; tokens</code>, <code>String fetched_at</code></td><td>0</td></tr>
<tr><td><code>ComprehensiveWalletInfoNfts</code></td><td><code>num total</code>, <code>List&lt;NFT&gt; items</code></td><td>0</td></tr>
<tr><td><code>ComprehensiveWalletInfoActivity</code></td><td><code>List&lt;SwapResult&gt; recent_swaps</code>, <code>num total_swaps</code></td><td>0</td></tr>
<tr><td><code>UserWalletSummaryWalletsItem</code></td><td><code>String wallet_id</code>, <code>String address</code>, <code>String wallet_type</code>, <code>String network</code>, <code>bool supports_export</code>, <code>String created_at</code></td><td>4</td></tr>
<tr><td><code>UserWithWalletsWalletsItem</code></td><td><code>String wallet_id</code>, <code>String address</code>, <code>String wallet_type</code>, <code>String network</code>, <code>String status</code></td><td>1</td></tr>
<tr><td><code>EnsureWalletResultAssetWallet</code></td><td><code>String wallet_id</code>, <code>String address</code>, <code>String wallet_type</code>, <code>String network</code></td><td>0</td></tr>
<tr><td><code>EnsureWalletResultSmartWallet</code></td><td><code>String wallet_id</code>, <code>String address</code>, <code>String wallet_type</code>, <code>String network</code></td><td>0</td></tr>
<tr><td><code>EventMetadataEventTypesItem</code></td><td><code>String event_type</code>, <code>num count</code>, <code>String last_seen</code></td><td>0</td></tr>
<tr><td><code>PushSubscriptionJSONKeys</code></td><td><code>String p256dh</code>, <code>String auth</code></td><td>0</td></tr>
<tr><td><code>UserWalletSummaryWalletsItemBalances</code></td><td><code>String address</code>, <code>String network</code>, <code>List&lt;TokenBalance&gt; tokens</code>, <code>String fetched_at</code></td><td>0</td></tr>
</tbody></table>


## 17.2 String unions and aliases

Dart string aliases do not enforce the JavaScript union members at runtime. Check the JavaScript type definition and server contract for accepted literal values.

```text
typedef AttestationMode = String;
```

```text
typedef EventStatus = String;
```

```text
typedef ChannelState = String;
```

```text
typedef QuestCtaType = String;
```

```text
typedef NotificationEventType = String;
```

```text
typedef OTTRequestResponse = OTTGenerateResponse;
```

## 17.3 Handwritten support and error types

`JsonModel`, `JsonMap`, `UploadFile`, `ProofChainOptions`, `SubscribeOptions`, `NotificationCallback`, `Unsubscribe`, `ProofChainError`, `AuthenticationError`, `AuthorizationError`, `NotFoundError`, `ValidationError`, `ValidationErrorDetail`, `RateLimitError`, `ServerError`, `NetworkError`, and `TimeoutError` are exported support types. Error semantics and arbitrary validation detail handling are covered in chapter 5. `HttpClient` and JSON conversion helpers are internal implementation details, not exported transport-extension APIs.

