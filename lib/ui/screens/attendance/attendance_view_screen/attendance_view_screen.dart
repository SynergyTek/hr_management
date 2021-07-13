import 'package:flutter/material.dart';
import '../../../widgets/appbar_widget.dart';
import '../../../widgets/drawer/nav_drawer_widget.dart';
import '../../../widgets/internet_connectivity_widget.dart';
import 'widgets/attendance_view_body_widget.dart';

class AttendanceViewScreen extends StatelessWidget {
  const AttendanceViewScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerWidget(context),
      appBar: AppbarWidget(
        title: "Attendance View",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: AttendanceViewBodyWidget(),
        ),
      ),
    );
  }
}