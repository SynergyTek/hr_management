import 'package:flutter/material.dart';
import '../../../../data/models/task_models/task_list_model.dart';
import '../../../../data/models/task_models/task_list_resp_model.dart';
import '../../../../logic/blocs/task_bloc/task_bloc.dart';
import '../../../widgets/progress_indicator.dart';
import 'package:listizer/listizer.dart';

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
    return Column(
      children: [
        Expanded(
          child: StreamBuilder<TaskListResponseModel>(
            stream: taskBloc.subjectTaskList.stream,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.error != null &&
                    snapshot.data.error.length > 0) {
                  return Center(
                    child: Text(snapshot.data.error),
                  );
                }
                _taskList = snapshot.data.data;
                return Listizer(
                  listItems: _taskList,
                  filteredSearchList: _filteredTaskList,
                  itemBuilder: (context, index) {
                    print("Snapshot data: ${snapshot.data.data[index].taskNo}");
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              padding:
                                  const EdgeInsets.only(top: 6.0, bottom: 6.0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    ownerUserName(index),
                                    style: TextStyle(
                                        color: Colors.deepPurple[900]),
                                  ),
                                  Text(" to "),
                                  Text(
                                    assigneeDisplayName(index),
                                    style: TextStyle(
                                        color: Colors.deepPurple[900]),
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
                        // leading: TextCircleAvater(
                        //     text: _filteredTaskList[index].subject,
                        //     context: context,
                        //     radius: 20,
                        //     fontSize: 18,
                        //     color: Theme.of(context).primaryColorLight),
                        // title: Text(
                        //   _filteredTaskList[index].name != null
                        //       ? _filteredTaskList[index].name
                        //       : "",
                        //   maxLines: 2,
                        //   style: Theme.of(context).textTheme.headline6,
                        // ),
                        onTap: () {},
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: CustomProgressIndicator(),
                );
              }
            },
          ),
        )
      ],
    );
  }

  String taskSubject(int index) {
    return _taskList[index].taskSubject ?? "-";
  }

  String taskNoValue(int index) {
    return _taskList[index].taskNo ?? "-";
  }

  String ownerUserName(int index) {
    return _taskList[index].ownerUserName ?? "-";
  }

  String assigneeDisplayName(int index) {
    return _taskList[index].assigneeDisplayName ?? "-";
  }

  String taskStatusName(int index) {
    return _taskList[index].taskStatusName ?? "-";
  }

  String dueDateDisplay(int index) {
    return _taskList[index].dueDateDisplay ?? "-";
  }
}
