import 'package:flutter/material.dart';
import 'package:hr_management/ui/screens/tasks/widget/task_list_body.dart';

import '../../widgets/appbar_widget.dart';
import '../../widgets/internet_connectivity_widget.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: 'Task List'),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: TaskListBody(),
        ),
      ),
    );
  }
}
