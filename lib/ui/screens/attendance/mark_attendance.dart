import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/internet_connectivity_widget.dart';
import 'package:hr_management/ui/widgets/location_connectivity_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/mark_attendance_widget.dart';

class MarkAttendance extends StatelessWidget {
  const MarkAttendance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Attendance",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: LocationConnectivityWidget(child: MarkAttendanceWidget()),
        ),
      ),
    );
  }
}
