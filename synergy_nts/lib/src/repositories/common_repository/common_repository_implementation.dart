part of 'abstract_common_repository.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class CommonRepository extends AbstractCommonRepository {
  final Dio _dio = Dio();

  @override
  Future<CommonListResponse> getLOVIdNameList({
    Map<String, dynamic>? queryparams,
  }) async {
    const String endpoint = APIEndpointConstants.GET_LOV_LIST_ENDPOINT;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      //print(response.data);
      return CommonListResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return CommonListResponse.withError("$err");
    }
  }

  @override
  Future<RequestTypeListResponse> getRequestTypeList({
    Map<String, dynamic>? queryparams,
  }) async {
    const String endpoint = APIEndpointConstants.REQUEST_TYPE_ENDPOINT;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      return RequestTypeListResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return RequestTypeListResponse.withError("$err");
    }
  }

  // Future<ServiceListResponse> getServiceHomeListData(
  //     {Map<String, dynamic>? queryparams}) async {
  //   final String endpoint = APIEndpointConstants.READ_SERVICE_HOME_DATA;

  //   try {
  //     Response response = await _dio.get(
  //       endpoint,
  //       queryParameters: queryparams ?? {},
  //     );
  //     //print(response.data);
  //     return ServiceListResponse.fromJson(
  //       response.data,
  //     );
  //   } catch (err, stacktrace) {
  //     print("Stacktrace: $stacktrace \nError: $err");

  //     return ServiceListResponse.withError("$err");
  //   }
  // }

}
