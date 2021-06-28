part of 'service_repository.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class ServiceRepository extends AbstractServiceRepository {
  final Dio _dio = Dio();
  final String endpoint = APIEndpointConstants.GET_SERVICE_DETAILS;

  Future<ServiceResponse> getAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  }) async {
    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      // print("DIO Response: ${response.data.runtimeType}");

      return ServiceResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return ServiceResponse.withError("$err");
    }
  }

  @override
  Future<ServiceResponse> deleteAPIData({Map<String, dynamic> queryparams}) {
    throw UnimplementedError();
  }

  @override
  Future<ServiceResponse> postAPIData({Map<String, dynamic> queryparams}) {
    throw UnimplementedError();
  }

  @override
  Future<ServiceResponse> putAPIData({Map<String, dynamic> queryparams}) {
    throw UnimplementedError();
  }
}
