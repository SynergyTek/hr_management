import 'package:boilerplate/ui/widgets/appbar_widget.dart';
import 'package:boilerplate/ui/widgets/internet_connectivity_widget.dart';
import 'package:boilerplate/ui/widgets/location_connectivity_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/mark_attendance_widget.dart';

class MarkAttendance extends StatelessWidget {
  const MarkAttendance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Welcome Zlatan",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: LocationConnectivityWidget(child: MarkAttendanceWidget()),
        ),
      ),
    );
  }
}
