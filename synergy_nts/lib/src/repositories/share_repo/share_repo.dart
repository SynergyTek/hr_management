part of 'abstract_share_repo.dart';

class ShareRepository extends AbstractShareRepository {
  final Dio _dio = Dio();

  @override
  Future<ServiceSharedDataResponse> getServiceSharedData({
    Map<String, dynamic>? queryparams,
  }) async {
    const String endpoint = APIEndpointConstants.GET_SERVICE_SHARED_DATA;

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

  @override
  Future<TaskSharedDataResponse> getTaskSharedData({
    Map<String, dynamic>? queryparams,
  }) async {
    const String endpoint = APIEndpointConstants.GET_TASK_SHARED_DATA;

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

  @override
  Future<NoteSharedDataResponse> getNoteSharedData({
    Map<String, dynamic>? queryparams,
  }) async {
    const String endpoint = APIEndpointConstants.GET_NOTE_SHARED_DATA;

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

  @override
  Future deleteServiceShared({
    Map<String, dynamic>? queryparams,
  }) async {
    const String endpoint = APIEndpointConstants.DELETE_SERVICE_SHARED;
  }

  @override
  Future deleteTaskShared({
    Map<String, dynamic>? queryparams,
  }) async {
    const String endpoint = APIEndpointConstants.DELETE_TASK_SHARED;
  }

  @override
  Future deleteNoteShared({
    Map<String, dynamic>? queryparams,
  }) async {
    const String endpoint = APIEndpointConstants.DELETE_NOTE_SHARED;
  }

  @override
  Future<PostResponse> postShareService({
    Map<String, dynamic>? queryparams,
    required ServiceSharePostModel data,
  }) async {
    const String endpoint = APIEndpointConstants.POST_SHARE_SERVICE;
    try {
      Response response = await _dio.post(
        endpoint,
        queryParameters: queryparams ?? {},
        data: jsonEncode(data.toJson()),
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

  @override
  Future<PostResponse> postShareTask({
    Map<String, dynamic>? queryparams,
    required TaskSharePostModel data,
  }) async {
    const String endpoint = APIEndpointConstants.POST_SHARE_TASK;
    try {
      Response response = await _dio.post(
        endpoint,
        queryParameters: queryparams ?? {},
        data: jsonEncode(data.toJson()),
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

  @override
  Future<PostResponse> postShareNote({
    Map<String, dynamic>? queryparams,
    required NoteSharePostModel data,
  }) async {
    const String endpoint = APIEndpointConstants.POST_SHARE_NOTE;
    try {
      Response response = await _dio.post(
        endpoint,
        queryParameters: queryparams ?? {},
        data: jsonEncode(data.toJson()),
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
