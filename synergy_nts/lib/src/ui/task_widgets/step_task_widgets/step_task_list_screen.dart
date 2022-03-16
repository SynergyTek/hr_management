import 'package:flutter/material.dart';

import 'widgets/step_task_list_tile.dart';
import '../../../models/service_models/service_model.dart';

class StepTaskListScreen extends StatelessWidget {
  final List<StepTasksList>? stepTasksList;
  final String userId;
  final String serviceTemplateCode;
  final bool isEmployeePortal;

  const StepTaskListScreen({
    Key? key,
    this.stepTasksList,
    required this.userId,
    required this.serviceTemplateCode,
    required this.isEmployeePortal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Step-tasks"),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: stepTasksList!.length,
          itemBuilder: (context, index) {
            return StepTaskListCardWidget(
              userId: userId,
              isEmployeePortal:
                  true, //TODO: ether remove this field or make appropriate change
              // isEmployeePortal: isEmployeePortal,
              index: index,
              taskList: stepTasksList!,
              onTap: false,
              serviceTemplateCode: serviceTemplateCode,
            );
          },
        ),
      ),
    );
  }
}
