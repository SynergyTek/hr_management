import 'package:flutter/material.dart';
import 'package:hr_management/data/models/task_models/task_list_model.dart';
import 'package:hr_management/logic/blocs/task_bloc/task_bloc.dart';

class TaskDashboardList extends StatefulWidget {
  TaskDashboardList({Key key}) : super(key: key);

  @override
  _TaskDashboardListState createState() => _TaskDashboardListState();
}

class _TaskDashboardListState extends State<TaskDashboardList> {
   List<TaskListModel> _taskList = [];
  List<TaskListModel> _filteredTaskList = [];
  
   @override
  void initState() {
    super.initState();
    taskBloc..getTaskDashBoardData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: null,
    );
  }
}