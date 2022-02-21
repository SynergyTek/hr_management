import 'package:dio/dio.dart';
import '../../../../constants/api_endpoints.dart';
import '../../../models/case_management_model/case_management_response.dart';

part 'helpdesk_box_1_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractHelpdeskBox1Repository {
  AbstractHelpdeskBox1Repository();

  Future<CaseManagementResponse> getAPIData({
    Map<String, dynamic>? queryparams,
  });

  Future<CaseManagementResponse> postAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });

  Future<CaseManagementResponse> putAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });

  Future<bool> deleteAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });
}
