import 'package:flutter/material.dart';
import 'package:hr_management/data/models/task_models/task_list_model.dart';
import 'package:hr_management/data/models/task_models/task_list_resp_model.dart';
import 'package:hr_management/routes/route_constants.dart';
import 'package:hr_management/routes/screen_arguments.dart';
import '../../../../logic/blocs/task_bloc/task_bloc.dart';
import '../../../../themes/theme_config.dart';
import '../../../widgets/progress_indicator.dart';

import 'package:listizer/listizer.dart';

typedef FilterListTapCallBack = void Function(dynamic key);

class TaskHomeBody extends StatefulWidget {
  TaskHomeBody({Key key}) : super(key: key);

  @override
  _TaskHomeBodyState createState() => _TaskHomeBodyState();
}

class _TaskHomeBodyState extends State<TaskHomeBody> {
  List<TaskListModel> _taskList = [];
  List<TaskListModel> _filteredTaskList = [];

  FilterListTapCallBack filterData;

  String moduleId;
  String mode;
  String taskNo;
  String taskStatus;
  String taskAssigneeIds;
  String subject;
  DateTime startDate;
  DateTime dueDate;
  DateTime completionDate;
  String templateMasterCode;
  String text;

  @override
  void initState() {
    super.initState();
    apiCall();
  }

  apiCall() {
    taskBloc.subjectTaskList.sink.add(null);

    Map<String, dynamic> queryparams = Map();

    if (moduleId != null) queryparams['moduleId'] = moduleId;
    if (mode != null) queryparams['mode'] = mode;
    if (taskNo != null) queryparams['taskNo'] = taskNo;
    if (taskStatus != null) queryparams['taskStatus'] = taskStatus;
    if (taskAssigneeIds != null)
      queryparams['taskAssigneeIds'] = taskAssigneeIds;
    if (subject != null) queryparams['subject'] = subject;
    if (startDate != null) queryparams['startDate'] = startDate;
    if (dueDate != null) queryparams['dueDate'] = dueDate;
    if (completionDate != null) queryparams['completionDate'] = completionDate;
    if (templateMasterCode != null)
      queryparams['templateMasterCode'] = templateMasterCode;
    if (text != null) queryparams['text'] = text;

    // call bloc with updated query params.
    taskBloc..getTaskHomeListData(queryparams: queryparams);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          trailing: Icon(Icons.filter_list),
          title: Text("Filter"),
          children: [
            Container(
              width: double.infinity,
              child: Wrap(
                children: [
                  customButton(
                    buttonText: 'Home',
                    handleOnPressed: () => _homeFilter(),
                  ),
                  customButton(
                    buttonText: 'Pending Till Today',
                    handleOnPressed: () => _pendingTillTodayFilter(),
                  ),
                  customButton(
                    buttonText: 'Ending in Next 7 Days',
                    handleOnPressed: () => _endingInWeekFilter(),
                  ),
                  customButton(
                    buttonText: 'More...',
                    handleOnPressed: () => _moreFilter(),
                  ),
                ],
              ),
            ),
          ],
        ),
        // ListTile(
        //   trailing: Icon(Icons.filter_list),
        //   title: Text("Filter"),
        //   onTap: () {
        //     Navigator.pushNamed(
        //       context,
        //       TASK_FILTER,
        //     );
        //   },
        // ),
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
                      print(
                          "Snapshot data: ${snapshot.data.data[index].taskNo}");
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
                                padding: const EdgeInsets.only(
                                    top: 6.0, bottom: 6.0),
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
                                      style:
                                          TextStyle(color: Colors.green[800]),
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
                          onTap: () {
                            taskBloc.subjectGetTaskDetails.sink.add(null);
                            Navigator.pushNamed(
                              context,
                              CREATE_EDIT_TASK_ROUTE,
                              arguments: ScreenArguments(
                                  arg1: '',
                                  arg2: _taskList[index].id,
                                  arg3: _taskList[index].templateMasterCode),
                            );
                          },
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CustomProgressIndicator(),
                  );
                }
              }),
        ),
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

  customButton({
    String buttonText,
    Function handleOnPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue[300]),
          // MaterialStateProperty.all(Theme.of(context).textHeadingColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
        ),
        onPressed: () => handleOnPressed(),
        child: Text(buttonText),
      ),
    );
  }

  _homeFilter() {
    _setParamsToNull();
    apiCall();
  }

  _pendingTillTodayFilter() {
    _setParamsToNull();

    text = 'Today';
    apiCall();
  }

  _endingInWeekFilter() {
    _setParamsToNull();

    text = 'Week';
    apiCall();
  }

  _moreFilter() {
    filterData(dynamic value) {
      _setParamsToNull();
      taskStatus = value;
      apiCall();
      print(taskStatus);
    }

    Navigator.pushNamed(
      context,
      TASK_FILTER,
      arguments: ScreenArguments(arg5: filterData),
    );
  }

  _setParamsToNull() {
    moduleId = null;
    mode = null;
    taskNo = null;
    taskStatus = null;
    taskAssigneeIds = null;
    subject = null;
    startDate = null;
    dueDate = null;
    completionDate = null;
    templateMasterCode = null;
    text = null;
  }
}
