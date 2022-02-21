part of 'doc_req_by_hr_repository.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class DocReqByHrRepository extends AbstractDocReqByHrRepository {
  final Dio _dio = Dio();

  Future<DocReqByHrResponse> getAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_PERSON_DOCUMENTS_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      return DocReqByHrResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return DocReqByHrResponse.withError("$err");
    }
  }

  @override
  Future<DocReqByHrResponse> deleteAPIData({
    Map<String, dynamic>? queryparams,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<DocReqByHrResponse> postAPIData({
    Map<String, dynamic>? queryparams,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<DocReqByHrResponse> putAPIData({
    Map<String, dynamic>? queryparams,
  }) {
    throw UnimplementedError();
  }
}
