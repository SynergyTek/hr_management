import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hr_management/data/models/task_models/task_summary_response_model.dart';

import '../../../constants/api_endpoints.dart';
import '../../models/api_models/post_response_model.dart';
import '../../models/task_models/task_list_resp_model.dart';
import '../../models/task_models/task_model.dart';
import '../../models/task_models/task_response_model.dart';

part 'task_repo.dart';

// Overview of the repository class.
abstract class AbstractTaskRepository {
  AbstractTaskRepository();

  Future<TaskListResponseModel> getTaskHomeListData();

  Future<TaskListResponseModel> getTaskDashBoardData({
    Map<String, dynamic>? queryparams,
  });
  Future<TaskSummaryResponse> getTaskSummaryData({
    Map<String, dynamic>? queryparams,
  });
  Future<TaskListDynamicResponse> getReadTaskListCount({
    Map<String, dynamic>? queryparams,
  });
  Future<TaskListResponseModel> getReadTaskData({
    Map<String, dynamic>? queryparams,
  });
  Future loadServiceAdhocTaskData({
    Map<String, dynamic>? queryparams,
  });

  Future<PostResponse> postAPIData({
    Map<String, dynamic>? queryparams,
    required TaskModel taskModel,
  });

  Future<TaskResponseModel> putAPIData({
    Map<String, dynamic>? queryparams,
  });

  Future<TaskResponseModel> deleteAPIData({
    Map<String, dynamic>? queryparams,
  });
}
