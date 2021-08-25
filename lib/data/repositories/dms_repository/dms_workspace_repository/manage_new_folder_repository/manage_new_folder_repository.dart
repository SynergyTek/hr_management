import 'package:dio/dio.dart';
import 'package:hr_management/data/models/note/note_model.dart';
import 'package:meta/meta.dart';

import '../../../../../constants/api_endpoints.dart';

part 'manage_new_folder_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractManageNewFolderRepository {
  AbstractManageNewFolderRepository();

  Future<dynamic> postAPIData({
    @required NoteModel model,
  });
}