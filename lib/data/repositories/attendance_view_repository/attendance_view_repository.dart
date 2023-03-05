import 'dart:convert';

import 'package:dio/dio.dart';
import '../../models/attendance_view_models/attendance_view_response.dart';

import '../../../constants/api_endpoints.dart';
import '../../models/roaster_scheduler_list_model/roaster_scheduler_list_response.dart';
import '../../models/user_geo_location_model/user_geo_location_response.dart';

part 'attendance_view_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractAttendanceViewRepository {
  AbstractAttendanceViewRepository();

  Future<AttendanceViewResponse> getAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });

  Future<AttendanceViewResponse> postInsertEmployeeTracking({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
    List<dynamic>? data,
  });

  Future<AttendanceViewResponse> getEmployeeTrackingByDate({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });

  Future<UserGeolocationResponse> getUserGeoLocation({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });
  Future<AttendanceViewResponse> postAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });

  Future<AttendanceViewResponse> putAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });

  Future<AttendanceViewResponse> deleteAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });
  Future<RoasterSchedulerListResponse> getRoasterSchedulerList({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });
}
