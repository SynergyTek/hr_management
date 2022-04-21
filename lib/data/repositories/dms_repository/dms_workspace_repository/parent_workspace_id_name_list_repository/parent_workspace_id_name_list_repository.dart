import 'package:dio/dio.dart';
import 'package:hr_management/data/models/dms/parent_workspace_id_name_list_model/parent_workspace_id_name_list_response.dart';
import 'package:meta/meta.dart';

import '../../../../../constants/api_endpoints.dart';

part 'parent_workspace_id_name_list_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractParentWorkspaceIdNameListRepository {
  AbstractParentWorkspaceIdNameListRepository();

  Future<ParentWorkspaceIdNameListResponse> getParentWorkspace({
    Map<String, dynamic>? queryparams,
    required String legalEntity,
    required String id,
  });
}
