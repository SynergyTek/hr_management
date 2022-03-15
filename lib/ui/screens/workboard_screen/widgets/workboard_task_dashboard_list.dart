import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:hr_management/logic/blocs/workboard_bloc/workboard_bloc.dart';
import 'package:hr_management/ui/screens/workboard_screen/widgets/workboard_task_list_tile.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../widgets/empty_list_widget.dart';
import '../../../../data/enums/enums.dart';
import '../../../../data/models/task_models/task_list_model.dart';
import '../../../../data/models/task_models/task_list_resp_model.dart';
import '../../../../routes/route_constants.dart';
import '../../../../routes/screen_arguments.dart';
import '../../../widgets/progress_indicator.dart';
import '../../../listizer/listizer.dart';

typedef FilterListTapCallBack = void Function(dynamic key1, FilterType key2);

class WorkBoardTaskDashboardList extends StatefulWidget {
  final String? taskListStatus;
  final bool? onTap;
  final int? totalTask;
  final int? completedTask;

  WorkBoardTaskDashboardList(
      {Key? key,
      this.taskListStatus,
      this.onTap,
      this.totalTask,
      this.completedTask})
      : super(key: key);

  @override
  _WorkBoardTaskDashboardListState createState() =>
      _WorkBoardTaskDashboardListState();
}

class _WorkBoardTaskDashboardListState
    extends State<WorkBoardTaskDashboardList> {
  List<TaskListModel>? _taskList = [];
  List<TaskListModel> _filteredTaskList = [];
  TextEditingController subjectController = TextEditingController();
  FilterListTapCallBack? filterData;
  String? text;

  String? userId;
  String? taskStatusIds;
  String? taskAssigneeIds;
  String? taskOwnerIds;
  var completedCount = 0.0;
  var completedCountStr;
  var totalCount;

  @override
  void initState() {
    super.initState();
    apiCall();
  }

  apiCall() {
    workboardBloc.subjectWorkboardTaskList.sink.add(null);

    Map<String, dynamic> queryparams = Map();
    if (widget.taskListStatus != null) {
      queryparams['userId'] =
          BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '';

      queryparams['portalName'] = "HR";
      queryparams['status'] = widget.taskListStatus;

      workboardBloc
        ..getTaskDashBoardData(
          queryparams: queryparams,
        );
    } else {
      queryparams['userId'] =
          BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '';

      queryparams['portalName'] = "HR";
      workboardBloc
        ..getTaskDashBoardData(
          queryparams: queryparams,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    // if (widget.taskListStatus == "TASK_STATUS_COMPLETED" ||
    //     widget.taskListStatus == null) {
    completedCount = //_taskList
        // ?.where(
        //     (element) => element.taskStatusCode == "TASK_STATUS_COMPLETE")
        // .length
        widget.completedTask?.toDouble() ?? 0;

    // completedCount = 100 * completedCount;
    // } else {}
    completedCountStr = widget.completedTask;

    if (completedCount == totalCount) {
      completedCount = 1;
      completedCountStr = totalCount;
    } else {
      if (widget.completedTask.toString().length > 0) {
        var cnt = widget.completedTask.toString().length;
        var hval = "1";
        for (var i = 1; i <= cnt; i++) {
          hval += "0";
        }
        var value = int.parse(hval);
        completedCount = completedCount / value;
      }
    }

    totalCount = widget.totalTask ?? 0; // _taskList?.length ?? 0;
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
        Padding(
          padding: EdgeInsets.all(15.0),
          child: new LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 50,
            animation: true,
            lineHeight: 30.0,
            animationDuration: 2500,
            percent: completedCount,
            center: Text(
              completedCountStr.toString() +
                  " completed out of " +
                  totalCount.toString() +
                  " task",
              style: TextStyle(color: Colors.white),
            ),
            progressColor: Colors.green,
            barRadius: Radius.circular(20.0),
          ),
        ),
        Expanded(
          child: StreamBuilder<TaskListResponseModel?>(
            stream: workboardBloc.subjectWorkboardTaskList.stream,
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
                    return WorkBoardTaskListCard(
                      index: index,
                      taskList: _taskList,
                      onTap: widget.onTap ?? false,
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
    text = null;
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
    required String buttonText,
    Function? handleOnPressed,
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
        onPressed: () => handleOnPressed!(),
        child: Text(buttonText),
      ),
    );
  }
}
