import 'package:flutter/material.dart';

import '../../task_widget.dart';

class AddEditTaskScreen extends StatelessWidget {
  final String? taskTemplateCode;
  final String? serviceTemplateCode;
  final String? taskId;
  final String? title;
  final String userId;
  final bool isEmployeePortal;
  final Map<String, dynamic>? extraInformationMap;

  const AddEditTaskScreen({
    Key? key,
    this.taskTemplateCode,
    this.serviceTemplateCode,
    this.taskId,
    this.title,
    this.extraInformationMap,
    required this.userId,
    required this.isEmployeePortal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Step Task"),
      ),
      body: SafeArea(
        child: TaskWidget(
          taskTemplateCode: taskTemplateCode,
          serviceTemplateCode: serviceTemplateCode,
          taskId: taskId ?? "",
          title: title,
          userId: userId,
          // isEmployeePortal: isEmployeePortal,
        ),
      ),
    );
  }
}
