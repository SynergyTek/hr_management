import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:hr_management/data/enums/enums.dart';
import '../../models/api_models/post_response_model.dart';
import '../../models/service_models/service.dart';

import '../../models/service_models/service_response.dart';

import '../../../constants/api_endpoints.dart';
import 'package:dio/dio.dart';

part 'nts_comments_repo.dart';

// Overview of the repository class.
abstract class AbstractNTSCommentsRepository {
  AbstractNTSCommentsRepository();

  Future<ServiceResponse> getCommentsData({
    Map<String, dynamic> queryparams,
  }); 


  Future<PostResponse> postCommentData({
    Map<String, dynamic> queryparams,
    NTSType ntsType,
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
