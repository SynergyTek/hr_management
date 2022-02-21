part of 'helpdesk_sla_violation_repository.dart';

class HelpdeskSLAViolationRepository
    extends AbstractHelpdeskSLAViolationRepository {
  final Dio _dio = Dio();

  Future<CaseManagementResponse> getAPIData({
    Map<String, dynamic>? queryparams,
  }) async {
    //
    String endpoint = APIEndpointConstants.GET_HELPDESK_SLA_VIOLATION;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

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
