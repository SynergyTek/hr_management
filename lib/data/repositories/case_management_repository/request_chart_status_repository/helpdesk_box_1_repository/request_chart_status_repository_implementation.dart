part of 'request_chart_status_repository.dart';

class RequestChartStatusRepository extends AbstractRequestChartStatusRepository {
  final Dio _dio = Dio();

  Future<OpenRequestsByCategoryResponse> getAPIData({
    Map<String, dynamic> queryparams,
  }) async {
    //
    String endpoint = APIEndpointConstants.GET_REQUEST_CHART_STATUS;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );


      return OpenRequestsByCategoryResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");
      return OpenRequestsByCategoryResponse.withError("$err");
    }
  }

  @override
  Future<bool> deleteAPIData({
    Map<String, dynamic> queryparams,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<OpenRequestsByCategoryResponse> postAPIData({
    Map<String, dynamic> queryparams,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<OpenRequestsByCategoryResponse> putAPIData({
    Map<String, dynamic> queryparams,
  }) {
    throw UnimplementedError();
  }
}
