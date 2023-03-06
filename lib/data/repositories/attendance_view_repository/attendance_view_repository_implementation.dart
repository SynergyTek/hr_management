part of 'attendance_view_repository.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class AttendanceViewRepository extends AbstractAttendanceViewRepository {
  final Dio _dio = Dio();

  Future<AttendanceViewResponse> getAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_ATTENDANCE_VIEW_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      return AttendanceViewResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return AttendanceViewResponse.withError("$err");
    }
  }

  Future<AttendanceViewResponse> postInsertEmployeeTracking({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
    List<UserLocation>? data,
  }) async {
    final String endpoint = APIEndpointConstants.POST_INSERT_EMPLOYEE_TRACKING;

    try {
      Response response = await _dio.post(
        endpoint,
        queryParameters: queryparams ?? {},
        data: jsonEncode(data),
      );

      return AttendanceViewResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return AttendanceViewResponse.withError("$err");
    }
  }

  Future<AttendanceViewResponse> getEmployeeTrackingByDate({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_EMPLOYEE_TRACKING_BY_DATE;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      return AttendanceViewResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return AttendanceViewResponse.withError("$err");
    }
  }

  Future<UserGeolocationResponse> getUserGeoLocation({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_USER_GEO_LOCATION;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      return UserGeolocationResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return UserGeolocationResponse.withError("$err");
    }
  }

  Future<RoasterSchedulerListResponse> getRoasterSchedulerList({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_ROASTER_SCHEDULER_LIST;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      return RoasterSchedulerListResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return RoasterSchedulerListResponse.withError("$err");
    }
  }

  Future<RoasterSchedulerListResponse> getPostTaskTimeEntry({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_POST_TASK_TIME_ENTRY;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      return RoasterSchedulerListResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return RoasterSchedulerListResponse.withError("$err");
    }
  }


  @override
  Future<AttendanceViewResponse> deleteAPIData(
      {Map<String, dynamic>? queryparams}) {
    throw UnimplementedError();
  }

  @override
  Future<AttendanceViewResponse> postAPIData(
      {Map<String, dynamic>? queryparams}) {
    throw UnimplementedError();
  }

  @override
  Future<AttendanceViewResponse> putAPIData(
      {Map<String, dynamic>? queryparams}) {
    throw UnimplementedError();
  }
}
