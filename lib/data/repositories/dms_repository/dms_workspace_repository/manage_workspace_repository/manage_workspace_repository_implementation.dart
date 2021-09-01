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
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return err;
    }
  }

  Future<WorkspaceViewModel> getAPIData({
    Map<String, dynamic> queryparams,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.GET_CREATE_WORKSPACE_DATA,
        queryParameters: queryparams ?? {},
      );

      var result = WorkspaceViewModel.fromJson(response.data);

      return result;
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace");
      print("Error: $err");

      return err;
    }
  }
}
