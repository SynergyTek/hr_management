part of 'dms_legal_entity_repository.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class DMSLegalEntityRepository extends AbstractDMSLegalEntityRepository {
  final Dio _dio = Dio();

  Future<DMSLegalEntityResponse> getAPIData({
    Map<String, dynamic> queryparams,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.GET_LEGAL_ENTITY_DATA,
        queryParameters: queryparams ?? {},
      );

      return DMSLegalEntityResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace");
      print("Error: $err");

      return DMSLegalEntityResponse.withError(err);
    }
  }
}
