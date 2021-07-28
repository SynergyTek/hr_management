import 'package:dio/dio.dart';
import '../../../../constants/api_endpoints.dart';
import '../../../models/documents_models/note_index_models/note_index_response.dart';

part './note_index_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractNoteIndexRepository {
  AbstractNoteIndexRepository();

  Future<NoteIndexResponse> getAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<NoteIndexResponse> postAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<NoteIndexResponse> putAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<NoteIndexResponse> deleteAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });
}
