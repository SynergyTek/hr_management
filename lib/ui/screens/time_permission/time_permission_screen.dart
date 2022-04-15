import 'package:flutter/material.dart';

import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';
import '../../widgets/internet_connectivity_widget.dart';
import 'widget/time_permission_body.dart';

class TimePermissionScreen extends StatelessWidget {
  const TimePermissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppbarWidget(title: 'Time Permission List'),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: TimePermissionListViewWidget(),
        ),
      ),
    );
  }
}
