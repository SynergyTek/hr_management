part of 'parent_workspace_id_name_list_repository.dart';

class ParentWorkspaceIdNameListRepository
    extends AbstractParentWorkspaceIdNameListRepository {
  final Dio _dio = Dio();

  Future getAPIData({
    @required String legalEntity,
    @required String id,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.GET_PARENT_WORKSPACE_ID_NAME_LIST_DATA,
        queryParameters: {
          'legalEntity': legalEntity,
          'id': id,
        },
      );
      return true;
      // return AttachmentNTSResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");
      return false;

      // return AttachmentNTSResponse.withError("$err");
    }
  }
}
