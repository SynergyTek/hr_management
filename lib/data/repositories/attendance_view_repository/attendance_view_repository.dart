import 'package:dio/dio.dart';
import 'package:hr_management/data/models/attendance_view_models/attendance_view_response.dart';

import '../../../constants/api_endpoints.dart';

part 'attendance_view_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractAttendanceViewRepository {
  AbstractAttendanceViewRepository();

  Future<AttendanceViewResponse> getAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<AttendanceViewResponse> postAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<AttendanceViewResponse> putAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<AttendanceViewResponse> deleteAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });
}
