part of 'note_index_repository.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class NoteIndexRepository extends AbstractNoteIndexRepository {
  final Dio _dio = Dio();

  Future<NoteIndexResponse> getAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_NOTE_INDEX_PAGE_GRID_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      return NoteIndexResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return NoteIndexResponse.withError("$err");
    }
  }

  @override
  Future<NoteIndexResponse> deleteAPIData({
    Map<String, dynamic> queryparams,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<NoteIndexResponse> postAPIData({
    Map<String, dynamic> queryparams,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<NoteIndexResponse> putAPIData({
    Map<String, dynamic> queryparams,
  }) {
    throw UnimplementedError();
  }
}
