part of 'component_result_repository.dart';

class ComponentResultRepository extends AbstractComponentResultRepository {
  final Dio _dio = Dio();

  Future<ComponentResultResponse> getAPIData({
    Map<String, dynamic> queryparams,
  }) async {
    //
    String endpoint = APIEndpointConstants.GET_COMPONENT_RESULT_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      print("Component result response: ${response.data}, $queryparams");

      return ComponentResultResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return ComponentResultResponse.withError("$err");
    }
  }

  @override
  Future<bool> deleteAPIData({
    Map<String, dynamic> queryparams,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<ComponentResultResponse> postAPIData({
    Map<String, dynamic> queryparams,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ComponentResultResponse> putAPIData({
    Map<String, dynamic> queryparams,
  }) {
    throw UnimplementedError();
  }
}
