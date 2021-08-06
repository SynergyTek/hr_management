import 'package:flutter/material.dart';

import '../../../widgets/appbar_widget.dart';
import '../../../widgets/internet_connectivity_widget.dart';

import 'widgets/helpdesk_dashboard_body_widget.dart';

class CaseManagementHelpdeskDashboardScreen extends StatelessWidget {
  const CaseManagementHelpdeskDashboardScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Helpdesk Dashboard",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: CaseManagementHelpdeskDashboardBodyWidget(),
        ),
      ),
    );
  }
}
