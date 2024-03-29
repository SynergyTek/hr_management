import 'dart:convert';

import 'package:dio/dio.dart';

import '../../constants/api_endpoints.dart';
import '../../models/business_trip_model/business_trip_response_model.dart';
import '../../models/post_model/post_response.dart';
import '../../models/reimbursement_model/reimbursement_response.dart';
import '../../models/service_models/service_model.dart';
import '../../models/service_models/service_response.dart';
import '../../models/time_permission_model/time_permission_response.dart';

part 'service_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractServiceRepository {
  AbstractServiceRepository();

  Future<ServiceListResponse> getServiceHomeListData({
    Map<String, dynamic> queryparams,
  });

  Future<ServiceResponse> getServiceDetail({
    Map<String, dynamic> queryparams,
  }); //{
  // Optional Params to be added to the request if required.
  //  Map<String, dynamic> queryparams,});

  Future<PostResponse> postServiceAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
    required Service service,
  });

  Future<ServiceResponse> deleteService({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<PaginationMyRequestsResponse> getMyRequestList({
    Map<String, dynamic>? queryparams,
  });

  Future<ServiceMapResponse> getReadServiceListCount({
    Map<String, dynamic>? queryparams,
  });

  Future<ServiceListResponse> getReadServiceData({
    Map<String, dynamic>? queryparams,
  });

  Future<ServiceListResponse> getServiceDashBoardData({
    Map<String, dynamic>? queryparams,
  });

  Future<ServiceListResponse> readLeaveDetailData({
    Map<String, dynamic>? queryparams,
  });

  Future<BusinessTripResponse> getBusinessTripDetails({
    Map<String, dynamic>? queryparams,
  });

  Future<TimePermissionResponse> getTimePermissionData({
    Map<String, dynamic>? queryparams,
  });

  Future<ReimbursementResponse> getTravelReimbursementData({
    Map<String, dynamic>? queryparams,
  });

  Future<ReimbursementResponse> getMedicalReimbursementData({
    Map<String, dynamic>? queryparams,
  });

  Future<ReimbursementResponse> getEducationalReimbursementData({
    Map<String, dynamic>? queryparams,
  });

  Future<ReimbursementResponse> getOtherReimbursementData({
    Map<String, dynamic>? queryparams,
  });
}
