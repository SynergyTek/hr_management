import 'package:hr_management/data/models/remote_attendance_models/remote_attendance_response.dart';

import '../../../constants/api_endpoints.dart';
import 'package:dio/dio.dart';

part 'remote_attendance_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractRemoteAttendanceRepository {
  AbstractRemoteAttendanceRepository();

  Future<RemoteAttendanceResponse> getAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<RemoteAttendanceResponse> postAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<RemoteAttendanceResponse> putAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<RemoteAttendanceResponse> deleteAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });
}
