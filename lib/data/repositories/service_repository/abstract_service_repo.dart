import 'dart:convert';

import 'package:dio/dio.dart';
// import 'dart:html';

import 'package:flutter/widgets.dart';

import '../../../constants/api_endpoints.dart';
import '../../models/api_models/post_response_model.dart';
import '../../models/service_models/service.dart';
import '../../models/service_models/service_response.dart';

part 'service_repo.dart';

// Overview of the repository class.
abstract class AbstractServiceRepository {
  AbstractServiceRepository();

  Future<ServiceResponse> getServiceDetail({
    Map<String, dynamic> queryparams,
  }); //{
  // Optional Params to be added to the request if required.
  //  Map<String, dynamic> queryparams,});

  Future<ServiceListResponse> getLeavesDetails();

  Future<PostResponse> postAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<ServiceResponse> putAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<ServiceResponse> deleteAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<ServiceListResponse> getServiceDashBoardData({
    Map<String, dynamic> queryparams,
  }); 
}
