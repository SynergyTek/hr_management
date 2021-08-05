part of 'abstract_help_desk_repo.dart';

class HelpDeskRepository extends AbstractHelpDeskRepository {
  final Dio _dio = Dio();

  Future<HelpDeskDashboardResponse> getHelpdeskDashboardData(
      {Map<String, dynamic> queryparams}) async {
    if (queryparams == null) queryparams = Map();

    String userId = await getUserId();
    if (userId != null) queryparams['userid'] = userId;
    final String endpoint = APIEndpointConstants.HELPDESK_DASHBOARD;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      //print(response.data);
      return HelpDeskDashboardResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return HelpDeskDashboardResponse.withError("$err");
    }
  }

  Future<ReadHelpDeskRequestClosedResponse> getHelpDeskRequestClosedData(
      {Map<String, dynamic> queryparams}) async {
    if (queryparams == null) queryparams = Map();

    String userId = await getUserId();
    if (userId != null) queryparams['userid'] = userId;
    final String endpoint = APIEndpointConstants.READ_HELP_DESK_REQUEST_CLOSED;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      //print(response.data);
      return ReadHelpDeskRequestClosedResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return ReadHelpDeskRequestClosedResponse.withError("$err");
    }
  }
}
