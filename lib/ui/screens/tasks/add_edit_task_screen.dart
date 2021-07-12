import 'package:flutter/material.dart';
import 'package:hr_management/ui/screens/tasks/widget/task_body.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/internet_connectivity_widget.dart';

class AddEditTaskScreen extends StatelessWidget {
  final String templateCode;
  final String taskId;
  const AddEditTaskScreen({Key key, this.templateCode, this.taskId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Create " + templateCode,
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: AddEditTaskBody(
            templateCode: templateCode,
            taskId: taskId,
          ),
        ),
      ),
    );
  }
}
