part of 'service_repository.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class ServiceRepository extends AbstractServiceRepository {
  final Dio _dio = Dio();

  Future<ServiceResponse> getAPIData(templatecode)//{
    // Optional Params to be added to the request if required.
    //Map<String, dynamic> queryparams,templatecode}
   async {
    final String endpoint = APIEndpointConstants.GET_SERVICE_DETAILS;
    // final String endpoint =
    //   'https://webapidev.aitalkx.com/nts/query/GetServiceDetails?templateCode='+templatecode+'&userid=45bba746-3309-49b7-9c03-b5793369d73c';

    try {
      Response response = await _dio.get(
        endpoint,
        //queryParameters: queryparams ?? {},
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
  Future<PostResponse> postAPIData({
    Map<String, dynamic> queryparams,
    @required ServiceResponseModel serviceResponseModel,
  }) async {
    final String endpoint = APIEndpointConstants.MANAGE_SERVICE;
    try {
      Response response = await _dio.post(
        endpoint,
        queryParameters: queryparams ?? {},
        data: jsonEncode(serviceResponseModel.toJson()) ?? {},
      );

      print("response: ${response.data}");

      var result = PostResponse.fromJson(
        response.data,
      );
      // TODO: response parsing
      return result;
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return PostResponse.withError("$err");
    }
  }

  @override
  Future<ServiceResponse> putAPIData({Map<String, dynamic> queryparams}) {
    throw UnimplementedError();
  }
}
