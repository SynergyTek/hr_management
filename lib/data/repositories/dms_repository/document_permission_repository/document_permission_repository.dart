import 'package:dio/dio.dart';
import 'package:hr_management/data/models/dms/dms_document_action_model/dms_document_action_response.dart';
import 'package:hr_management/data/models/dms/permission/permission_response_model.dart';
import '../../../../../constants/api_endpoints.dart';
part 'document_permission_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractDocumentPermissionRepository {
  AbstractDocumentPermissionRepository();

  Future<PermissionResponse> getViewPermissionData(
      {Map<String, dynamic> queryparams});

  Future<PermissionResponse> getPermissionDetails({
    Map<String, dynamic> queryparams,
  });

  Future<PermissionResponse> disableParentPermission({
    Map<String, dynamic> queryparams,
  });
}
