import 'dart:convert';

import 'http.dart';
import 'json.dart';
import 'models.dart';

class CohortLeaderboardClient {
  final HttpClient http;
  CohortLeaderboardClient(this.http);

  Future<List<CohortDefinition>> list([ListCohortsOptions? options]) async {
    final response = await http.get('/cohorts/definitions', {
      if (jsTruthy(options?.status)) 'status': options!.status,
      if (jsTruthy(options?.limit)) 'limit': options!.limit,
      if (jsTruthy(options?.offset)) 'offset': options!.offset,
    });
    if (response is List<Object?>) {
      return decodeList(response, CohortDefinition.fromJson);
    }
    final cohorts = asJsonMap(response)['cohorts'];
    return jsTruthy(cohorts)
        ? decodeList(cohorts, CohortDefinition.fromJson)
        : <CohortDefinition>[];
  }

  Future<CohortDefinition> get(String cohortId) async => decodeModel(
      await http.get('/cohorts/definitions/${encodeComponent(cohortId)}'),
      CohortDefinition.fromJson);

  Future<CohortLeaderboardResponse> getLeaderboard(String cohortId,
          [CohortLeaderboardOptions? options]) async =>
      decodeModel(
        await http.get(
          '/cohorts/definitions/${encodeComponent(cohortId)}/leaderboard',
          {
            if (jsTruthy(options?.filters))
              'filters': jsonEncode(options!.filters),
            if (jsTruthy(options?.country)) 'country': options!.country,
            if (jsTruthy(options?.limit)) 'limit': options!.limit,
            if (jsTruthy(options?.top_n)) 'top_n': options!.top_n,
            if (jsTruthy(options?.fresh)) 'fresh': 'true',
            if (jsTruthy(options?.userId)) 'user_id': options!.userId,
          },
        ),
        CohortLeaderboardResponse.fromJson,
      );

  Future<UserBreakdownResponse> getUserBreakdown(String userId,
          [JsonMap options = const {}]) async =>
      decodeModel(
        await http.get('/cohorts/users/${encodeComponent(userId)}/breakdown', {
          if (jsTruthy(options['filters']))
            'filters': jsonEncode(jsonValue(options['filters'])),
          if (jsTruthy(options['country'])) 'country': options['country'],
        }),
        UserBreakdownResponse.fromJson,
      );
}
