part of 'abstract_task_repo.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class TaskRepository extends AbstractTaskRepository {
  final Dio _dio = Dio();

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
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

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
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return TaskResponseModel.withError("$err");
    }
  }

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
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return TaskListResponseModel.withError("$err");
    }
  }

  Future<TaskListResponseModel> loadServiceAdhocTaskData({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.LOAD_SERVICE_ADHOC_TASK_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      //print(response.data);
      return TaskListResponseModel.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return TaskListResponseModel.withError("$err");
    }
  }

  @override
  Future<TaskResponseModel> deleteAPIData({Map<String, dynamic>? queryparams}) {
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
        data: jsonEncode(taskModel.toJson()) ?? {},
      );

      var result = PostResponse.fromJson(
        response.data,
      );

      if (taskModel.taskStatusCode == 'TASK_STATUS_DRAFT')
        result.isSuccess!
            ? result.messages = 'Task saved as draft'
            : result.messages = 'Unable to save task';
      else if (taskModel.taskStatusCode == 'TASK_STATUS_INPROGRESS')
        result.isSuccess!
            ? result.messages = 'Task submitted successfully'
            : result.messages = 'Unable to submit task';
      else if (taskModel.taskStatusCode == 'TASK_STATUS_COMPLETE')
        result.isSuccess!
            ? result.messages = 'Task completed successfully'
            : result.messages = 'Unable to complete task';
      else if (taskModel.taskStatusCode == 'TASK_STATUS_REJECT')
        result.isSuccess!
            ? result.messages = 'Task rejected successfully'
            : result.messages = 'Unable to reject task';

      return result;
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return PostResponse.withError("$err");
    }
  }

  @override
  Future<TaskResponseModel> putAPIData({Map<String, dynamic>? queryparams}) {
    throw UnimplementedError();
  }
}
