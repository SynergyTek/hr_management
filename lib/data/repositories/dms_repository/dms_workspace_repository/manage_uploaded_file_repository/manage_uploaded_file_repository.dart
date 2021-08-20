import 'package:dio/dio.dart';
import 'package:hr_management/data/models/note/note_model.dart';
import 'package:meta/meta.dart';

import '../../../../../constants/api_endpoints.dart';

part 'manage_uploaded_file_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractManageUploadedFileRepository {
  AbstractManageUploadedFileRepository();

  Future<dynamic> postAPIData({
    @required NoteModel model,
  });
}
