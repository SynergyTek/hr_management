part of 'abstract_note_repository.dart';

class NoteRepository extends AbstractNoteRepository {
  final Dio _dio = Dio();

  @override
  Future<NoteResponse> getNoteDetail({
    Map<String, dynamic>? queryparams,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.GET_NOTE_DETAILS,
        queryParameters: queryparams ?? {},
      );

      return NoteResponse.fromJson(
        response.data,
      );
    } catch (err, _) {
      return NoteResponse.withError("$err");
    }
  }

  @override
  Future<NoteListResponse> getNoteList({
    Map<String, dynamic>? queryparams,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.READ_NOTE_HOME_DATA,
        queryParameters: queryparams ?? {},
      );
      //print(response.data);
      return NoteListResponse.fromJson(
        response.data,
      );
    } catch (err, _) {
      return NoteListResponse.withError("$err");
    }
  }

  @override
  Future<NoteListResponse> getNoteDashBoardData({
    Map<String, dynamic>? queryparams,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.READ_NOTE_DASHBOARD_DATA,
        queryParameters: queryparams ?? {},
      );
      //print(response.data);
      return NoteListResponse.fromJson(
        response.data,
      );
    } catch (err, _) {
      return NoteListResponse.withError("$err");
    }
  }

  @override
  Future<PostResponse> postNoteAPIData({
    required NoteModel note,
    Map<String, dynamic>? queryparams,
  }) async {
    try {
      Response response = await _dio.post(
        APIEndpointConstants.MANAGE_NOTE,
        queryParameters: queryparams ?? {},
        data: jsonEncode(note.toJson()),
      );

      var result = PostResponse.fromJson(
        response.data,
      );

      if (result.isSuccess!) {
        if (note.noteStatusCode == 'NOTE_STATUS_DRAFT') {
          result.messages = 'Note saved as Draft';
        } else if (note.noteStatusCode == 'NOTE_STATUS_INPROGRESS') {
          result.messages = 'Note Saved Successfully';
        } else if (note.noteStatusCode == 'NOTE_STATUS_COMPLETE') {
          result.messages = 'Note Completed successfully';
        }
      }

      return result;
    } catch (err, _) {
      return PostResponse.withError("$err");
    }
  }
}
