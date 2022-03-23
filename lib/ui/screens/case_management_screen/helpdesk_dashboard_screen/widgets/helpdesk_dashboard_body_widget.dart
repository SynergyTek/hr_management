import 'package:flutter/material.dart';
import 'package:hr_management/ui/screens/case_management_screen/helpdesk_dashboard_screen/widgets/open_requests_by_category_widget.dart';
import 'package:hr_management/ui/screens/case_management_screen/helpdesk_dashboard_screen/widgets/open_requests_widget.dart';
import 'package:hr_management/ui/screens/case_management_screen/helpdesk_dashboard_screen/widgets/requests_received_in_last_20_days_widget.dart';
import 'package:hr_management/ui/screens/case_management_screen/helpdesk_dashboard_screen/widgets/requests_summary_widget.dart';
import 'package:hr_management/ui/screens/case_management_screen/helpdesk_dashboard_screen/widgets/sla_violated_requests_widget.dart';
import 'package:hr_management/ui/screens/case_management_screen/helpdesk_dashboard_screen/widgets/sla_violation_by_category_widget.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';

import '../../../../../themes/theme_config.dart';
import 'requests_approaching_sla_violations_widget.dart';
import 'requests_by_category_widget.dart';
import 'requests_closed_in_last_20_days_widget.dart';
import 'task_summary_widget.dart';

class CaseManagementHelpdeskDashboardBodyWidget extends StatefulWidget {
  CaseManagementHelpdeskDashboardBodyWidget();

  @override
  _CaseManagementHelpdeskDashboardBodyWidgetState createState() =>
      _CaseManagementHelpdeskDashboardBodyWidgetState();
}

class _CaseManagementHelpdeskDashboardBodyWidgetState
    extends State<CaseManagementHelpdeskDashboardBodyWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: _bodyWidget(),
    );
  }

  Widget _bodyWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _eachListTile(
          title: "Requests Summary",
          listTileOnTap: () => _requestsSummary(),
        ),
        _eachListTile(
          title: "Requests By Category",
          listTileOnTap: () => _requestsByCategoryOnTap(),
        ),
        _eachListTile(
          title: "Requests Received In Last 20 Days",
          listTileOnTap: () => _requestsReceivedInLast20Days(),
        ),
        _eachListTile(
          title: "Requests Closed In Last 20 Days",
          listTileOnTap: () => _requestsClosedInLast20Days(),
        ),
        _eachListTile(
          title: "Open Requests",
          listTileOnTap: () => _openRequests(),
        ),
        _eachListTile(
          title: "Open Requests by Category",
          listTileOnTap: () => _openRequestsByCategory(),
        ),
        _eachListTile(
          title: "SLA Violation by Category",
          listTileOnTap: () => _slaViolationByCategoryOnTap(),
        ),
        _eachListTile(
          title: "Requests Approching SLA Violations",
          listTileOnTap: () => _requestsApprochingSLAViolations(),
        ),
        _eachListTile(
          title: "SLA Violated Requests",
          listTileOnTap: () => _slaViolationedRequested(),
        ),
        _eachListTile(
          title: "Task Summary",
          listTileOnTap: () => _taskSummaryOnTap(),
        ),
      ],
    );
  }

  Widget _eachListTile({
    String? title,
    Function? listTileOnTap,
  }) {
    return Card(
      child: ListTile(
        title: Text(title ?? "-"),
        trailing: Icon(Icons.chevron_right),
        onTap: () => listTileOnTap!(),
      ),
    );
  }

  _push({
    required String title,
    required Widget child,
  }) =>
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
            appBar: AppbarWidget(
              title: title,
            ),
            body: child,
          ),
        ),
      );

  void _requestsSummary() => _push(
        title: "Requests Summary",
        child: RequestsSummaryWidget(),
      );

  void _requestsByCategoryOnTap() => _push(
        title: "Requests By Category",
        child: RequestByCategoryWidget(),
      );

  void _requestsReceivedInLast20Days() => _push(
        title: "Requests Received In Last 20 Days",
        child: RequestsReceivedInLast20DaysWidget(),
      );

  void _requestsClosedInLast20Days() => _push(
        title: "Requests Closed In Last 20 Days",
        child: RequestsClosedInLast20DaysWidget(),
      );

  void _openRequests() => _push(
        title: "Open Requests",
        child: OpenRequestsWidget(),
      );

  void _openRequestsByCategory() => _push(
        title: "Open Requests By Category",
        child: OpenRequestsByCategoryWidget(),
      );

  void _requestsApprochingSLAViolations() => _push(
        title: "Requests Approching SLA Violations",
        child: RequestsApproachingSLAViolationsWidget(),
      );

  void _slaViolationedRequested() => _push(
        title: "SLA Violated Requests",
        child: SLAViolatedRequestsWidget(),
      );

  void _slaViolationByCategoryOnTap() => _push(
        title: "SLA Violation By Category",
        child: SLAViolationByCategoryWidget(),
      );

  void _taskSummaryOnTap() => _push(
        title: "Task Summary",
        child: TaskSummaryWidget(),
      );
}
