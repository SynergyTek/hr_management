import 'package:dio/dio.dart';

import '../../../constants/api_endpoints.dart';
import '../../models/leave_models/leave_res_model.dart';

part 'leave_repo.dart';

// Overview of the repository class.
abstract class AbstractLeaveRepository {
  AbstractLeaveRepository();

  Future<LeaveTempResponse> getAPi({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });

  Future<LeaveTempResponse> postAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });

  Future<LeaveTempResponse> putAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });

  Future<LeaveTempResponse> deleteAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });
}
