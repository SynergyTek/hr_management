import 'package:flutter/material.dart';

import '../../../widgets/appbar_widget.dart';
import '../../../widgets/drawer/nav_drawer_widget.dart';
import '../../../widgets/internet_connectivity_widget.dart';
import 'widgets/display_access_log_body.dart';

class DisplayAccessLog extends StatelessWidget {
  const DisplayAccessLog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppbarWidget(
        title: "Access Logs",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: DisplayAccessLogBody(),
        ),
      ),
    );
  }
}
