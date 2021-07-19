part of 'attendance_view_repository.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class AttendanceViewRepository extends AbstractAttendanceViewRepository {
  final Dio _dio = Dio();

  Future<AttendanceViewResponse> getAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_ATTENDANCE_VIEW_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );


      return AttendanceViewResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      // print(
      //     "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      // print("Stacktrace: $stacktrace \nError: $err");

      return AttendanceViewResponse.withError("$err");
    }
  }

  @override
  Future<AttendanceViewResponse> deleteAPIData(
      {Map<String, dynamic> queryparams}) {
    throw UnimplementedError();
  }

  @override
  Future<AttendanceViewResponse> postAPIData(
      {Map<String, dynamic> queryparams}) {
    throw UnimplementedError();
  }

  @override
  Future<AttendanceViewResponse> putAPIData(
      {Map<String, dynamic> queryparams}) {
    throw UnimplementedError();
  }
}
