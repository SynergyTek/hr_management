part of 'abstract_task_bloc.dart';

class TaskBloc extends AbstractTaskBloc {
  final TaskRepository? _taskRepository = TaskRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<TaskListResponseModel?> _subjectTaskList =
      BehaviorSubject<TaskListResponseModel?>();

  final BehaviorSubject<TaskResponseModel?> _subjectGetTaskDetails =
      BehaviorSubject<TaskResponseModel?>();

  /// Used to fetch new entries.
  @override
  Future<TaskListResponseModel?> getTaskHomeListData({
    Map<String, dynamic>? queryparams, // String userId,
  }) async {
    TaskListResponseModel? response =
        await _taskRepository!.getTaskHomeListData(
      queryparams: queryparams,
    );
    _subjectTaskList.sink.add(response);
    return response;
  }

  @override
  Future<TaskResponseModel?> getTaskDetails({
    String? templateCode,
    String? taskId,
    String? userId,
  }) async {
    Map<String, dynamic> queryparams = {};

    if (taskId != null && taskId.isNotEmpty) queryparams["taskId"] = taskId;

    if (templateCode != null && templateCode.isNotEmpty) {
      queryparams["templateCode"] = templateCode;
    }

    queryparams["userId"] = userId;

    TaskResponseModel? response = await _taskRepository!.getTaskDetailsData(
      queryparams: queryparams,
    );
    _subjectGetTaskDetails.sink.add(response);
    return response;
  }

  /// Used to create new entries.
  @override
  Future<PostResponse> postData({
    required TaskModel taskModel,
  }) async {
    PostResponse? response = await _taskRepository!.postAPIData(
      taskModel: taskModel,
    );

    // Reload task home if draft/submit is successful
    if (response.isSuccess!) {
      // TODO: Kanishk.
      // _subjectTaskList.sink.add(null);

      Map<String, dynamic> queryparams = {};
      queryparams['userId'] = taskModel.activeUserId;

      getTaskHomeListData(queryparams: queryparams);
    }

    return response;
  }

  @override
  Future<TaskListResponseModel?> getTaskDashBoardData({
    Map<String, dynamic>? queryparams,
    String? taskListStatus,
    String? requestBy,
    // String userId,
  }) async {
    TaskListResponseModel? response =
        await _taskRepository!.getTaskDashBoardData(
      queryparams: queryparams,
      taskListStatus: taskListStatus,
      requestBy: requestBy,
    );
    _subjectTaskList.sink.add(response);

    return response;
  }

  @override
  loadServiceAdhocTaskData({
    Map<String, dynamic>? queryparams,
    String? taskListStatus,
  }) async {
    TaskListResponseModel response =
        await _taskRepository!.loadServiceAdhocTaskData(
      queryparams: queryparams,
    );
    _subjectTaskList.sink.add(response);
  }

  @override
  Future<String> lockTaskData({
    Map<String, dynamic>? queryparams,
  }) async {
    String? response = await _taskRepository!.lockTaskData(
      queryparams: queryparams,
    );
    return response;
  }

  @override
  Future<String> releaseTaskData({
    Map<String, dynamic>? queryparams,
  }) async {
    String? response = await _taskRepository!.releaseTaskData(
      queryparams: queryparams,
    );
    return response;
  }

  @override
  Future<PostResponse> startTaskData({
    Map<String, dynamic>? queryparams,
  }) async {
    PostResponse? response = await _taskRepository!.startTaskData(
      queryparams: queryparams,
    );
    return response;
  }

  dispose() {
    _subjectTaskList.close();
    _subjectGetTaskDetails.close();
  }

  BehaviorSubject<TaskListResponseModel?> get subjectTaskList =>
      _subjectTaskList;
  BehaviorSubject<TaskResponseModel?> get subjectGetTaskDetails =>
      _subjectGetTaskDetails;
}

final taskBloc = TaskBloc();
