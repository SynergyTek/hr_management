import '../../models/post_model/post_response.dart';
import '../../models/task_models/task_list_resp_model.dart';
import '../../models/task_models/task_model.dart';
import '../../models/task_models/task_response_model.dart';
import '../../repositories/task_repository/abstract_task_repo.dart';
import 'package:rxdart/subjects.dart';

export '../../models/post_model/post_response.dart';
export '../../models/service_models/service_model.dart';
export '../../models/task_models/task_list_model.dart';
export '../../models/task_models/task_list_resp_model.dart';
export '../../models/task_models/task_model.dart';
export '../../models/task_models/task_response_model.dart';
export '../../repositories/task_repository/abstract_task_repo.dart';

part 'task_bloc_implementation.dart';

abstract class AbstractTaskBloc {
  /// getTaskHomeListData: function to get(Read) Task data from an API
  /// @Params:
  ///   queryparams: It takes a Map of queryparams to fetch the data from API.

  Future<TaskListResponseModel?> getTaskHomeListData({
    Map<String, dynamic>? queryparams, // String userId,
  });

  /// getTaskDetails: function to get(Read) TaskDetails data from an API
  /// @Params:
  ///   userId: It takes a String of UserID to fetch the data.
  ///   templateCode: It takes a String of templateCode to fetch the data.
  ///   taskId: It takes a String of taskId to fetch the data.

  Future<TaskResponseModel?> getTaskDetails({
    String? templateCode,
    String? taskId,
    String? userId,
  });

  /// postData: function to post(Create) Task data in an API
  /// @Params:
  ///   taskModel: It takes a DataModel for modelling the data.
  Future<PostResponse> postData({
    required TaskModel taskModel,
  });

  /// getTaskDashBoardData: function to get(Read) TaskDashBoard data from an API
  /// @Params:
  ///   queryparams: It takes a Map of queryparams to fetch the data from API.
  ///   taskListStatus: It takes a String of taskListStatus to fetch the data.
  ///   requestBy: It takes a String of requestBy to fetch the data.
  Future<TaskListResponseModel?> getTaskDashBoardData({
    Map<String, dynamic>? queryparams,
    String? taskListStatus,
    String? requestBy,
    // String userId,
  });

  /// loadServiceAdhocTaskData: function to get lockTask data from the API
  /// @Params:
  ///   queryparams: It takes a Map of queryparams to fetch the data from API.
  ///   taskListStatus: It takes a String of taskListStatus to fetch the data.
  loadServiceAdhocTaskData({
    Map<String, dynamic>? queryparams,
    String? taskListStatus,
  });

  /// lockTaskData: function to get lockTask data from the API
  /// @Params:
  ///   queryparams: It takes a Map of queryparams to fetch the data from API.
  Future<String> lockTaskData({
    Map<String, dynamic>? queryparams,
  });

  /// releaseTaskData: function to get releaseTask data from the API
  /// @Params:
  ///   queryparams: It takes a Map of queryparams to fetch the data from API.
  Future<String> releaseTaskData({
    Map<String, dynamic>? queryparams,
  });

  /// startTaskData: function to get startTask data from the API
  /// @Params:
  ///   queryparams: It takes a Map of queryparams to fetch the data from API.
  Future<PostResponse> startTaskData({
    Map<String, dynamic>? queryparams,
  });
}
