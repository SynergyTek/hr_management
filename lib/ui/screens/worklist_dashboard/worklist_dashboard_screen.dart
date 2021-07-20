import 'package:flutter/material.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';

import 'widgets/worklist_dashboard_body.dart';

class WorklistDashboard extends StatelessWidget {
  const WorklistDashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      drawer: drawerWidget(context),
      appBar: AppbarWidget(
        title: "Worklist Dashboard",
      ),
      body: SafeArea(
        // child: InternetConnectivityWidget(
        child: WorklistDashboardBody(),
      ),
      // ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom:50.0),
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(
            Icons.add,
            size: 32,
          ),
          onPressed: () {
           
          },
        ),
      ),
    );
  }
}