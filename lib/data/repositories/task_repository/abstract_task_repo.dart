import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:hr_management/data/models/task_models/task_list_resp_model.dart';
import 'package:hr_management/data/models/task_models/task_model.dart';
import '../../models/api_models/post_response_model.dart';
import '../../models/task_models/task_response_model.dart';

import '../../../constants/api_endpoints.dart';
import 'package:dio/dio.dart';

part 'task_repo.dart';

// Overview of the repository class.
abstract class AbstractTaskRepository {
  AbstractTaskRepository();

  Future<TaskListResponseModel> getTaskHomeListData(); 

  Future<TaskListResponseModel> getTaskDashBoardData({
    Map<String, dynamic> queryparams,
  });

  Future<PostResponse> postAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<TaskResponseModel> putAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<TaskResponseModel> deleteAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });
}
