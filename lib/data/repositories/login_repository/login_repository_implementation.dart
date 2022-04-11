part of 'login_repository.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class LoginRepository extends AbstractLoginRepository {
  final Dio _dio = Dio();

  @override
  Future<LoginAPIResponse> postAPIData({
    Map<String, dynamic>? queryparams,
    LoginRequestModel? loginResponseModel,
  }) async {
    final String endpoint = APIEndpointConstants.MANAGE_LOGIN;
    try {
      Response response = await _dio.post(
        endpoint,
        queryParameters: queryparams ?? {},
        // data: jsonEncode(loginResponseModel.toJson()) ?? {},
      );

      // TODO: response parsing
      return LoginAPIResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return LoginAPIResponse.withError("$err");
    }
  }

  Future<PortalViewResponse> getPortalList({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.PORTAL_LIST_BY_EMAIL;
    try {
      Response response = await _dio.post(
        endpoint,
        queryParameters: queryparams ?? {},
        // data: jsonEncode(loginResponseModel.toJson()) ?? {},
      );

      // TODO: response parsing
      return PortalViewResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return PortalViewResponse.withError("$err");
    }
  }
}
