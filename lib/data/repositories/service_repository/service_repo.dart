part of 'abstract_service_repo.dart';

class ServiceRepository extends AbstractServiceRepository {
  final Dio _dio = Dio();

  Future<ServiceListResponse> getServiceHomeListData({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.READ_SERVICE_HOME_DATA;

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
    final String endpoint = APIEndpointConstants.GET_SERVICE_DETAILS;

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

  // Future<ServiceListResponse> getLeavesDetails({
  //   Map<String, dynamic>? queryparams,
  // }) async {
  //   final String endpoint = APIEndpointConstants.LEAVE_DETAILS;

  //   try {
  //     Response response = await _dio.get(
  //       endpoint,
  //       queryParameters: queryparams ?? {},
  //     );

  //     return ServiceListResponse.fromJson(
  //       response.data,
  //     );
  //   } catch (err, stacktrace) {
  //     print("Stacktrace: $stacktrace \nError: $err");

  //     return ServiceListResponse.withError("$err");
  //   }
  // }

  Future<ServiceSummaryResponse> getServiceSummaryData({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_SERVICE_SUMMARY;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      
      return ServiceSummaryResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return ServiceSummaryResponse.withError("$err");
    }
  }

  Future<ServiceListResponse> getReadServiceData({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_READ_SERVICE_DATA;

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

  Future<ServiceMapResponse> getReadServiceListCount({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_READ_SERVICE_LIST_COUNT;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      return ServiceMapResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return ServiceMapResponse.withError("$err");
    }
  }

  Future<ServiceListResponse> getServiceDashBoardData({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.READ_SERVICE_DASHBOARD_DATA;

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

  @override
  Future<ServiceResponse> deleteAPIData({Map<String, dynamic>? queryparams}) {
    throw UnimplementedError();
  }

  @override
  Future<PostResponse> postAPIData({
    Map<String, dynamic>? queryparams,
    required Service service,
  }) async {
    final String endpoint = APIEndpointConstants.MANAGE_SERVICE;
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
        // if (service.serviceStatusCode == 'SERVICE_STATUS_DRAFT')
        //   result.messages = 'Leave saved as Draft';
        // else if (service.serviceStatusCode == 'SERVICE_STATUS_INPROGRESS') {
        //   if (service.templateCode == 'LEAVE_CANCEL')
        //     result.messages = 'Leave Cancelled Successfully';
        //   else
        //     result.messages = 'Leave Applied Successfully';
        // } else
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

  @override
  Future<ServiceResponse> putAPIData({Map<String, dynamic>? queryparams}) {
    throw UnimplementedError();
  }
}
