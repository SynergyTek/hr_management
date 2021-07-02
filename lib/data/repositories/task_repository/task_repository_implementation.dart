part of 'task_repository.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class TaskRepository extends AbstractTaskRepository {
  final Dio _dio = Dio();

  Future<TaskResponseModel> getTaskHomeListData(
      {Map<String, dynamic> queryparams}) async {
    final String endpoint = APIEndpointConstants.GET_TASK_HOME_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        //queryParameters: queryparams ?? {},
      );

      // return TaskResponseModel.fromJson(
      //   response.data,
      // );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return TaskResponseModel.withError("$err");
    }
  }

  @override
  Future<TaskResponseModel> deleteAPIData({Map<String, dynamic> queryparams}) {
    throw UnimplementedError();
  }

  @override
  Future<PostResponse> postAPIData({
    Map<String, dynamic> queryparams,
    @required TaskResponseModel taskResponseModel,
  }) async {
    // final String endpoint = APIEndpointConstants.MANAGE_Task;
    try {
      //   Response response = await _dio.post(
      //     endpoint,
      //     queryParameters: queryparams ?? {},
      //     data: jsonEncode(TaskResponseModel.toJson()) ?? {},
      //   );

      //   print("response: ${response.data}");

      //   var result = PostResponse.fromJson(
      //     response.data,
      //   );
      //   // TODO: response parsing
      //   return result;
    } catch (err, stacktrace) {
      // print(
      //     "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return PostResponse.withError("$err");
    }
  }

  @override
  Future<TaskResponseModel> putAPIData({Map<String, dynamic> queryparams}) {
    throw UnimplementedError();
  }
}
