import 'package:flutter/material.dart';
import 'package:hr_management/ui/screens/tasks/widget/task_body.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/internet_connectivity_widget.dart';

class AddEditTaskScreen extends StatelessWidget {
  final String templateCode;
  final String taskId;
  final String title;
  const AddEditTaskScreen({Key key, this.templateCode, this.taskId, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        // actions: [IconButton(icon: Icon(Icons.comment), onPressed: () {})],
        title: (templateCode != null && templateCode.isNotEmpty)
            ? "Add " + templateCode
            : "Edit " + title,
        // title: "Edit " + templateCode,
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
