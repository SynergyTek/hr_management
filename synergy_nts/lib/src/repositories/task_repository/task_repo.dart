part of 'abstract_task_repo.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class TaskRepository extends AbstractTaskRepository {
  final Dio _dio = Dio();

  @override
  Future<TaskListResponseModel> getTaskHomeListData({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_TASK_HOME_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      return TaskListResponseModel.fromJson(
        response.data,
      );
    } catch (err, _) {
      return TaskListResponseModel.withError("$err");
    }
  }

  Future<TaskResponseModel> getTaskDetailsData({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_TASK_DETAILS;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      //print(response.data);
      return TaskResponseModel.fromJson(
        response.data,
      );
    } catch (err, _) {
      return TaskResponseModel.withError("$err");
    }
  }

  @override
  Future<TaskListResponseModel> getTaskDashBoardData({
    Map<String, dynamic>? queryparams,
    String? taskListStatus,
    String? requestBy,
  }) async {
    String endpoint = '';
    if (taskListStatus == 'InProgress') {
      endpoint = APIEndpointConstants.READ_TASK_DATA_IN_PROGRESS;
    } else if (taskListStatus == 'Overdue') {
      endpoint = APIEndpointConstants.READ_TASK_DATA_OVERDUE;
    } else if (taskListStatus == 'Complete') {
      endpoint = APIEndpointConstants.READ_TASK_DATA_COMPLETED;
    } else {
      endpoint = APIEndpointConstants.READ_TASK_DASHBOARD_DATA;
    }

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      return TaskListResponseModel.fromJson(
        response.data,
      );
    } catch (err, _) {
      return TaskListResponseModel.withError("$err");
    }
  }

  @override
  Future<String> lockTaskData({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.LOCK_TASK;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      if (response.data != null || response.data == 'Success') {
        return 'Task locked successfully.';
      } else {
        return 'Failed to lock task.';
      }
    } catch (err, _) {
      return 'Error Occurred while locking the task';
    }
  }

  @override
  Future<String> releaseTaskData({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.RELEASE_TASK;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      if (response.data != null || response.data == 'Success') {
        return 'Task released successfully.';
      } else {
        return 'Failed to release task.';
      }
    } catch (err, _) {
      return 'Error Occurred while releasing the task';
    }
  }

  @override
  Future<PostResponse> startTaskData({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.START_TASK;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      PostResponse result = PostResponse.fromJson(
        response.data,
      );

      if (result.isSuccess == null || result.isSuccess == false) {
        result.messages = 'Failed to start task.';
        return result;
      } else {
        result.messages = 'Task started successfully.';
        return result;
      }
    } catch (err, s) {
      print(s);
      return PostResponse.withError("$err");
    }
  }

  @override
  Future<TaskResponseModel> deleteAPIData({
    Map<String, dynamic>? queryparams,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<PostResponse> postAPIData({
    Map<String, dynamic>? queryparams,
    required TaskModel taskModel,
  }) async {
    final String endpoint = APIEndpointConstants.MANAGE_TASK;
    try {
      Response response = await _dio.post(
        endpoint,
        queryParameters: queryparams ?? {},
        data: jsonEncode(taskModel.toJson()),
      );

      PostResponse result = PostResponse.fromJson(
        response.data,
      );

      if (result.isSuccess == null) {
        result.messages = 'Task failed successfully.';
        return result;
      }

      if (taskModel.taskStatusCode == 'TASK_STATUS_DRAFT') {
        result.isSuccess!
            ? result.messages = 'Task saved as draft'
            : result.messages = 'Unable to save task';
      } else if (taskModel.taskStatusCode == 'TASK_STATUS_INPROGRESS') {
        result.isSuccess!
            ? result.messages = 'Task submitted successfully'
            : result.messages = 'Unable to submit task';
      } else if (taskModel.taskStatusCode == 'TASK_STATUS_COMPLETE') {
        result.isSuccess!
            ? result.messages = 'Task completed successfully'
            : result.messages = 'Unable to complete task';
      } else if (taskModel.taskStatusCode == 'TASK_STATUS_REJECT') {
        result.isSuccess!
            ? result.messages = 'Task rejected successfully'
            : result.messages = 'Unable to reject task';
      }

      return result;
    } catch (err, _) {
      return PostResponse.withError("$err");
    }
  }

  @override
  Future<TaskResponseModel> putAPIData({
    Map<String, dynamic>? queryparams,
  }) {
    throw UnimplementedError();
  }
}
