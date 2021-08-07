import 'package:dio/dio.dart';
import 'package:hr_management/constants/api_endpoints.dart';
import 'package:hr_management/data/models/help_desk_models/help_desk_dashboard_response.dart';
import 'package:hr_management/data/models/help_desk_models/read_help_desk_request_closed_response.dart';

part 'help_desk_repo.dart';

abstract class AbstractHelpDeskRepository {
  AbstractHelpDeskRepository();

  Future<HelpDeskDashboardResponse> getHelpdeskDashboardData();

  Future<ReadHelpDeskRequestClosedResponse> getHelpDeskRequestClosedData();
}
