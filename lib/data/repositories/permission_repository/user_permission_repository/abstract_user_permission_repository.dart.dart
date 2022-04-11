import 'package:dio/dio.dart';

import '../../../../constants/api_endpoints.dart';
import '../../../models/permissions_model/user_permission_model/user_permission_response.dart';

part 'user_permission_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractUserPermissionRepository {
  AbstractUserPermissionRepository();

  Future<UserPermissionResponse?> getUserPermission({
    Map<String, dynamic>? queryparams,
  });
}
