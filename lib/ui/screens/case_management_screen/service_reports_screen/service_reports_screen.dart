import 'package:flutter/material.dart';

import '../../../widgets/appbar_widget.dart';
import '../../../widgets/internet_connectivity_widget.dart';

import 'widgets/service_reports_body_widget.dart';

class CaseManagementServiceReportsScreen extends StatelessWidget {
  const CaseManagementServiceReportsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Service Reports",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: CaseManagementServiceReportsBodyWidget(),
        ),
      ),
    );
  }
}
