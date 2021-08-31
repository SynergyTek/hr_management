import 'package:hr_management/data/models/note/note_model.dart';
import 'package:meta/meta.dart';
import 'package:hr_management/data/repositories/dms_repository/dms_workspace_repository/manage_new_folder_repository/manage_new_folder_repository.dart';
import 'package:rxdart/rxdart.dart';

class DMSManageNewFolderBloc {
  final DMSManageNewFolderRepository _apiRepository =
      DMSManageNewFolderRepository();

  final BehaviorSubject _subject = BehaviorSubject();

  postAPIData({
    @required Map<String, dynamic> queryparams,
  }) async {
    dynamic response = await _apiRepository.postAPIData(
      queryparams: queryparams,
    );

    _subject.sink.add(response);
  }

  getAPIData({
    Map<String, dynamic> queryparams,
  }) async {
    NoteModel response = await _apiRepository.getAPIData(
      queryparams: queryparams,
    );

    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject get subject => _subject;
}

final dmsManageNewFolderBloc = DMSManageNewFolderBloc();
