import 'dart:convert';

import 'package:dio/dio.dart';

import '../../constants/api_endpoints.dart';
import '../../models/post_model/post_response.dart';
import '../../models/service_models/service_model.dart';
import '../../models/service_models/service_response.dart';

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
}
