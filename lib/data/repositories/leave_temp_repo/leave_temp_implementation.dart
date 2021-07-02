part of 'leave_temp_repo.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class LeaveTempRepository extends AbstractLeaveTempRepository {
  final Dio _dio = Dio();

  Future<LeaveTempResponse> getAllowedTemplateData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  }) async {
    try {
      // TODO: Need to send this via UI and not hardcode here!
      queryparams = {
        // 'api_key': APIEndpointConstants.API_KEY,
        // 'language': 'en-US',
        // 'page': 1
      };

      Response response = await _dio.get(
        APIEndpointConstants.GET_ALLOWED_TEMPLATES,
        queryParameters: queryparams ?? {},
      );
      print("DIO Response: ${response.data} ${response.data.runtimeType}");
      return LeaveTempResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: ${APIEndpointConstants.GET_ALLOWED_TEMPLATES}.");

      print("Stack: \n\n\n $stacktrace");
      print("Err: \n\n\n $err");

      return LeaveTempResponse.withError("$err");
    }
  }

  @override
  Future<LeaveTempResponse> deleteAPIData({Map<String, dynamic> queryparams}) {
    throw UnimplementedError();
  }

  @override
  Future<LeaveTempResponse> postAPIData({Map<String, dynamic> queryparams}) {
    throw UnimplementedError();
  }

  @override
  Future<LeaveTempResponse> putAPIData({Map<String, dynamic> queryparams}) {
    throw UnimplementedError();
  }
}
