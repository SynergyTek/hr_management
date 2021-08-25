part of 'manage_workspace_repository.dart';

class ManageWorkspaceRepository extends AbstractManageWorkspaceRepository {
  final Dio _dio = Dio();

  Future postAPIData({
    @required Map<String, dynamic> queryparams,
  }) async {
    print(APIEndpointConstants.POST_MANAGE_WORKSPACE_DATA);

    try {
      Response response = await _dio.post(
        APIEndpointConstants.POST_MANAGE_WORKSPACE_DATA,
        queryParameters: queryparams,
      );

      return response.data;
      // return WorkspaceViewResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      // return WorkspaceViewResponse.withError("$err");
      return err;
    }
  }
}
