part of 'abstract_share_repo.dart';

class ShareRepository extends AbstractShareRepository {
  final Dio _dio = Dio();

  Future<ServiceSharedDataResponse> getServiceSharedData({
    Map<String, dynamic> queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_SERVICE_SHARED_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      return ServiceSharedDataResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return ServiceSharedDataResponse.withError("$err");
    }
  }

  Future<TaskSharedDataResponse> getTaskSharedData({
    Map<String, dynamic> queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_TASK_SHARED_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      return TaskSharedDataResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return TaskSharedDataResponse.withError("$err");
    }
  }

  Future<NoteSharedDataResponse> getNoteSharedData({
    Map<String, dynamic> queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_NOTE_SHARED_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      return NoteSharedDataResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return NoteSharedDataResponse.withError("$err");
    }
  }

  Future deleteServiceShared({
    Map<String, dynamic> queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.DELETE_SERVICE_SHARED;
  }

  Future deleteTaskShared({
    Map<String, dynamic> queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.DELETE_TASK_SHARED;
  }

  Future deleteNoteShared({
    Map<String, dynamic> queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.DELETE_NOTE_SHARED;
  }

  Future<PostResponse> postShareService({
    Map<String, dynamic> queryparams,
    ServiceSharePostModel data,
  }) async {
    final String endpoint = APIEndpointConstants.POST_SHARE_SERVICE;
    try {
      Response response = await _dio.post(
        endpoint,
        queryParameters: queryparams ?? {},
        data: jsonEncode(data.toJson()) ?? {},
      );

      var result = PostResponse.fromJson(
        response.data,
      );

      return result;
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return PostResponse.withError("$err");
    }
  }

  Future<PostResponse> postShareTask({
    Map<String, dynamic> queryparams,
    TaskSharePostModel data,
  }) async {
    final String endpoint = APIEndpointConstants.POST_SHARE_TASK;
    try {
      Response response = await _dio.post(
        endpoint,
        queryParameters: queryparams ?? {},
        data: jsonEncode(data.toJson()) ?? {},
      );

      var result = PostResponse.fromJson(
        response.data,
      );

      return result;
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return PostResponse.withError("$err");
    }
  }

  Future<PostResponse> postShareNote({
    Map<String, dynamic> queryparams,
    NoteSharePostModel data,
  }) async {
    final String endpoint = APIEndpointConstants.POST_SHARE_NOTE;
    try {
      Response response = await _dio.post(
        endpoint,
        queryParameters: queryparams ?? {},
        data: jsonEncode(data.toJson()) ?? {},
      );

      var result = PostResponse.fromJson(
        response.data,
      );

      return result;
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return PostResponse.withError("$err");
    }
  }
}
