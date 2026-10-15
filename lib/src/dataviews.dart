import 'http.dart';
import 'json.dart';
import 'models.dart';

class DataViewsClient {
  final HttpClient http;
  DataViewsClient(this.http);

  Future<DataViewListResponse> list() async => decodeModel(
      await http.get('/data-mesh/views'), DataViewListResponse.fromJson);

  Future<DataViewDetail> get(String viewName) async => decodeModel(
      await http.get('/data-mesh/views/custom/$viewName'),
      DataViewDetail.fromJson);

  Future<DataViewDetail> create(CreateDataViewRequest request) async =>
      decodeModel(await http.post('/data-mesh/views/custom', request),
          DataViewDetail.fromJson);

  Future<DataViewDetail> update(
          String viewName, UpdateDataViewRequest request) async =>
      decodeModel(
          await http.patch('/data-mesh/views/custom/$viewName', request),
          DataViewDetail.fromJson);

  Future<void> delete(String viewName) async {
    await http.delete('/data-mesh/views/custom/$viewName');
  }

  Future<DataViewExecuteResult> execute(
          String identifier, String viewName) async =>
      decodeModel(
          await http.get('/data-mesh/views/$identifier/custom/$viewName'),
          DataViewExecuteResult.fromJson);

  Future<DataViewPreviewResult> preview(DataViewPreviewRequest request) async =>
      decodeModel(await http.post('/data-mesh/views/preview', request),
          DataViewPreviewResult.fromJson);

  Future<FanProfileView> getFanProfile(String walletAddress) async =>
      decodeModel(await http.get('/data-mesh/views/$walletAddress/fan-profile'),
          FanProfileView.fromJson);

  Future<ActivitySummaryView> getActivitySummary(String walletAddress,
          [num days = 30]) async =>
      decodeModel(
        await http.get('/data-mesh/views/$walletAddress/activity-summary', {
          'days': days,
        }),
        ActivitySummaryView.fromJson,
      );

  Future<EventMetadata> getEventMetadata() async => decodeModel(
      await http.get('/data-mesh/event-metadata'), EventMetadata.fromJson);

  Future<List<ViewTemplate>> getTemplates() async {
    final response = asJsonMap(await http.get('/data-mesh/views/templates'));
    final templates = response['templates'];
    return jsTruthy(templates)
        ? decodeList(templates, ViewTemplate.fromJson)
        : <ViewTemplate>[];
  }
}
