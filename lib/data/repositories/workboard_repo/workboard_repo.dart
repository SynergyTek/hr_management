part of 'abstract_workboard_repo.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class WorkboardRepository extends AbstractWorkboardRepository {
  final Dio _dio = Dio();

  Future<WorkBoardResponseModel> getWorkboardList({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_WORKBOARD_DASHBOARD_LIST;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      return WorkBoardResponseModel.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return WorkBoardResponseModel.withError("$err");
    }
  }

  Future<WorkBoardBoolResponseModel> getOpenCloseWorkboard({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.OPEN_CLOSE_WORKBOARD;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      return WorkBoardBoolResponseModel.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return WorkBoardBoolResponseModel.withError("$err");
    }
  }

  Future<WorkBoardResponseModel> getCreateWorkboardList({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.CREATE_WORKBOARD;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      return WorkBoardResponseModel.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return WorkBoardResponseModel.withError("$err");
    }
  }

  Future<WorkBoardMapResponseModel> getManageWorkBoardDetailsList({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.MANAGE_WORKBOARD_DETAILS;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      return WorkBoardMapResponseModel.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return WorkBoardMapResponseModel.withError("$err");
    }
  }

  Future<WorkBoardResponseModel> getChooseTemplate({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.CHOOSE_TEMPLATE;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      return WorkBoardResponseModel.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return WorkBoardResponseModel.withError("$err");
    }
  }

  Future<TaskListResponseModel> getTaskDashBoardData({
    Map<String, dynamic>? queryparams,
  }) async {
    String endpoint = APIEndpointConstants.READ_WORKBOARD_TASK_DATA;
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
}
