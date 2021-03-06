part of 'abstract_note_repo.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class NoteRepository extends AbstractNoteRepository {
  final Dio _dio = Dio();

  Future<NoteResponse> getNoteDetail({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_NOTE_DETAILS;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      return NoteResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return NoteResponse.withError("$err");
    }
  }

  Future<NoteListResponse> getNoteList({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.READ_NOTE_HOME_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      
      return NoteListResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return NoteListResponse.withError("$err");
    }
  }

  Future<NoteListResponse> getNoteDashBoardData({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.READ_NOTE_DASHBOARD_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      
      return NoteListResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return NoteListResponse.withError("$err");
    }
  }

  @override
  Future<NoteResponse> deleteNoteAPIData({Map<String, dynamic>? queryparams}) {
    throw UnimplementedError();
  }

  @override
  Future<PostResponse> postNoteAPIData({
    required NoteModel note,
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.MANAGE_NOTE;
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

  @override
  Future<NoteResponse> putNoteAPIData({Map<String, dynamic>? queryparams}) {
    throw UnimplementedError();
  }
}
