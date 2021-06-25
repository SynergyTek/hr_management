import 'package:hr_management/data/models/leave_models/leave_res_model.dart';

import '../../../constants/api_endpoints.dart';
import 'package:dio/dio.dart';

part 'leave_temp_implementation.dart';

// Overview of the repository class.
abstract class AbstractLeaveTempRepository {
  AbstractLeaveTempRepository();

  Future<LeaveTempResponse> getAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<LeaveTempResponse> postAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<LeaveTempResponse> putAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<LeaveTempResponse> deleteAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });
}
