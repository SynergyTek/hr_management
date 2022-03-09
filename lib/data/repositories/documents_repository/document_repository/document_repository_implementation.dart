part of 'document_repository.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class DocumentRepository extends AbstractDocumentRepository {
  final Dio _dio = Dio();

  Future<DocumentResponse> getAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_PERSON_PROFILE_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      return DocumentResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return DocumentResponse.withError("$err");
    }
  }

  @override
  Future<DocumentResponse> deleteAPIData({
    Map<String, dynamic>? queryparams,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<DocumentResponse> postAPIData({
    Map<String, dynamic>? queryparams,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<DocumentResponse> putAPIData({
    Map<String, dynamic>? queryparams,
  }) {
    throw UnimplementedError();
  }
}
