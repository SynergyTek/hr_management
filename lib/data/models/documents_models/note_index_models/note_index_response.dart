import 'package:meta/meta.dart';

import 'note_index_model.dart';

class NoteIndexResponse {
  final List<NoteIndexModel> data;
  String error;

  NoteIndexResponse({
    @required this.data,
  });

  NoteIndexResponse.fromJson(List response)
      : data = (response).map((i) => new NoteIndexModel.fromJson(i)).toList();

  NoteIndexResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
