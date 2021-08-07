import 'help_desk_dashboard_model.dart';

class HelpDeskDashboardResponse {
  HelpDeskDashboardModel data;
  String error;

  HelpDeskDashboardResponse({this.data});

  HelpDeskDashboardResponse.fromJson(Map<String, dynamic> response)
      : data = HelpDeskDashboardModel.fromJson(response);

  HelpDeskDashboardResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
