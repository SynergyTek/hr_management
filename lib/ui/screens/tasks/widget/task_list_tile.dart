import 'package:flutter/material.dart';
import '../../../../data/models/task_models/task_list_model.dart';
import '../../../../logic/blocs/task_bloc/task_bloc.dart';
import '../../../../routes/route_constants.dart';
import '../../../../routes/screen_arguments.dart';

class TaskListCard extends StatelessWidget {
  final int index;
  final List<TaskListModel> taskList;
  const TaskListCard({Key key, @required this.index, @required this.taskList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        title: Text(
          taskSubject(index),
          maxLines: 2,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Task No: "),
                      Text(taskNoValue(index)),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
              child: Row(
                children: <Widget>[
                  Text(
                    ownerUserName(index),
                    style: TextStyle(color: Colors.deepPurple[900]),
                  ),
                  Text(" to "),
                  Text(
                    assigneeDisplayName(index),
                    style: TextStyle(color: Colors.deepPurple[900]),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    taskStatusName(index),
                    style: TextStyle(color: Colors.green[800]),
                  ),
                ),
                Text(
                  dueDateDisplay(index),
                  style: TextStyle(color: Colors.red[700]),
                ),
              ],
            ),
          ],
        ),
        onTap: () {
          taskBloc.subjectGetTaskDetails.sink.add(null);
          Navigator.pushNamed(
            context,
            CREATE_EDIT_TASK_ROUTE,
            arguments: ScreenArguments(
                arg1: '',
                arg2: taskList[index].id,
                arg3: taskList[index].taskSubject),
            // arg3: _taskList[index].templateMasterCode),
          );
        },
      ),
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

  String assigneeDisplayName(int index) {
    return taskList[index].assigneeDisplayName ?? "-";
  }

  String taskStatusName(int index) {
    return taskList[index].taskStatusName ?? "-";
  }

  String dueDateDisplay(int index) {
    return taskList[index].dueDateDisplay ?? "-";
  }
}
