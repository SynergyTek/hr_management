part of 'manage_workspace_repository.dart';

class DMSManageWorkspaceRepository extends AbstractManageWorkspaceRepository {
  final Dio _dio = Dio();

  Future postAPIData({
    @required Map<String, dynamic> queryparams,
  }) async {
    try {
      Response response = await _dio.post(
        APIEndpointConstants.POST_MANAGE_WORKSPACE_DATA,
        data: queryparams,
      );

      print(response.data);

      return response.data;
      // return WorkspaceViewResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      // return WorkspaceViewResponse.withError("$err");
      return err;
    }
  }
}
