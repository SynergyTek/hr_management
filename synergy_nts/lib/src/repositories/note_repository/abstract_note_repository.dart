import 'dart:convert';

import 'package:dio/dio.dart';

import '../../constants/api_endpoints.dart';
import '../../models/note_models/note_model.dart';
import '../../models/note_models/note_response.dart';
import '../../models/post_model/post_response.dart';

part 'note_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractNoteRepository {
  AbstractNoteRepository();

  Future<NoteResponse> getNoteDetail({
    Map<String, dynamic>? queryparams,
  });

  Future<NoteListResponse> getNoteList({
    Map<String, dynamic>? queryparams,
  });

  Future<NoteListResponse> getNoteDashBoardData({
    Map<String, dynamic>? queryparams,
  });

  Future<PostResponse> postNoteAPIData({
    required NoteModel note,
    Map<String, dynamic>? queryparams,
  });
}
