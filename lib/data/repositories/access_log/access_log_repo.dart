part of 'abstract_access_log_repo.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class AccessLogRepository extends AbstractAccessLogRepository {
  final Dio _dio = Dio();

  /// getInsertAccessLog: is used for Sign-in and Signout using UI.
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

  /// getAccessLogsListData
  Future<AccessLogListDataResponse> getAccessLogsListData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.GET_ACCESS_LOG_LIST_DATA,
        queryParameters: queryparams ?? {},
      );

      print(
          "DIO Response for ListData AccessLog:  ${response.data.length}, ${response.data} ${response.data.runtimeType},");
      return AccessLogListDataResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Err: \n $err");
      print("Stack: \n $stacktrace");

      return AccessLogListDataResponse.withError("$err");
    }
  }

  @override
  Future<AccessLogResponse> deleteAPIData({Map<String, dynamic> queryparams}) {
    throw UnimplementedError();
  }

  @override
  Future<AccessLogResponse> postAPIData({
    Map<String, dynamic> queryparams,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<AccessLogResponse> putAPIData({Map<String, dynamic> queryparams}) {
    throw UnimplementedError();
  }
}
