part of 'person_documents_repository.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class PersonDocumentsRepository extends AbstractPersonDocumentsRepository {
  final Dio _dio = Dio();

  Future<PersonDocumentsResponse> getAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_PERSON_DOCUMENTS_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      return PersonDocumentsResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return PersonDocumentsResponse.withError("$err");
    }
  }

  @override
  Future<PersonDocumentsResponse> deleteAPIData({
    Map<String, dynamic> queryparams,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<PersonDocumentsResponse> postAPIData({
    Map<String, dynamic> queryparams,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<PersonDocumentsResponse> putAPIData({
    Map<String, dynamic> queryparams,
  }) {
    throw UnimplementedError();
  }
}
