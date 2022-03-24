import 'package:flutter/material.dart';

import '../../../widgets/default_list_card_widget.dart';
import '../../../../models/service_models/service_model.dart';

class StepTaskListCardWidget extends StatelessWidget {
  final bool onTap;
  final int index;
  final List<StepTasksList> taskList;

  final String userId;
  final bool isEmployeePortal;
  final String serviceTemplateCode;

  const StepTaskListCardWidget({
    Key? key,
    required this.userId,
    required this.isEmployeePortal,
    required this.index,
    required this.taskList,
    required this.serviceTemplateCode,
    this.onTap = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultListCardWidget(
      borderSide: true,
      isStepTask: true,
      row1E2Text: 'Service Cost',
      endDate: taskDueDate(index),
      startDate: taskStartDate(index),
      refNoRow1E1Data: taskNoValue(index),
      statusName: taskStatusName(index),
      titleData: taskSubject(index),
      row1E1Text: 'Task No',
      row2E1Text: 'Owner Name',
      row2E1Data: ownerUserName(index),
      row2E2Data: consumerNo(index),
      row2E2Title: 'Consumer No',
      stepTaskList: taskList,
      task: taskList[index],
      index: index,
      userId: userId,
      isEmployeePortal: isEmployeePortal,
      serviceTemplateCode: serviceTemplateCode,
    );
  }

  String taskSubject(int index) {
    return taskList[index].taskSubject ?? "-";
  }

  String taskNoValue(int index) {
    return taskList[index].taskNo ?? "-";
  }

  String ownerUserName(int index) {
    return taskList[index].ownerUserName ?? "-";
  }

  String taskStatusName(int index) {
    return taskList[index].taskStatusName ?? "-";
  }

  String taskDueDate(int index) {
    return taskList[index].dueDate ?? "-";
  }

  String taskStartDate(int index) {
    return taskList[index].startDate ?? "-";
  }

  String consumerNo(int index) {
    return taskList[index].noteNo ?? "-";
  }
}
