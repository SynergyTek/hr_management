part of 'remote_attendance_repository.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class RemoteAttendanceRepository extends AbstractRemoteAttendanceRepository {
  final Dio _dio = Dio();

  Future<RemoteAttendanceResponse> getInsertAccessLog({
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
        return RemoteAttendanceResponse.fromJson(
          queryparams["punchingTye"],
        );

      // i.e. Something went wrong!?
      // Some corner case.
      return RemoteAttendanceResponse.withError("-1");
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return RemoteAttendanceResponse.withError("$err");
    }
  }

  @override
  Future<RemoteAttendanceResponse> deleteAPIData(
      {Map<String, dynamic> queryparams}) {
    throw UnimplementedError();
  }

  @override
  Future<RemoteAttendanceResponse> postAPIData({
    Map<String, dynamic> queryparams,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<RemoteAttendanceResponse> putAPIData(
      {Map<String, dynamic> queryparams}) {
    throw UnimplementedError();
  }
}
