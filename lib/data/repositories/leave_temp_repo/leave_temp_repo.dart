import 'package:dio/dio.dart';
import 'package:hr_management/data/models/service_models/service_response.dart';

import '../../../constants/api_endpoints.dart';
import '../../models/leave_models/business_trip_response_model.dart';
import '../../models/leave_models/leave_res_model.dart';

part 'leave_temp_implementation.dart';

// Overview of the repository class.
abstract class AbstractLeaveTempRepository {
  AbstractLeaveTempRepository();

  Future<LeaveTempResponse> getAllowedTemplateData({
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
