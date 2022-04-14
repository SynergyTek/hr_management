part of 'leave_temp_repo.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class LeaveTempRepository extends AbstractLeaveTempRepository {
  final Dio _dio = Dio();

  Future<LeaveTempResponse> getAllowedTemplateData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  }) async {
    try {
      queryparams = {
        "categoryCode": "Leave",
        "templateType": "Service",
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

  Future<HrPolicyDocumentResponse> getHrPolicyDocuments({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  }) async {
    try {
      queryparams = queryparams;

      Response response = await _dio.get(
        APIEndpointConstants.GET_HR_POLICY_DOCUMENTS,
        queryParameters: queryparams ?? {},
      );
      print("DIO Response: ${response.data} ${response.data.runtimeType}");
      return HrPolicyDocumentResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: ${APIEndpointConstants.GET_ALLOWED_TEMPLATES}.");

      print("Stack: \n\n\n $stacktrace");
      print("Err: \n\n\n $err");

      return HrPolicyDocumentResponse.withError("$err");
    }
  }

  @override
  Future<LeaveTempResponse> deleteAPIData({Map<String, dynamic>? queryparams}) {
    throw UnimplementedError();
  }

  @override
  Future<LeaveTempResponse> postAPIData({Map<String, dynamic>? queryparams}) {
    throw UnimplementedError();
  }

  @override
  Future<LeaveTempResponse> putAPIData({Map<String, dynamic>? queryparams}) {
    throw UnimplementedError();
  }
}
