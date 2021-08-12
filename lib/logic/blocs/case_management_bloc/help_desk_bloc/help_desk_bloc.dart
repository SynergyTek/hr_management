import 'package:hr_management/data/models/help_desk_models/help_desk_dashboard_response.dart';
import 'package:hr_management/data/models/help_desk_models/read_help_desk_request_closed_response.dart';
import 'package:hr_management/data/repositories/case_management_repository/help_desk_respository/abstract_help_desk_repo.dart';
import 'package:rxdart/rxdart.dart';

class HelpDeskBloc {
  final HelpDeskRepository _helpDeskRepository = HelpDeskRepository();

  final BehaviorSubject<HelpDeskDashboardResponse> _subjectHelpDeskDashboard =
      BehaviorSubject<HelpDeskDashboardResponse>();

  final BehaviorSubject<ReadHelpDeskRequestClosedResponse>
      _subjectReadHelpDeskRequestClosed =
      BehaviorSubject<ReadHelpDeskRequestClosedResponse>();

  getHelpdeskDashboardData({
    Map<String, dynamic> queryparams,
  }) async {
    HelpDeskDashboardResponse response =
        await _helpDeskRepository.getHelpdeskDashboardData(
      queryparams: queryparams,
    );

    _subjectHelpDeskDashboard.sink.add(response);
  }

  getHelpDeskRequestClosedData({
    Map<String, dynamic> queryparams,
  }) async {
    ReadHelpDeskRequestClosedResponse response =
        await _helpDeskRepository.getHelpDeskRequestClosedData(
      queryparams: queryparams,
    );

    _subjectReadHelpDeskRequestClosed.sink.add(response);
  }

  dispose() {
    _subjectHelpDeskDashboard.close();
    _subjectReadHelpDeskRequestClosed.close();
  }

  BehaviorSubject<HelpDeskDashboardResponse> get subjectHelpDeskDashboard =>
      _subjectHelpDeskDashboard;

  BehaviorSubject<ReadHelpDeskRequestClosedResponse>
      get subjectReadHelpDeskRequestClosed => _subjectReadHelpDeskRequestClosed;
}

final helpDeskBloc = HelpDeskBloc();
