import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../../../constants/api_endpoints.dart';

part 'parent_workspace_id_name_list_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractParentWorkspaceIdNameListRepository {
  AbstractParentWorkspaceIdNameListRepository();

  Future<dynamic> getAPIData({
    @required String legalEntity,
    @required String id,
  });
}
