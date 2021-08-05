import 'package:flutter/material.dart';
import 'package:hr_management/ui/screens/case_management_screen/helpdesk_dashboard_screen/widgets/sla_violation_by_category.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';

import '../../../../../themes/theme_config.dart';

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
          listTileOnTap: () => null,
        ),
        _eachListTile(
          title: "Requests By Category",
          listTileOnTap: () => null,
        ),
        _eachListTile(
          title: "Requests Received In Last 20 Days",
          listTileOnTap: () => null,
        ),
        _eachListTile(
          title: "Requests Closed In Last 20 Days",
          listTileOnTap: () => null,
        ),
        _eachListTile(
          title: "Open Requests",
          listTileOnTap: () => null,
        ),
        _eachListTile(
          title: "Open Requests by Category",
          listTileOnTap: () => null,
        ),
        _eachListTile(
          title: "SLA Violation by Category",
          listTileOnTap: () => _slaViolationByCategoryOnTap(),
        ),
        _eachListTile(
          title: "Requests Approching SLA Violations",
          listTileOnTap: () => null,
        ),
        _eachListTile(
          title: "SLA Violated Requests",
          listTileOnTap: () => null,
        ),
        _eachListTile(
          title: "Task Summary",
          listTileOnTap: () => null,
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

  void _slaViolationByCategoryOnTap() => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
            appBar: AppbarWidget(
              title: "SLA Violation by Category",
            ),
            body: SLAViolationByCategoryBodyWidget(),
          ),
        ),
      );
}
