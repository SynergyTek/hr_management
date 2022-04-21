import 'dart:async';

import 'package:hr_management/data/models/note/note_model.dart';
import 'package:hr_management/data/repositories/dms_repository/dms_workspace_repository/manage_new_folder_repository/manage_new_folder_repository.dart';
import 'package:rxdart/rxdart.dart';

class DMSManageNewFolderBloc {
  final DMSManageNewFolderRepository _apiRepository =
      DMSManageNewFolderRepository();

  final BehaviorSubject _subject = BehaviorSubject();

  Future<bool> postManageNewFolder({
    required Map<String, dynamic> queryparams,
  }) async {
    bool response = await (_apiRepository.postManageNewFolder(
      queryparams: queryparams,
    ) as FutureOr<bool>);

    _subject.sink.add(response);
    return response;
  }

  Future<NoteModel> getCreateFolder({
    Map<String, dynamic>? queryparams,
  }) async {
    NoteModel response = await _apiRepository.getCreateFolder(
      queryparams: queryparams,
    );

    _subject.sink.add(response);

    return response;
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject get subject => _subject;
}

final dmsManageNewFolderBloc = DMSManageNewFolderBloc();
