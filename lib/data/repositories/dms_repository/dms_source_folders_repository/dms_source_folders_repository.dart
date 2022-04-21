import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../../constants/api_endpoints.dart';
import '../../../models/dms/dms_source_folder_model/dms_source_folder_response.dart';

part 'dms_source_folders_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractDMSSourceFolderRepository {
  AbstractDMSSourceFolderRepository();

  Future<DMSSourceFolderResponse> getDMSSourceFolderData({
    Map<String, dynamic>? queryparams,
  });

  Future<DMSSourceFolderResponse> getDMSChildFolderData({
    Map<String, dynamic>? queryparams,
  });

  Future<DMSSourceFolderResponse> getDMSChildFolderAndDocumentsData({
    Map<String, dynamic>? queryparams,
  });
}
