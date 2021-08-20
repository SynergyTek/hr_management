import 'package:dio/dio.dart';
import 'package:hr_management/data/models/dms/dms_post_model.dart';
import 'package:hr_management/data/models/dms/file_operation_model/file_operation_model.dart';
import 'package:meta/meta.dart';

import '../../../../constants/api_endpoints.dart';

part 'dms_crud_note_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractDMSCRUDNoteRepository {
  AbstractDMSCRUDNoteRepository();

  Future<bool> getArchiveNoteAPIData({
    @required String id,
  });

  Future<bool> getCopyNoteAPIData({
    @required String sourceId,
    @required String targetId,
    @required String userId,
  });

  Future<bool> getCreateNoteAPIData({
    @required String sourceId,
    @required String targetId,
    @required String userId,
  });

  Future<bool> getDeleteNoteAPIData({
    @required String id,
  });

  Future<bool> getMoveNoteAPIData({
    @required String sourceId,
    @required String targetId,
  });

  Future<bool> getRenameFilesAPIData({
    @required DmsPostModel model,
  });

  Future<bool> postSearchFilesAPIData({
    @required DmsPostModel model,
  });
}
