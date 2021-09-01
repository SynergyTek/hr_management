import 'package:flutter/material.dart';
import 'package:hr_management/data/models/task_models/task_list_model.dart';
import 'package:hr_management/data/models/task_models/task_list_resp_model.dart';

import 'package:hr_management/logic/blocs/task_bloc/task_bloc.dart';
import 'package:hr_management/ui/widgets/empty_list_widget.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import 'package:listizer/listizer.dart';

import 'dms_task_list_tile.dart';

class DMSTaskList extends StatefulWidget {
  final String taskListStatus;
  final String requestBy;

  const DMSTaskList({
    Key key,
    this.taskListStatus,
    this.requestBy,
  }) : super(key: key);

  @override
  _DMSTaskListState createState() => _DMSTaskListState();
}

class _DMSTaskListState extends State<DMSTaskList> {
  List<TaskListModel> _taskList = [];
  List<TaskListModel> _filteredTaskList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TaskListResponseModel>(
      stream: taskBloc.subjectTaskList.stream,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return Center(
              child: Text(snapshot.data.error),
            );
          }
          if (snapshot.data.data == null || snapshot.data.data.length == 0) {
            return EmptyListWidget();
          }
          _taskList = snapshot.data.data;
          return Listizer(
            listItems: _taskList,
            filteredSearchList: _filteredTaskList,
            itemBuilder: (context, index) {
              return DMSTaskListCard(
                index: index,
                taskList: _taskList,
                onTap: false,
              );
            },
          );
        } else {
          return Center(
            child: CustomProgressIndicator(),
          );
        }
      },
    );
  }
}
