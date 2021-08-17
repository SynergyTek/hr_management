import 'package:flutter/material.dart';
import '../../../widgets/empty_list_widget.dart';
import '../../../../data/enums/enums.dart';
import '../../../../data/models/task_models/task_list_model.dart';
import '../../../../data/models/task_models/task_list_resp_model.dart';
import '../../../../logic/blocs/task_bloc/task_bloc.dart';
import '../../../../routes/route_constants.dart';
import '../../../../routes/screen_arguments.dart';
import '../../../widgets/progress_indicator.dart';
import 'package:listizer/listizer.dart';

import 'task_list_tile.dart';

typedef FilterListTapCallBack = void Function(dynamic key1, FilterType key2);

class TaskDashboardList extends StatefulWidget {
  final String taskListStatus;
  TaskDashboardList({Key key, this.taskListStatus}) : super(key: key);

  @override
  _TaskDashboardListState createState() => _TaskDashboardListState();
}

class _TaskDashboardListState extends State<TaskDashboardList> {
  List<TaskListModel> _taskList = [];
  List<TaskListModel> _filteredTaskList = [];
  TextEditingController subjectController = TextEditingController();
  FilterListTapCallBack filterData;
  String text;

  String userId;
  String taskStatusIds;
  String taskAssigneeIds;
  String taskOwnerIds;

  @override
  void initState() {
    super.initState();
    apiCall();
  }

  apiCall() {
    taskBloc.subjectTaskList.sink.add(null);

    Map<String, dynamic> queryparams = Map();
    if (widget.taskListStatus != null) {
      if (userId != null) queryparams['userId'] = userId;
      if (taskStatusIds != null) queryparams['TaskStatusIds'] = taskStatusIds;
      if (taskAssigneeIds != null)
        queryparams['TaskAssigneeIds'] = taskAssigneeIds;
      if (taskOwnerIds != null) queryparams['TaskOwnerIds'] = taskOwnerIds;
      if (text != null) queryparams['searchText'] = text;
      taskBloc
        ..getTaskDashBoardData(
            queryparams: queryparams, taskListStatus: widget.taskListStatus);
    } else {
      if (userId != null) queryparams['userId'] = userId;
      if (taskStatusIds != null) queryparams['TaskStatusIds'] = taskStatusIds;
      if (taskAssigneeIds != null)
        queryparams['TaskAssigneeIds'] = taskAssigneeIds;
      if (taskOwnerIds != null) queryparams['TaskOwnerIds'] = taskOwnerIds;
      if (text != null) queryparams['searchText'] = text;

      taskBloc..getTaskDashBoardData(queryparams: queryparams);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.taskListStatus == null
            ? ExpansionTile(
                collapsedBackgroundColor: Colors.grey[200],
                backgroundColor: Colors.grey[200],
                trailing: Icon(Icons.filter_list),
                title: _searchField(),
                children: [wrappedButtons()],
              )
            : ListTile(
                tileColor: Colors.grey[200],
                title: _searchField(),
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
                if (snapshot.data.data == null ||
                    snapshot.data.data.length == 0) {
                  return EmptyListWidget();
                }
                _taskList = snapshot.data.data;
                return Listizer(
                  listItems: _taskList,
                  filteredSearchList: _filteredTaskList,
                  itemBuilder: (context, index) {
                    return TaskListCard(
                      index: index,
                      taskList: _taskList,
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
      text = subjectController.text;
      apiCall();
    }
  }

  _setParamsToNull() {
    userId = null;
    taskStatusIds = null;
    taskAssigneeIds = null;
    taskOwnerIds = null;
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
            buttonText: 'More...',
            handleOnPressed: () => _moreFilter(),
          ),
        ],
      ),
    );
  }

  _homeFilter() {
    subjectController.text = '';
    _setParamsToNull();
    apiCall();
  }

  assignValues(dynamic value, FilterType filterType) {
    switch (filterType) {
      case FilterType.status:
        taskStatusIds = value;
        break;
      case FilterType.owner:
        taskOwnerIds = value;
        break;
      case FilterType.assignee:
        taskAssigneeIds = value;
        break;
      default:
        break;
    }
  }

  _moreFilter() {
    _setParamsToNull();
    filterData(dynamic value, FilterType filterType) {
      if (value != 'a8fc557a-9bb6-49ca-9ead-76ce0188563c')
        assignValues(value, filterType);
      apiCall();
    }

    Navigator.pushNamed(
      context,
      NTS_FILTER,
      arguments: ScreenArguments(
        func: filterData,
        ntstype: NTSType.task,
        val2: true,
      ),
    );
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
