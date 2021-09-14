part of 'document_permission_repository.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class DocumentPermissionRepository
    extends AbstractDocumentPermissionRepository {
  final Dio _dio = Dio();

  Future<PermissionResponse> getViewPermissionData({
    Map<String, dynamic> queryparams,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.GET_VIEW_PERMISSIONS_DATA,
        queryParameters: queryparams ?? {},
      );

      return PermissionResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace");
      print("Error: $err");

      return PermissionResponse.withError(err);
    }
  }

  Future<PermissionResponse> getPermissionDetails({
    Map<String, dynamic> queryparams,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.GET_PERMISSIONS_DETAILS,
        queryParameters: queryparams ?? {},
      );

      return PermissionResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace");
      print("Error: $err");

      return PermissionResponse.withError(err);
    }
  }

  Future<PermissionResponse> disableParentPermission({
    Map<String, dynamic> queryparams,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.DISABLE_PARENT_PERMISSIONS,
        queryParameters: queryparams ?? {},
      );

      return PermissionResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace");
      print("Error: $err");

      return PermissionResponse.withError(err);
    }
  }
}
