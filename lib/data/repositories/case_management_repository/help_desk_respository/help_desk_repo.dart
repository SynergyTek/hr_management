part of 'abstract_help_desk_repo.dart';

class HelpDeskRepository extends AbstractHelpDeskRepository {
  final Dio _dio = Dio();

  Future<HelpDeskDashboardResponse> getHelpdeskDashboardData({
    Map<String, dynamic> queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.HELPDESK_DASHBOARD;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      return HelpDeskDashboardResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return HelpDeskDashboardResponse.withError("$err");
    }
  }

  Future<ReadHelpDeskRequestClosedResponse> getHelpDeskRequestClosedData({
    Map<String, dynamic> queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.READ_HELP_DESK_REQUEST_CLOSED;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      print(response.data);

      return ReadHelpDeskRequestClosedResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return ReadHelpDeskRequestClosedResponse.withError("$err");
    }
  }
}
