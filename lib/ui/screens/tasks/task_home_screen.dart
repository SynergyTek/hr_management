import 'package:flutter/material.dart';
import 'package:hr_management/ui/screens/tasks/widget/task_home_body.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/drawer/nav_drawer_widget.dart';
import 'package:hr_management/ui/widgets/internet_connectivity_widget.dart';

class TaskHomeScreen extends StatelessWidget {
  const TaskHomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       drawer: drawerWidget(context),
      appBar: AppbarWidget(
        title: "Task Home",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: TaskHomeBody(),
        ),
      ),
    );
  }
}