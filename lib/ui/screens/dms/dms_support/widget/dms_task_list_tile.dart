import 'package:flutter/material.dart';
import 'package:hr_management/data/models/task_models/task_list_model.dart';
import 'package:hr_management/logic/blocs/task_bloc/task_bloc.dart';
import 'package:hr_management/routes/route_constants.dart';
import 'package:hr_management/routes/screen_arguments.dart';

class DMSTaskListCard extends StatelessWidget {
  final bool? onTap;
  final int? index;
  final List<TaskListModel>? taskList;

  const DMSTaskListCard({Key? key, this.onTap, this.index, this.taskList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        title: Text(
          taskSubject(index!),
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
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Text("Ticket No: "),
                        Text(taskNoValue(index!)),
                      ],
                    ),
                  ),
                  Text(
                    taskStatusName(index!),
                    style: TextStyle(color: Colors.green[800]),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text("Requested By: "),
                Flexible(
                  child: Text(
                    ownerUserName(index!),
                    style: TextStyle(color: Colors.deepPurple[900]),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text("Assigned To: "),
                Flexible(
                  child: Text(
                    assigneeDisplayName(index!),
                    style: TextStyle(color: Colors.deepPurple[900]),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text('Start Date: '),
                      Expanded(
                        child: Text(
                          startDateDisplay(index!),
                          style: TextStyle(color: Colors.red[700]),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text('Due Date: '),
                      Expanded(
                        child: Text(
                          dueDateDisplay(index!),
                          style: TextStyle(color: Colors.red[700]),
                        ),
                      ),
                    ],
                  ),
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
                arg2: taskList![index!].id,
                arg3: taskList![index!].taskSubject),
            // arg3: _taskList[index].templateMasterCode),
          );
        },
      ),
    );
  }

  String taskSubject(int index) {
    return taskList![index].taskSubject ?? "-";
  }

  String taskNoValue(int index) {
    return taskList![index].taskNo ?? "-";
  }

  String ownerUserName(int index) {
    return taskList![index].ownerUserName ?? "-";
  }

  String assigneeDisplayName(int index) {
    return taskList![index].assigneeDisplayName ?? "-";
  }

  String taskStatusName(int index) {
    return taskList![index].taskStatusName ?? "-";
  }

  String startDateDisplay(int index) {
    return taskList![index].displayStartDate ?? "-";
  }

  String dueDateDisplay(int index) {
    return taskList![index].displayDueDate ?? "-";
  }
}
