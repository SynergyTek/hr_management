import 'package:flutter/material.dart';
import 'package:hr_management/ui/widgets/drawer/nav_drawer_widget.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/internet_connectivity_widget.dart';
import 'widget/service_dashboard_body.dart';

class ServiceDashboard extends StatelessWidget {
  const ServiceDashboard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: 'Service Dashboard'),
      drawer: drawerWidget(context),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: ServiceDashboardBody(),
        ),
      ),
    );
  }
}
