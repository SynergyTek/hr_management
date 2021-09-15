import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hr_management/data/models/dms/permission/permission_model.dart';
import 'package:hr_management/data/models/dms/permission/permission_response_model.dart';
import '../../../../../constants/api_endpoints.dart';
part 'document_permission_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractDocumentPermissionRepository {
  AbstractDocumentPermissionRepository();

  Future<ViewPermissionResponse> getViewPermissionData(
      {Map<String, dynamic> queryparams});

  Future<PermissionResponse> getPermissionDetails({
    Map<String, dynamic> queryparams,
  });

  Future<PermissionResponse> disableParentPermission({
    Map<String, dynamic> queryparams,
  });

  Future<bool> deletePermission({
    Map<String, dynamic> queryparams,
  });

  Future<PermissionResponse> savePermission({
    Permission permissionModel,
  });
}
