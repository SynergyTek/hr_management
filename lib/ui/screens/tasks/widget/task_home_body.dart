import 'package:flutter/material.dart';
import '../../../../data/enums/enums.dart';
import '../../../../data/models/task_models/task_list_model.dart';
import '../../../../data/models/task_models/task_list_resp_model.dart';
import '../../../../routes/route_constants.dart';
import '../../../../routes/screen_arguments.dart';
import '../../../widgets/nts_widgets.dart';
import '../../../../logic/blocs/task_bloc/task_bloc.dart';
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
  bool dateFilterVisible = false;

  DateTime startDateValue;
  DateTime dueDateValue;

  TextEditingController subjectController = TextEditingController();

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
    if (startDate != null)
      queryparams['startDate'] = startDate.toString().split(' ')[0];
    if (dueDate != null)
      queryparams['dueDate'] = dueDate.toString().split(' ')[0];
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
          collapsedBackgroundColor: Colors.grey[200],
          backgroundColor: Colors.grey[200],
          onExpansionChanged: (value) => _onExpansionChanged(value),
          trailing: Icon(Icons.filter_list),
          title: _searchField(),
          children: [wrappedButtons()],
        ),
        Visibility(
          visible: dateFilterVisible,
          child: _dateFilterWidget(),
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
            },
          ),
        ),
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
            icon: Icon(Icons.search,color: Colors.blue,),
            onPressed: () => _searchSubject(),
          ),
        ),
      ),
    );
  }

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
            buttonText: 'Pending Till Today',
            handleOnPressed: () => _pendingTillTodayFilter(),
          ),
          customButton(
            buttonText: 'Ending in Next 7 Days',
            handleOnPressed: () => _endingInWeekFilter(),
          ),
          customButton(
            buttonText: 'Date',
            handleOnPressed: () => _dateFilter(),
          ),
          customButton(
            buttonText: 'More...',
            handleOnPressed: () => _moreFilter(),
          ),
        ],
      ),
    );
  }

  _onExpansionChanged(bool value) {
    if (!value)
      setState(() {
        dateFilterVisible = false;
      });
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

  _searchSubject() {
    if (subjectController.text != null && subjectController.text.isNotEmpty) {
      _setParamsToNull();
      subject = subjectController.text;
      apiCall();
    }
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

  _dateFilter() {
    setState(() {
      dateFilterVisible = !dateFilterVisible;
    });
  }

  Widget _dateFilterWidget() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: DynamicDateTimeBox(
            code: startDateValue?.toString() ?? null,
            name: 'Start Date',
            key: new Key('Start Date'),
            selectDate: (DateTime date) {
              if (date != null) {
                setState(() async {
                  startDateValue = date;
                });

                print(startDateValue);
              }
            },
          ),
        ),
        Expanded(
          child: DynamicDateTimeBox(
            code: dueDateValue?.toString() ?? null,
            name: 'End Date',
            key: new Key('End Date'),
            selectDate: (DateTime date) {
              if (date != null) {
                setState(() async {
                  dueDateValue = date;
                });
              }
            },
          ),
        ),
        IconButton(
          color: Theme.of(context).primaryColor,
          icon: Icon(Icons.save),
          // onPressed: () {},
          onPressed: () => _handleFilterOnPressed(),
        )
      ],
    );
  }

  void _handleFilterOnPressed() {
    if (startDateValue == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Start date cannot be empty."),
        ),
      );
      return;
    }

    if (dueDateValue != null && startDateValue.compareTo(dueDateValue) > 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Start date cannot be greater than the End date."),
        ),
      );
      return;
    }

    _setParamsToNull();
    startDate = startDateValue;
    dueDate = dueDateValue;
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
      NTS_FILTER,
      arguments: ScreenArguments(func: filterData, ntstype: NTSType.task),
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
