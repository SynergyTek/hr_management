part of 'abstract_task_repo.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class TaskRepository extends AbstractTaskRepository {
  final Dio _dio = Dio();

  Future<TaskListResponseModel> getTaskHomeListData(
      {Map<String, dynamic> queryparams}) async {
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

  Future<TaskResponseModel> getTaskDetailsData(
      {Map<String, dynamic> queryparams}) async {
    final String endpoint = APIEndpointConstants.GET_TASK_DETAILS;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      print(response.data);
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

  Future<TaskListResponseModel> getTaskDashBoardData(
      {Map<String, dynamic> queryparams}) async {
    final String endpoint = APIEndpointConstants.READ_TASK_DASHBOARD_DATA;

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

  @override
  Future<TaskResponseModel> deleteAPIData({Map<String, dynamic> queryparams}) {
    throw UnimplementedError();
  }

  @override
  Future<PostResponse> postAPIData({
    Map<String, dynamic> queryparams,
    @required TaskModel taskModel,
  }) async {
    final String endpoint = APIEndpointConstants.MANAGE_TASK;
    try {
      Response response = await _dio.post(
        endpoint,
        queryParameters: queryparams ?? {},
        data: jsonEncode(taskModel.toJson()) ?? {},
      );

      print("response: ${response.data}");

      var result = PostResponse.fromJson(
        response.data,
      );
      result.isSuccess
          ? result.messages = 'Task saved successfully'
          : result.messages = 'Unable to submit task';

      return result;
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return PostResponse.withError("$err");
    }
  }

  @override
  Future<TaskResponseModel> putAPIData({Map<String, dynamic> queryparams}) {
    throw UnimplementedError();
  }
}
