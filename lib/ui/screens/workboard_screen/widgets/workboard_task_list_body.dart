import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/logic/blocs/workboard_bloc/workboard_bloc.dart';
import 'package:hr_management/ui/screens/workboard_screen/widgets/workboard_task_dashboard_list.dart';
import '../../../../logic/blocs/user_model_bloc/user_model_bloc.dart';

class WorkboardTaskListBody extends StatefulWidget {
  const WorkboardTaskListBody({Key? key}) : super(key: key);

  @override
  _WorkboardTaskListBodyState createState() => _WorkboardTaskListBodyState();
}

class _WorkboardTaskListBodyState extends State<WorkboardTaskListBody> {
  int _selectedIndex = 0;
  List<Widget>? _widgetOptions = [];

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      WorkBoardTaskDashboardList(
          taskListStatus: null,
          onTap: true,
          totalTask: workboardBloc.subjectWorkboardTaskCount.valueOrNull,
          completedTask:
              workboardBloc.subjectWorkboardCompletedTaskCount.valueOrNull),
      WorkBoardTaskDashboardList(
          taskListStatus: 'TASK_STATUS_INPROGRESS',
          onTap: true,
          totalTask: workboardBloc.subjectWorkboardTaskCount.valueOrNull,
          completedTask:
              workboardBloc.subjectWorkboardCompletedTaskCount.valueOrNull),
      WorkBoardTaskDashboardList(
          taskListStatus: 'TASK_STATUS_COMPLETED',
          onTap: true,
          totalTask: workboardBloc.subjectWorkboardTaskCount.valueOrNull,
          completedTask:
              workboardBloc.subjectWorkboardCompletedTaskCount.valueOrNull)
    ];
  }

  void _onItemTapped(int index) {
    workboardBloc.subjectWorkboardTaskList.sink.add(null);
    Map<String, dynamic> queryparams = Map();

    if (index == 0) {
      queryparams['userId'] =
          BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '';

      queryparams['portalName'] = "HR";
      queryparams['status'] = null;

      workboardBloc
        ..getTaskDashBoardData(
          queryparams: queryparams,
        );
      // workboardBloc..getTaskDashBoardData(taskListStatus: null);
    } else if (index == 1) {
      // workboardBloc
      //   ..getTaskDashBoardData(taskListStatus: 'TASK_STATUS_INPROGRESS');
      queryparams['userId'] =
          BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '';

      queryparams['portalName'] = "HR";
      queryparams['status'] = "TASK_STATUS_INPROGRESS";

      workboardBloc
        ..getTaskDashBoardData(
          queryparams: queryparams,
        );
    } else {
      // workboardBloc
      //   ..getTaskDashBoardData(taskListStatus: 'TASK_STATUS_COMPLETED');

      queryparams['userId'] =
          BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '';

      queryparams['portalName'] = "HR";
      queryparams['status'] = "TASK_STATUS_COMPLETE";

      workboardBloc
        ..getTaskDashBoardData(
          queryparams: queryparams,
        );
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions!.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outline),
            label: 'All',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock),
            // icon: Icon(Icons.lock_clock_outlined),
            label: 'In Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done_all_outlined),
            label: 'Complete',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }

  @override
  void dispose() {
    _widgetOptions = null;
    super.dispose();
  }
}
