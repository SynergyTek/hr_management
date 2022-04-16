import 'package:dio/dio.dart';

import '../../models/business_trip_model/business_trip_response_model.dart';
import '../../../constants/api_endpoints.dart';
import '../../models/hr_policy_document_model/hr_policy_response_model.dart';
import '../../models/reimbursement_model/reimbursement_response.dart';
import '../../models/service_models/service_response.dart';
import '../../models/time_permission_model/time_permission_response.dart';

part 'leave_repo.dart';

// Overview of the repository class.
abstract class AbstractLeaveRepository {
  AbstractLeaveRepository();

  Future<BusinessTripResponse> getBusinessTripDetails({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });

  Future<HrPolicyDocumentResponse> getHrPolicyDocuments({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });

  Future<ServiceListResponse> readLeaveDetailData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });

  Future<TimePermissionResponse> getTimePermissionData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });

  Future<ReimbursementResponse> getTravelReimbursementData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });

  Future<ReimbursementResponse> getMedicalReimbursementData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });

  Future<ReimbursementResponse> getEducationalReimbursementData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });

  Future<ReimbursementResponse> getOtherReimbursementData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });

  Future<ServiceListResponse> getEmployeeAttendanceList({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });
  
}
