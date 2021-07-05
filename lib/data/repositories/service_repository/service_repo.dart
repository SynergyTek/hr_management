part of 'abstract_service_repo.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class ServiceRepository extends AbstractServiceRepository {
  final Dio _dio = Dio();

  Future<ServiceResponse> getServiceDetail(templatecode)//{
    // Optional Params to be added to the request if required.
    //Map<String, dynamic> queryparams,templatecode}
   async {
    // final String endpoint = APIEndpointConstants.GET_SERVICE_DETAILS;
    final String endpoint =
      'https://webapidev.aitalkx.com/nts/query/GetServiceDetails?templateCode='+templatecode+'&userid=45bba746-3309-49b7-9c03-b5793369d73c';

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


  Future<ServiceResponse> getLeaves()
    // Optional Params to be added to the request if required.
    //Map<String, dynamic> queryparams,templatecode}
   async {
    final String endpoint = APIEndpointConstants.GET_SERVICE_DETAILS;
  
    try {
      Response response = await _dio.get(
        endpoint,
      );

      return ServiceResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
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
    @required Service Service,
  }) async {
    final String endpoint = APIEndpointConstants.MANAGE_SERVICE;
    try {
      Response response = await _dio.post(
        endpoint,
        queryParameters: queryparams ?? {},
        data: jsonEncode(Service.toJson()) ?? {},
      );

      print("response: ${response.data}");

      var result = PostResponse.fromJson(
        response.data,
      );
    
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
