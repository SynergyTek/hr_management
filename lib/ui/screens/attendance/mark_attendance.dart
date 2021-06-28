import '../../../routes/route_constants.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';
import '../../widgets/internet_connectivity_widget.dart';
import '../../widgets/location_connectivity_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/mark_attendance_widget.dart';

class MarkAttendance extends StatelessWidget {
  const MarkAttendance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerWidget(context),
      appBar: AppbarWidget(
        title: "Attendance",
        actions: [
          IconButton(
            icon: Icon(Icons.wifi),
            onPressed: () => Navigator.pushNamed(
              context,
              HOME_ROUTE,
            ),
          ),
          IconButton(
            icon: Icon(Icons.home_repair_service),
            onPressed: () => Navigator.pushNamed(
              context,
              SERVICE_ROUTE,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: LocationConnectivityWidget(child: MarkAttendanceWidget()),
        ),
      ),
    );
  }
}
