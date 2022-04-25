import 'package:dio/dio.dart';
import 'package:hr_management/data/models/note/note_model.dart';
import 'package:meta/meta.dart';

import '../../../../../constants/api_endpoints.dart';

part 'manage_new_folder_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractManageNewFolderRepository {
  AbstractManageNewFolderRepository();

  Future<bool> postManageNewFolder({
    required Map<String, dynamic> queryparams,
  });

  Future<NoteModel> getCreateFolder({
    required Map<String, dynamic> queryparams,
  });
}
