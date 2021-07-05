part of 'abstract_access_log_repo.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class AccessLogRepository extends AbstractAccessLogRepository {
  final Dio _dio = Dio();

  Future<AccessLogResponse> getInsertAccessLog({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.INSERT_ACCESS_LOG;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      // print("DIO Response: ${response.data}, ${response.data.runtimeType}");

      if (response?.data != null)
        return AccessLogResponse.fromJson(
          queryparams["punchingTye"],
        );

      // i.e. Something went wrong!?
      // Some corner case.
      return AccessLogResponse.withError("-1");
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return AccessLogResponse.withError("$err");
    }
  }


 Future<AccessLogResponse> getAccessLogs({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  }) async {
    try {
      // TODO: Need to send this via UI and not hardcode here!
      queryparams = {
        // 'api_key': APIEndpointConstants.API_KEY,
        // 'language': 'en-US',
        // 'page': 1
      };

      Response response = await _dio.get(
        APIEndpointConstants.GET_ALLOWED_TEMPLATES,
        queryParameters: queryparams ?? {},
      );
      print("DIO Response: ${response.data} ${response.data.runtimeType}");
      return AccessLogResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      
      print("Stack: \n\n\n $stacktrace");
      print("Err: \n\n\n $err");

      return AccessLogResponse.withError("$err");
    }
  }

  @override
  Future<AccessLogResponse> deleteAPIData(
      {Map<String, dynamic> queryparams}) {
    throw UnimplementedError();
  }

  @override
  Future<AccessLogResponse> postAPIData({
    Map<String, dynamic> queryparams,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<AccessLogResponse> putAPIData(
      {Map<String, dynamic> queryparams}) {
    throw UnimplementedError();
  }
}
