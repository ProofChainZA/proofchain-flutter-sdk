import 'dart:convert';

import 'http.dart';
import 'json.dart';
import 'models.dart';

class FanpassLeaderboardClient {
  final HttpClient http;
  FanpassLeaderboardClient(this.http);

  Future<FanpassLeaderboardResponse> getLeaderboard(
          [FanpassLeaderboardOptions? options]) async =>
      decodeModel(
        await http.get('/passport-v2/fanpass/leaderboard', {
          if (jsTruthy(options?.aggregationRuleId))
            'aggregation_rule_id': options!.aggregationRuleId,
          if (jsTruthy(options?.filters))
            'filters': jsonEncode(options!.filters),
          if (jsTruthy(options?.country)) 'country': options!.country,
          if (jsTruthy(options?.limit)) 'limit': options!.limit,
          if (jsTruthy(options?.top_n)) 'top_n': options!.top_n,
          if (jsTruthy(options?.fresh)) 'fresh': 'true',
          if (jsTruthy(options?.userId)) 'user_id': options!.userId,
        }),
        FanpassLeaderboardResponse.fromJson,
      );

  Future<FanpassUserComparisonResponse> getUserComparison(String userId,
          [JsonMap options = const {}]) async =>
      decodeModel(
        await http
            .get('/passport-v2/fanpass/${encodeComponent(userId)}/comparison', {
          if (jsTruthy(options['filters']))
            'filters': jsonEncode(jsonValue(options['filters'])),
          if (jsTruthy(options['country'])) 'country': options['country'],
        }),
        FanpassUserComparisonResponse.fromJson,
      );

  Future<List<FanpassCohortStatus>> listCohorts(
          [FanpassLeaderboardOptions? options]) async =>
      (await getLeaderboard(options)).cohorts;

  Future<FanpassCohortStatus?> getCohort(String cohortSlug,
      [FanpassLeaderboardOptions? options]) async {
    final cohorts = await listCohorts(options);
    for (final cohort in cohorts) {
      if (cohort.cohort_slug == cohortSlug) return cohort;
    }
    return null;
  }
}
