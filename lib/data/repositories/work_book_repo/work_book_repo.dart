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

  Future<PostResponse> postManageMoveToParent({
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

      print("response: ${response.data}");

      var result = PostResponse.fromJson(
        response.data,
      );

      if (result.isSuccess!) {
        if (note.noteStatusCode == 'NOTE_STATUS_DRAFT')
          result.messages = 'Note saved as Draft';
        else if (note.noteStatusCode == 'NOTE_STATUS_INPROGRESS')
          result.messages = 'Note Saved Successfully';
        else if (note.noteStatusCode == 'NOTE_STATUS_COMPLETE')
          result.messages = 'Note Completed successfully';
      }

      return result;
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return PostResponse.withError("$err");
    }
  }
}
