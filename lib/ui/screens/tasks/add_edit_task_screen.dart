import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../widgets/appbar_widget.dart';
import '../../widgets/internet_connectivity_widget.dart';
import 'widget/add_edit_task_body.dart';

class AddEditTaskScreen extends StatelessWidget {
  final String templateCode;
  final String taskId;
  final String title;
  const AddEditTaskScreen({Key key, this.templateCode, this.taskId, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: InternetConnectivityWidget(
            child: AddEditTaskBody(
          templateCode: templateCode,
          taskId: taskId,
          title: title,
        )),
      ),
    );
  }
}
