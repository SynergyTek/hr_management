part of 'request_chart_status_repository.dart';

class RequestChartStatusRepository extends AbstractRequestChartStatusRepository {
  final Dio _dio = Dio();

  Future<CaseManagementResponse> getAPIData({
    Map<String, dynamic> queryparams,
  }) async {
    //
    String endpoint = APIEndpointConstants.GET_REQUEST_CHART_STATUS;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      print("Helpdesk box 1 response: ${response.data}, $queryparams");

      return CaseManagementResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");
      return CaseManagementResponse.withError("$err");
    }
  }

  @override
  Future<bool> deleteAPIData({
    Map<String, dynamic> queryparams,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<CaseManagementResponse> postAPIData({
    Map<String, dynamic> queryparams,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<CaseManagementResponse> putAPIData({
    Map<String, dynamic> queryparams,
  }) {
    throw UnimplementedError();
  }
}
