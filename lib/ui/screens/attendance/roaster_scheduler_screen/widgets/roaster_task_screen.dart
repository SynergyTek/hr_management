import 'package:flutter/material.dart';
import 'package:hr_management/ui/screens/attendance/roaster_scheduler_screen/widgets/roaster_task_list_tile.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';

import '../../../../../data/models/task_models/task_list_model.dart';
import '../../../../listizer/listizer.dart';

class RoasterTaskScreen extends StatefulWidget {
  final List<TaskListModel> taskList;
  final bool? onTap;
  RoasterTaskScreen({Key? key, required this.taskList, this.onTap})
      : super(key: key);

  @override
  State<RoasterTaskScreen> createState() => _RoasterTaskScreenState();
}

class _RoasterTaskScreenState extends State<RoasterTaskScreen> {
  List _filteredTaskList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarWidget(title: 'Roaster Schedule Task List'),
        body: Listizer(
          listItems: widget.taskList,
          filteredSearchList: _filteredTaskList,
          itemBuilder: (context, index) {
            return RoasterTaskListCard(
              index: index,
              taskList: widget.taskList,
              onTap: widget.onTap ?? false,
            );
          },
        ));
  }
}
