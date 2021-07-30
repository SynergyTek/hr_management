import 'package:hr_management/data/models/share_models/note_shared_models/note_shared_data_model.dart';

class NoteSharedDataResponse {
  bool isSuccess;
  List<NoteSharedDataModel> list;
  String error;

  NoteSharedDataResponse({this.list});

  NoteSharedDataResponse.fromJson(List response)
      : list =
            (response).map((i) => new NoteSharedDataModel.fromJson(i)).toList();

  NoteSharedDataResponse.withError(String errorValue)
      : list = null,
        error = errorValue;
}
