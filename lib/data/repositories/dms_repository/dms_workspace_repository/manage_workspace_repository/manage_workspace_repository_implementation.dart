part of 'manage_workspace_repository.dart';

class ManageWorkspaceRepository extends AbstractManageWorkspaceRepository {
  final Dio _dio = Dio();

  Future getAPIData({
    @required WorkspaceViewModel model,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.GET_MANAGE_WORKSPACE_DATA,
        queryParameters: {
          'model': model,
        },
      );

      return WorkspaceViewResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return WorkspaceViewResponse.withError("$err");
    }
  }
}
