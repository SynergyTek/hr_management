import 'package:dio/dio.dart';
import 'package:hr_management/data/models/workboard_model/workboard_response_model.dart';

import '../../../constants/api_endpoints.dart';
import '../../models/task_models/task_list_resp_model.dart';

part 'workboard_repo.dart';

// Overview of the repository class.
abstract class AbstractWorkboardRepository {
  AbstractWorkboardRepository();

  Future<WorkBoardResponseModel> getWorkboardList({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });
  Future<WorkBoardResponseModel> getCreateWorkboardList({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });
  Future<WorkBoardBoolResponseModel> getOpenCloseWorkboard({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });
  Future<WorkBoardMapResponseModel> getManageWorkBoardDetailsList({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });
  Future<WorkBoardResponseModel> getChooseTemplate({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });
  Future<TaskListResponseModel> getTaskDashBoardData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });
}
