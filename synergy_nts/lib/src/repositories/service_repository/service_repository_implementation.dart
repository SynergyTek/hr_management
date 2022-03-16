// ignore_for_file: avoid_print, annotate_overrides

part of 'abstract_service_repository.dart';

class ServiceRepository extends AbstractServiceRepository {
  final Dio _dio = Dio();

  Future<ServiceListResponse> getServiceHomeListData({
    Map<String, dynamic>? queryparams,
  }) async {
    const String endpoint = APIEndpointConstants.READ_SERVICE_HOME_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      return ServiceListResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return ServiceListResponse.withError("$err");
    }
  }

  Future<ServiceResponse> getServiceDetail({
    Map<String, dynamic>? queryparams,
  }) async {
    const String endpoint = APIEndpointConstants.GET_SERVICE_DETAILS;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

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
  Future<PostResponse> postServiceAPIData({
    Map<String, dynamic>? queryparams,
    required Service service,
  }) async {
    const String endpoint = APIEndpointConstants.MANAGE_SERVICE;
    try {
      Response response = await _dio.post(
        endpoint,
        queryParameters: queryparams ?? {},
        data: jsonEncode(service.toJson()),
      );

      var result = PostResponse.fromJson(
        response.data,
      );

      if (result.isSuccess!) {
        result.messages = 'Item Saved Successfully';
      }

      return result;
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return PostResponse.withError("$err");
    }
  }

  Future<PaginationMyRequestsResponse> getMyRequestList(
      {Map<String, dynamic>? queryparams}) async {
    const String endpoint = APIEndpointConstants.GET_MY_REQUEST_ENDPOINT;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      return PaginationMyRequestsResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return PaginationMyRequestsResponse.withError("$err");
    }
  }
}
