import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:hr_management/data/models/api_models/post_response_model.dart';
import 'package:hr_management/data/models/service_models/service_response_model.dart';

import '../../models/service_models/service_response.dart';

import '../../../constants/api_endpoints.dart';
import 'package:dio/dio.dart';

part 'service_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractServiceRepository {
  AbstractServiceRepository();

  Future<ServiceResponse> getAPIData(String templatecode);//{
    // Optional Params to be added to the request if required.
  //  Map<String, dynamic> queryparams,});

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
}
