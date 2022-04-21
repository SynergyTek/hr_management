part of 'parent_workspace_id_name_list_repository.dart';

class ParentWorkspaceIdNameListRepository
    extends AbstractParentWorkspaceIdNameListRepository {
  final Dio _dio = Dio();

  Future<ParentWorkspaceIdNameListResponse> getParentWorkspace({
    Map<String, dynamic>? queryparams,
    String? legalEntity,
    String? id,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.GET_PARENT_WORKSPACE_ID_NAME_LIST_DATA,
        queryParameters: (legalEntity == null ||
                legalEntity.isEmpty ||
                id == null ||
                id.isEmpty)
            ? queryparams
            : {
                'legalEntity': legalEntity,
                'id': id,
              },
      );

      return ParentWorkspaceIdNameListResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return ParentWorkspaceIdNameListResponse.withError("$err");
    }
  }
}
