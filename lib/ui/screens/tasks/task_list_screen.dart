import 'package:flutter/material.dart';

import '../../widgets/appbar_widget.dart';
import '../../widgets/internet_connectivity_widget.dart';
import 'widget/task_list_body.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({Key? key}) : super(key: key);

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
