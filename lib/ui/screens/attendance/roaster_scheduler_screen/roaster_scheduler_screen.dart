import 'package:flutter/material.dart';

import '../../../widgets/appbar_widget.dart';
import '../../../widgets/drawer/nav_drawer_widget.dart';
import 'package:hr_management/logic/blocs/internet_bloc/widget/internet_connectivity_widget.dart';

import 'widgets/roaster_scheduler_widget.dart';

class RosterScheduleScreen extends StatelessWidget {
  const RosterScheduleScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppbarWidget(
        title: "Roster Schedule",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: RosterScheduleWidget(),
        ),
      ),
    );
  }
}
