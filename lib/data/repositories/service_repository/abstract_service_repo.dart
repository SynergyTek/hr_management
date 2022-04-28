import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../constants/api_endpoints.dart';
import '../../models/api_models/post_response_model.dart';
import '../../models/service_models/service.dart';
import '../../models/service_models/service_response.dart';
import '../../models/service_models/service_summary_response_model.dart';

part 'service_repo.dart';

// Overview of the repository class.
abstract class AbstractServiceRepository {
  AbstractServiceRepository();

  Future<ServiceResponse> getServiceDetail({
    Map<String, dynamic>? queryparams,
  }); //{
  // Optional Params to be added to the request if required.
  //  Map<String, dynamic> queryparams,});

  Future<PostResponse> postAPIData({
    Map<String, dynamic>? queryparams,
    required Service service,
  });

  Future<ServiceResponse> putAPIData({
    Map<String, dynamic>? queryparams,
  });

  Future<ServiceResponse> deleteAPIData({
    Map<String, dynamic>? queryparams,
  });

  Future<ServiceListResponse> getServiceDashBoardData({
    Map<String, dynamic>? queryparams,
  });

  Future<ServiceSummaryResponse> getServiceSummaryData({
    Map<String, dynamic>? queryparams,
  });
  Future<ServiceListResponse> getReadServiceData({
    Map<String, dynamic>? queryparams,
  });
  Future<ServiceMapResponse> getReadServiceListCount({
    Map<String, dynamic>? queryparams,
  });
}
