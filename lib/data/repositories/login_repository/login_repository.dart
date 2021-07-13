import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hr_management/constants/api_endpoints.dart';
import 'package:hr_management/data/models/login_models/login_request_model.dart';
import 'package:hr_management/data/models/login_models/login_response.dart';

part 'login_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractLoginRepository {
  AbstractLoginRepository();

  Future<LoginResponse> postAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });
}
