import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hr_management/data/models/dms/dms_files_response.dart';
import 'package:hr_management/data/models/dms/dms_post_model.dart';

import '../../../constants/api_endpoints.dart';

part 'dms_repo.dart';

abstract class AbstractDMSRepository {
  AbstractDMSRepository();

  Future<DMSFilesResponse> getDMSFilesData(
      {Map<String, dynamic>? queryparams, required DmsPostModel dmsPostModel});

  Future<DMSFilesResponse> getDMSFilesChildData(
      {Map<String, dynamic>? queryparams, required DmsPostModel dmsPostModel});
}
