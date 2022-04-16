import 'package:hr_management/data/models/task_models/task_summary_response_model.dart';
import 'package:rxdart/subjects.dart';

import '../../../data/models/api_models/post_response_model.dart';
import '../../../data/models/task_models/task_list_resp_model.dart';
import '../../../data/models/task_models/task_model.dart';
import '../../../data/models/task_models/task_response_model.dart';
import '../../../data/repositories/task_repository/abstract_task_repo.dart';

class TaskBloc {
  final TaskRepository _taskRepository = TaskRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<TaskListResponseModel?> _subjectTaskList =
      BehaviorSubject<TaskListResponseModel?>();
  final BehaviorSubject<TaskResponseModel?> _subjectGetTaskDetails =
      BehaviorSubject<TaskResponseModel?>();
  final BehaviorSubject<TaskSummaryResponse?> _subjectTaskSummaryList =
      BehaviorSubject<TaskSummaryResponse?>();
  final BehaviorSubject<TaskListDynamicResponse?> _subjectReadTaskListCount =
      BehaviorSubject<TaskListDynamicResponse?>();
  final BehaviorSubject<TaskListResponseModel?> _subjectReadTaskData =
      BehaviorSubject<TaskListResponseModel?>();

  /// Used to fetch new entries.
  getTaskHomeListData({
    Map<String, dynamic>? queryparams, // String userId,
  }) async {
    TaskListResponseModel response = await _taskRepository.getTaskHomeListData(
      queryparams: queryparams,
    );
    _subjectTaskList.sink.add(response);
  }

  getTaskDetails({
    String? templateCode,
    String? taskId,
    String? userId,
  }) async {
    Map<String, dynamic> queryparams = Map();

    if (taskId != null && taskId.isNotEmpty) queryparams["taskId"] = taskId;
    if (templateCode != null && templateCode.isNotEmpty)
      queryparams["templateCode"] = templateCode;

    queryparams["userId"] = userId;

    TaskResponseModel response = await _taskRepository.getTaskDetailsData(
      queryparams: queryparams,
    );
    _subjectGetTaskDetails.sink.add(response);
  }

  /// Used to create new entries.
  Future<PostResponse> postData({
    required TaskModel taskModel,
  }) async {
    PostResponse response = await _taskRepository.postAPIData(
      taskModel: taskModel,
    );

    // Reload task home if draft/submit is successful
    if (response.isSuccess!) {
      _subjectTaskList.sink.add(null);

      Map<String, dynamic> queryparams = Map();
      queryparams['userid'] = taskModel.activeUserId;
      queryparams['userId'] = taskModel.activeUserId;

      getTaskHomeListData(queryparams: queryparams);
    }

    return response;
  }

  getTaskDashBoardData({
    Map<String, dynamic>? queryparams,
    String? taskListStatus,
    String? requestBy, // String userId,
  }) async {
    TaskListResponseModel response = await _taskRepository.getTaskDashBoardData(
      queryparams: queryparams,
      taskListStatus: taskListStatus,
      requestBy: requestBy,
    );
    _subjectTaskList.sink.add(response);
  }

  getTaskSummary({
    Map<String, dynamic>? queryparams,
  }) async {
    TaskSummaryResponse response = await _taskRepository.getTaskSummaryData(
      queryparams: queryparams,
    );
    _subjectTaskSummaryList.sink.add(response);
  }

  getReadTaskListCount({
    Map<String, dynamic>? queryparams,
  }) async {
    TaskListDynamicResponse response =
        await _taskRepository.getReadTaskListCount(
      queryparams: queryparams,
    );
    _subjectReadTaskListCount.sink.add(response);
  }

  getReadTaskData({
    Map<String, dynamic>? queryparams,
  }) async {
    TaskListResponseModel response = await _taskRepository.getReadTaskData(
      queryparams: queryparams,
    );
    _subjectReadTaskData.sink.add(response);
  }

  loadServiceAdhocTaskData({
    Map<String, dynamic>? queryparams,
    String? taskListStatus,
  }) async {
    TaskListResponseModel response =
        await _taskRepository.loadServiceAdhocTaskData(
      queryparams: queryparams,
    );
    _subjectTaskList.sink.add(response);
  }

  /// Used to update an existing entry.
  putData() async {
    // Update here
    // ...

    // Update the list (in UI) with the getTask call.
    // getData();
  }

  /// Used to delete a particular entry.
  deleteData() async {
    // Delete here
    // ...

    // Update the list (in UI) with the getTask call.
    // getData();
  }

  dispose() {
    _subjectTaskList.close();
    _subjectGetTaskDetails.close();
    _subjectTaskSummaryList.close();
    _subjectReadTaskListCount.close();
    _subjectReadTaskData.close();
  }

  BehaviorSubject<TaskListResponseModel?> get subjectTaskList =>
      _subjectTaskList;
  BehaviorSubject<TaskResponseModel?> get subjectGetTaskDetails =>
      _subjectGetTaskDetails;
  BehaviorSubject<TaskSummaryResponse?> get subjectTaskSummaryList =>
      _subjectTaskSummaryList;
  BehaviorSubject<TaskListDynamicResponse?> get subjectReadTaskListCount =>
      _subjectReadTaskListCount;
  BehaviorSubject<TaskListResponseModel?> get subjectReadTaskData =>
      _subjectReadTaskData;
}

final taskBloc = TaskBloc();
