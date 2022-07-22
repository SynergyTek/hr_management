import 'package:flutter/material.dart';
import 'package:hr_management/ui/screens/attendance/widgets/ma_widget.dart';
import 'package:hr_management/ui/screens/attendance/widgets/mark_attendance_widget.dart';

import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';
import 'package:hr_management/logic/blocs/internet_bloc/widget/internet_connectivity_widget.dart';
import '../../widgets/location_connectivity_widget.dart';

class MarkAttendance extends StatelessWidget {
  const MarkAttendance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppbarWidget(
        title: "Attendance",
        actions: [],
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: LocationConnectivityWidget(
            child: MAWidget(),
            // child: MarkAttendanceWidget(),
          ),
        ),
      ),
    );
  }
}
