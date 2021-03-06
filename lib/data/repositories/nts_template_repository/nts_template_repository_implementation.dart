part of 'nts_template_repository.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class NTSTemplateRepository extends AbstractNTSTemplateRepository {
  final Dio _dio = Dio();

  Future<NTSTemplateResponse> getAPIData({
    Map<String, dynamic>? queryparams,
  }) async {
    String endpoint = APIEndpointConstants.GET_ALLOWED_TEMPLATES;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      return NTSTemplateResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return NTSTemplateResponse.withError("$err");
    }
  }

  @override
  Future<NTSTemplateResponse> deleteAPIData(
      {Map<String, dynamic>? queryparams}) {
    // TODO: implement deleteAPIData
    throw UnimplementedError();
  }

  @override
  Future<NTSTemplateResponse> postAPIData({Map<String, dynamic>? queryparams}) {
    // TODO: implement postAPIData
    throw UnimplementedError();
  }

  @override
  Future<NTSTemplateResponse> putAPIData({Map<String, dynamic>? queryparams}) {
    // TODO: implement putAPIData
    throw UnimplementedError();
  }
}
