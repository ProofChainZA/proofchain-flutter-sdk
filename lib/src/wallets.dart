import 'http.dart';
import 'json.dart';
import 'models.dart';

class WalletClient {
  final HttpClient http;
  WalletClient(this.http);

  Future<Wallet> create(CreateWalletRequest data) async =>
      decodeModel(await http.post('/wallets', data), Wallet.fromJson);
  Future<Wallet> get(String walletId) async =>
      decodeModel(await http.get('/wallets/$walletId'), Wallet.fromJson);
  Future<List<Wallet>> listByUser(String userId) async => decodeList(
      await http.get('/wallets/user/${encodeComponent(userId)}'),
      Wallet.fromJson);
  Future<WalletStats> stats() async =>
      decodeModel(await http.get('/wallets/stats'), WalletStats.fromJson);
  Future<UsersWithWalletsResponse> listUsersWithWallets(
          [num limit = 50, num offset = 0]) async =>
      decodeModel(
          await http.get(
              '/wallets/users-with-wallets?limit=${jsString(limit)}&offset=${jsString(offset)}'),
          UsersWithWalletsResponse.fromJson);
  Future<DualWallets> createDual(CreateDualWalletsRequest data) async =>
      decodeModel(await http.post('/wallets/dual', data), DualWallets.fromJson);
  Future<List<DualWallets>> createDualBulk(List<String> userIds,
          [String network = 'base-mainnet']) async =>
      decodeList(
          await http.post(
              '/wallets/dual/bulk', {'user_ids': userIds, 'network': network}),
          DualWallets.fromJson);
  Future<WalletBalanceResponse> getBalance(String walletId) async =>
      decodeModel(await http.get('/wallets/$walletId/balance'),
          WalletBalanceResponse.fromJson);
  Future<ComprehensiveWalletInfo> getInfo(String walletId,
      [JsonMap options = const {}]) async {
    final params = <String, Object?>{};
    for (final pair in const {
      'includeBalances': 'include_balances',
      'includeNfts': 'include_nfts',
      'includeActivity': 'include_activity'
    }.entries) {
      if (options.containsKey(pair.key)) {
        params[pair.value] = jsString(options[pair.key]);
      }
    }
    final query = queryString(params);
    return decodeModel(
        await http
            .get('/wallets/$walletId/info${query.isEmpty ? '' : '?$query'}'),
        ComprehensiveWalletInfo.fromJson);
  }

  Future<UserWalletSummary> getUserSummary(String userId,
          [bool includeBalances = true]) async =>
      decodeModel(
          await http.get(
              '/wallets/user/${encodeComponent(userId)}/summary?include_balances=$includeBalances'),
          UserWalletSummary.fromJson);
  Future<JsonMap> exportKey(String walletId) async => asJsonMap(await http
      .post('/wallets/$walletId/export-key', {'acknowledge_warning': true}));
  Future<TransferResult> transfer(TransferRequest request) async => decodeModel(
      await http.post('/wallets/transfer', request), TransferResult.fromJson);
  Future<SwapQuote> getSwapQuote(SwapQuoteRequest request) async => decodeModel(
      await http.post('/wallets/swaps/quote', request), SwapQuote.fromJson);
  Future<SwapResult> executeSwap(ExecuteSwapRequest request) async =>
      decodeModel(await http.post('/wallets/swaps/execute', request),
          SwapResult.fromJson);
  Future<List<NFT>> getNFTs(String walletId) async =>
      decodeList(await http.get('/wallets/$walletId/nfts'), NFT.fromJson);
  Future<List<NFT>> getUserNFTs(String userId) async => decodeList(
      await http.get('/wallets/user/${encodeComponent(userId)}/nfts'),
      NFT.fromJson);
  Future<NFT> addNFT(String walletId, AddNFTRequest nft) async => decodeModel(
      await http.post('/wallets/$walletId/nfts', nft), NFT.fromJson);
  Future<TransactionHistory> getTransactions(String walletId,
      [JsonMap options = const {}]) async {
    final params = <String, Object?>{};
    for (final key in const ['limit', 'offset']) {
      if (options.containsKey(key)) params[key] = jsString(options[key]);
    }
    final query = queryString(params);
    return decodeModel(
        await http.get(
            '/wallets/$walletId/transactions${query.isEmpty ? '' : '?$query'}'),
        TransactionHistory.fromJson);
  }

  Future<Token> createToken(CreateTokenRequest request) async =>
      decodeModel(await http.post('/tokens', request), Token.fromJson);
  Future<List<Token>> listTokens([JsonMap options = const {}]) async {
    final params = <String, Object?>{};
    if (jsTruthy(options['network'])) params['network'] = options['network'];
    for (final key in const ['include_global', 'include_hidden']) {
      if (options.containsKey(key)) params[key] = jsString(options[key]);
    }
    final query = queryString(params);
    return decodeList(
        await http.get('/tokens${query.isEmpty ? '' : '?$query'}'),
        Token.fromJson);
  }

  Future<List<Token>> listGlobalTokens([String? network]) async => decodeList(
      await http
          .get('/tokens/global${jsTruthy(network) ? '?network=$network' : ''}'),
      Token.fromJson);
  Future<Token> getToken(String tokenId) async =>
      decodeModel(await http.get('/tokens/$tokenId'), Token.fromJson);
  Future<Token> getTokenByContract(
          String contractAddress, String network) async =>
      decodeModel(
          await http.get(
              '/tokens/by-contract/$contractAddress?network=${encodeComponent(network)}'),
          Token.fromJson);
  Future<Token> updateToken(String tokenId, UpdateTokenRequest request) async =>
      decodeModel(
          await http.patch('/tokens/$tokenId', request), Token.fromJson);
  Future<JsonMap> deleteToken(String tokenId) async =>
      asJsonMap(await http.delete('/tokens/$tokenId'));
}
