part of 'nts_template_tree_list_repository.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class NTSTemplateTreeListRepository
    extends AbstractNTSTemplateTreeListRepository {
  final Dio _dio = Dio();

  Future<NTSTemplateTreeListResponse> getAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  }) async {
    String endpoint = APIEndpointConstants.WORKLIST_DASHBOARD_TREE_LIST_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      return NTSTemplateTreeListResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      return NTSTemplateTreeListResponse.withError("$err");
    }
  }

  @override
  Future<NTSTemplateTreeListResponse> deleteAPIData(
      {Map<String, dynamic>? queryparams}) {
    // TODO: implement deleteAPIData
    throw UnimplementedError();
  }

  @override
  Future<NTSTemplateTreeListResponse> postAPIData(
      {Map<String, dynamic>? queryparams}) {
    // TODO: implement postAPIData
    throw UnimplementedError();
  }

  @override
  Future<NTSTemplateTreeListResponse> putAPIData(
      {Map<String, dynamic>? queryparams}) {
    // TODO: implement putAPIData
    throw UnimplementedError();
  }
}
