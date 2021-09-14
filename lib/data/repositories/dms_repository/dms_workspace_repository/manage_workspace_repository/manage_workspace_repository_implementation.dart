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
      return null;
      // return err;
    }
  }

  Future<WorkspaceViewResponse> getWorkspaceData({
    Map<String, dynamic> queryparams,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.GET_WORKSPACE_DATA,
        queryParameters: queryparams ?? {},
      );

      WorkspaceViewResponse result =
          WorkspaceViewResponse.fromJson(response.data);

      return result;
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace");
      print("Error: $err");

      return err;
    }
  }

  Future<WorkspaceViewModel> deleteWorkspace({
    Map<String, dynamic> queryparams,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.DELETE_WORKSPACE,
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
