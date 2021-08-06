import 'package:flutter/material.dart';
import 'package:hr_management/ui/screens/case_management_screen/helpdesk_dashboard_screen/widgets/open_requests_widget.dart';
import 'package:hr_management/ui/screens/case_management_screen/helpdesk_dashboard_screen/widgets/sla_violation_by_category_widget.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';

import '../../../../../themes/theme_config.dart';
import 'requests_by_category_widget.dart';
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
    String title,
    Function listTileOnTap,
  }) {
    return Card(
      child: ListTile(
        title: Text(title ?? "-"),
        trailing: Icon(Icons.chevron_right),
        onTap: () => listTileOnTap(),
      ),
    );
  }

  _pushReplacement({
    @required String title,
    @required Widget child,
  }) =>
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
            appBar: AppbarWidget(
              title: title ?? "",
            ),
            body: child,
          ),
        ),
      );

  void _requestsSummary() => _pushReplacement(
        title: "Requests Summary",
        child: Container(),
      );

  void _requestsByCategoryOnTap() => _pushReplacement(
        title: "Requests By Category",
        child: RequestByCategoryWidget(),
      );

  void _requestsReceivedInLast20Days() => _pushReplacement(
        title: "Requests Received In Last 20 Days",
        child: Container(),
      );

  void _requestsClosedInLast20Days() => _pushReplacement(
        title: "Requests Closed In Last 20 Days",
        child: Container(),
      );

  void _openRequests() => _pushReplacement(
        title: "Open Requests",
        child: OpenRequestsWidget(),
      );

  void _openRequestsByCategory() => _pushReplacement(
        title: "Open Requests By Category",
        child: Container(),
      );

  void _requestsApprochingSLAViolations() => _pushReplacement(
        title: "Requests Approching SLA Violations",
        child: Container(),
      );

  void _slaViolationedRequested() => _pushReplacement(
        title: "SLA Violated Requests",
        child: Container(),
      );

  void _slaViolationByCategoryOnTap() => _pushReplacement(
        title: "SLA Violation By Category",
        child: SLAViolationByCategoryWidget(),
      );

  void _taskSummaryOnTap() => _pushReplacement(
        title: "Task Summary",
        child: TaskSummaryWidget(),
      );
}
