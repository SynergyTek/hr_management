import 'package:flutter/material.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/data/maps/maps.dart';
import 'package:hr_management/data/models/task_models/task_list_model.dart';
import 'package:hr_management/data/models/task_models/task_list_resp_model.dart';
import 'package:hr_management/logic/blocs/task_bloc/task_bloc.dart';
import 'package:hr_management/routes/route_constants.dart';
import 'package:hr_management/routes/screen_arguments.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import 'package:listizer/listizer.dart';

class TaskDashboardList extends StatefulWidget {
  TaskDashboardList({Key key}) : super(key: key);

  @override
  _TaskDashboardListState createState() => _TaskDashboardListState();
}

class _TaskDashboardListState extends State<TaskDashboardList> {
  List<TaskListModel> _taskList = [];
  List<TaskListModel> _filteredTaskList = [];
  TextEditingController subjectController = TextEditingController();

  @override
  void initState() {
    super.initState();
    apiCall();
  }

  apiCall() {
    taskBloc..getTaskDashBoardData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          collapsedBackgroundColor: Colors.grey[200],
          backgroundColor: Colors.grey[200],
          trailing: Icon(Icons.filter_list),
          title: _searchField(),
          children: [wrappedButtons()],
        ),
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

  Widget _searchField() {
    return Container(
      height: 48,
      padding: EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(100),
        // color: Colors.white,
      ),
      child: TextField(
        controller: subjectController,
        decoration: InputDecoration(
          hintText: 'Search',
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          suffixIcon: IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.blue,
            ),
            onPressed: () => _searchSubject(),
          ),
        ),
      ),
    );
  }

  _searchSubject() {
    if (subjectController.text != null && subjectController.text.isNotEmpty) {
      _setParamsToNull();
      // subject = subjectController.text;
      apiCall();
    }
  }

  _setParamsToNull() {}

  Widget wrappedButtons() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      width: double.infinity,
      child: Wrap(
        children: [
          customButton(
            buttonText: 'Home',
            handleOnPressed: () => _homeFilter(),
          ),
          customButton(
            buttonText: 'More...',
            handleOnPressed: () => _moreFilter(),
          ),
        ],
      ),
    );
  }

  _homeFilter() {
    _setParamsToNull();
    apiCall();
  }

  _moreFilter() {
    filterData(dynamic value) {
      _setParamsToNull();
      // if (filterServiceOptionsMap.toString().contains(value))
      //   serviceStatusIds = value;
      // else
      //   userType = value;
      apiCall();
      // print(serviceStatusIds);
    }

    Navigator.pushNamed(
      context,
      NTS_FILTER,
      arguments: ScreenArguments(
        func: filterData,
        ntstype: NTSType.task,
        val1: false,
        val2: true,
      ),
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
}
