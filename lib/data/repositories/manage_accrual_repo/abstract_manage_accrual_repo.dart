import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:hr_management/data/models/manage_accural/manage_accrual_res_model.dart';
import '../../models/note/note_model.dart';
import '../../models/note/note_response.dart';
import '../../models/api_models/post_response_model.dart';

import '../../../constants/api_endpoints.dart';
import 'package:dio/dio.dart';

part 'manage_accrual_repo.dart';

// Overview of the repository class.
abstract class AbstractManageAccrualRepository {
  AbstractManageAccrualRepository();

  Future<ManageAccrualResponse> getManageAccrual({
    Map<String, dynamic> queryparams,
  });
}
