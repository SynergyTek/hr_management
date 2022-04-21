import 'package:dio/dio.dart';
import 'package:hr_management/data/models/dms/workspace_view_model/workspace_view_model.dart';
import 'package:hr_management/data/models/dms/workspace_view_model/workspace_view_response.dart';
import 'package:meta/meta.dart';

import '../../../../../constants/api_endpoints.dart';

part 'manage_workspace_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractManageWorkspaceRepository {
  AbstractManageWorkspaceRepository();

  Future<dynamic> postAPIData({
    required Map<String, dynamic> queryparams,
  });

  Future<WorkspaceViewModel?> getCreateWorkspace({
    required Map<String, dynamic> queryparams,
  });

  Future<WorkspaceViewResponse> getWorkspaceData({
    required Map<String, dynamic> queryparams,
  });

  Future<WorkspaceViewModel> deleteWorkspace({
    required Map<String, dynamic> queryparams,
  });
}
