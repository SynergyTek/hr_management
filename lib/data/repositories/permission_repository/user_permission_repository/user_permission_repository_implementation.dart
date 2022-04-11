part of 'abstract_user_permission_repository.dart.dart';

class UserPermissionRepository extends AbstractUserPermissionRepository {
  final Dio _dio = Dio();

  Future<UserPermissionResponse?> getUserPermission({
    Map<String, dynamic>? queryparams,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.GET_READ_USER_PERMISSION_DATA_ENDPOINT,
        queryParameters: queryparams ?? {},
      );

      return UserPermissionResponse.fromJson(
        response.data,
      );
    } catch (err, _) {
      return UserPermissionResponse.withError(
        "An error occurred, please try again later.",
      );
    }
  }
}
