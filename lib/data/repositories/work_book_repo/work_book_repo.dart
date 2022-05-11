part of 'abstract_work_book_repo.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class WorkBookRepository extends AbstractWorkBookRepository {
  final Dio _dio = Dio();

  Future<WorkBookCountResponseModel> getWorkBookCount({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_WORK_BOOK_COUNT_ENDPOINT;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      return WorkBookCountResponseModel.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return WorkBookCountResponseModel.withError("$err");
    }
  }

  Future<AddContentWorkBoardMapResponseModel> getNoteBookHTML({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_NOTE_BOOK_HTML_ENDPOINT;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
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

  Future<GetNoteBookReportResponseModel> getNoteBookReport({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_NOTE_BOOK_REPORT_ENDPOINT;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      return GetNoteBookReportResponseModel.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return GetNoteBookReportResponseModel.withError("$err");
    }
  }

  Future<bool> postManageMoveToParent({
    required NoteModel note,
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.MANAGE_MOVE_TO_PARENT_ENDPOINT;
    try {
      Response response = await _dio.post(
        endpoint,
        queryParameters: queryparams ?? {},
        data: jsonEncode(note.toJson()),
      );

      if (response.data['success'] == true) {
        return true;
      } else {
        return false;
      }
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return false;
    }
  }

  Future<bool> deleteNoteBookItems({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint =
        APIEndpointConstants.DELETE_NOTE_BOOK_ITEMS_ENDPOINT;
    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      if (response.data['success'] == true) {
        return true;
      } else {
        return false;
      }
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return false;
    }
  }

  Future<bool> deleteServiceBookItems({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint =
        APIEndpointConstants.DELETE_SERVICE_BOOK_ITEMS_ENDPOINT;
    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      if (response.data['success'] == true) {
        return true;
      } else {
        return false;
      }
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return false;
    }
  }

  Future<EmailTasksResponseModel> getReadEmailTasks({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.READ_EMAIL_TASKS_ENDPOINT;
    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      return EmailTasksResponseModel.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return EmailTasksResponseModel.withError("$err");
    }
  }

  Future<bool> saveEmailToNtsType({
    // required Map data,
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint =
        APIEndpointConstants.SAVE_EMAIL_TO_NTS_TYPE_ENDPOINT;
    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
        // data: json.encode(data),
      );

      if (response.data['success'] == true) {
        return true;
      } else {
        return false;
      }
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return false;
    }
  }
}
