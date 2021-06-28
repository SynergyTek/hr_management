import 'package:flutter/material.dart';

import '../../widgets/drawer/nav_drawer_widget.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/internet_connectivity_widget.dart';
import 'widgets/service_screen_body_widget.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerWidget(context),
      appBar: AppbarWidget(
        title: "Welcome Zlatan",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: ServiceScreenBodyWidget(),
        ),
      ),
    );
  }
}
