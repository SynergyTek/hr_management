import 'package:flutter/foundation.dart';

import 'note_list_model.dart';
import 'note_model.dart';

/// APIResponse is a high-level model class which we will consist of a
/// list of APIData and error string if our API call gets failed
/// or returns an error in response.
class NoteResponse {
  bool? isSuccess;
  final NoteModel? data;
  String? error;

  NoteResponse({
    required this.data,
  });

  NoteResponse.fromJson(Map<String, dynamic> response)
      : data = NoteModel.fromJson(response);

  NoteResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}

class NoteListResponse {
  bool? isSuccess;
  List<NoteListModel>? list;
  String? error;

  NoteListResponse({
    required this.list,
  });

  NoteListResponse.fromJson(List response)
      : list = (response).map((i) => new NoteListModel.fromJson(i)).toList();

  NoteListResponse.withError(String errorValue)
      : list = null,
        error = errorValue;
}
