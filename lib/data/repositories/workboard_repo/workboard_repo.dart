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

  Future<WorkBoardMapResponseModel> getCreateWorkboardList({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.CREATE_WORKBOARD;

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

  Future<WorkBoardSectionMapResponseModel> getCreateSectionList({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_WORKBOARD_SECTION;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      return WorkBoardSectionMapResponseModel.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return WorkBoardSectionMapResponseModel.withError("$err");
    }
  }

  Future<WorkBoardSectionMapResponseModel> getManageWorkBoardDetailsList({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.MANAGE_WORKBOARD_DETAILS;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      return WorkBoardSectionMapResponseModel.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return WorkBoardSectionMapResponseModel.withError("$err");
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

  Future<WorkBoardMapResponseModel> getDuplicateWorkBoard({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_DUPLICATE_WORKBOARD;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      print(response.data);
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

  Future<AddContentWorkBoardMapResponseModel> getItemWorkBoardContent({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_ADD_WORKBOARD_CONTENT;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      print(response.data);
      return AddContentWorkBoardMapResponseModel.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return AddContentWorkBoardMapResponseModel.withError("$err");
    }
  }

  Future<AddContentWorkBoardMapResponseModel> getCopyMoveItems({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_COPY_MOVE_ITEMS;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      print(response.data);
      return AddContentWorkBoardMapResponseModel.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return AddContentWorkBoardMapResponseModel.withError("$err");
    }
  }

  Future<WorkBoardPostResponse> postDuplicateWorkBoard({
    WorkboardModel? workBoardModel,
  }) async {
    final String endpoint = APIEndpointConstants.POST_DUPLICATE_WORKBOARD;

    try {
      Response response = await _dio.post(
        endpoint,
        data: jsonEncode(workBoardModel?.toJson()),
      );
      print("response: ${response.data}");
      return WorkBoardPostResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return WorkBoardPostResponse.withError("$err");
    }
  }

  Future<WorkBoardPostResponseContent> postDuplicateItem({
    Map<String, dynamic>? queryParams,
  }) async {
    final String endpoint = APIEndpointConstants.POST_DUPLICATE_ITEM;

    try {
      Response response = await _dio.post(
        endpoint,
        queryParameters: queryParams,
      );
      print("response: ${response.data}");
      return WorkBoardPostResponseContent.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return WorkBoardPostResponseContent.withError("$err");
    }
  }

  Future<WorkBoardPostResponseContent> postWorkBoardContent({
    AddContentWorkBoardModel? addContentWorkBoardModel,
  }) async {
    final String endpoint = APIEndpointConstants.POST_WORKBOARD_CONTENT;

    try {
      Response response = await _dio.post(
        endpoint,
        data: jsonEncode(addContentWorkBoardModel?.toJson()),
      );
      print("response: ${response.data}");
      return WorkBoardPostResponseContent.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return WorkBoardPostResponseContent.withError("$err");
    }
  }

  Future<WorkBoardPostResponseContent> postUpdateWorkBoardSectionAndItem({
    WorkboardModel? workboardModel,
  }) async {
    final String endpoint =
        APIEndpointConstants.POST_UPDATE_WORKBOARD_SECTIONS_AND_ITEMS;

    try {
      Response response = await _dio.post(
        endpoint,
        data: jsonEncode(workboardModel?.toJson()),
      );
      print("response: ${response.data}");
      return WorkBoardPostResponseContent.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return WorkBoardPostResponseContent.withError("$err");
    }
  }

  Future<WorkBoardPostResponseContent> postSharingMoveCopy({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint =
        APIEndpointConstants.POST_MANAGE_ITEM_SHARING_COPY_MOVE;

    try {
      Response response = await _dio.post(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      print("response: ${response.data}");
      return WorkBoardPostResponseContent.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return WorkBoardPostResponseContent.withError("$err");
    }
  }

  Future<WorkBoardPostResponse> postManageWorkBoard({
    WorkboardModel? workBoardModel,
  }) async {
    final String endpoint = APIEndpointConstants.POST_MANAGE_WORKBOARD;

    try {
      Response response = await _dio.post(
        endpoint,
        data: jsonEncode(workBoardModel?.toJson()),
      );
      print("response: ${response.data}");
      return WorkBoardPostResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return WorkBoardPostResponse.withError("$err");
    }
  }

  Future<WorkBoardPostResponseSection> postManageWorkBoardSection({
    WorkBoardSectionModel? workBoardSectionModel,
  }) async {
    final String endpoint = APIEndpointConstants.POST_MANAGE_WORKBOARD_SECTION;

    try {
      Response response = await _dio.post(
        endpoint,
        data: jsonEncode(workBoardSectionModel?.toJson()),
      );
      print("response: ${response.data}");
      return WorkBoardPostResponseSection.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return WorkBoardPostResponseSection.withError("$err");
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
