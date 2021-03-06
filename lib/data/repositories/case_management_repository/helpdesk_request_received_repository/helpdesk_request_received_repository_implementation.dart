part of 'helpdesk_request_received_repository.dart';

class HelpdeskRequestReceivedRepository
    extends AbstractHelpdeskRequestReceivedRepository {
  final Dio _dio = Dio();

  Future<CaseManagementResponse> getAPIData({
    Map<String, dynamic>? queryparams,
  }) async {
    //
    String endpoint = APIEndpointConstants.GET_HELPDESK_REQUEST_RECEIVED;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      print(
          "Helpdesk request received response: ${response.data}, $queryparams");

      return CaseManagementResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");
      return CaseManagementResponse.withError("$err");
    }
  }

  @override
  Future<bool> deleteAPIData({
    Map<String, dynamic>? queryparams,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<CaseManagementResponse> postAPIData({
    Map<String, dynamic>? queryparams,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<CaseManagementResponse> putAPIData({
    Map<String, dynamic>? queryparams,
  }) {
    throw UnimplementedError();
  }
}
