import 'package:flutter/material.dart';

import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';
import '../../widgets/internet_connectivity_widget.dart';

import 'widgets/case_management_body_widget.dart';

class CaseManagementScreen extends StatelessWidget {
  const CaseManagementScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppbarWidget(
        title: "Case Management",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: CaseManagementBodyWidget(),
        ),
      ),
    );
  }
}
