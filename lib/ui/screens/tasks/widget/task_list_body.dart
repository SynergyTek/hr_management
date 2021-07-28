import 'package:flutter/material.dart';
import 'package:hr_management/logic/blocs/task_bloc/task_bloc.dart';
import 'package:hr_management/ui/screens/tasks/widget/task_dashboard_list.dart';

class TaskListBody extends StatefulWidget {
  const TaskListBody({Key key}) : super(key: key);

  @override
  _TaskListBodyState createState() => _TaskListBodyState();
}

class _TaskListBodyState extends State<TaskListBody> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = [];

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      TaskDashboardList(
        taskListStatus: 'InProgress',
      ),
      TaskDashboardList(
        taskListStatus: 'Overdue',
      ),
      TaskDashboardList(
        taskListStatus: 'Complete',
      )
    ];
  }

  void _onItemTapped(int index) {
    taskBloc.subjectTaskList.sink.add(null);
    if (index == 0) {
      taskBloc..getTaskDashBoardData(taskListStatus: 'InProgress');
    } else if (index == 1) {
      taskBloc..getTaskDashBoardData(taskListStatus: 'Overdue');
    } else {
      taskBloc..getTaskDashBoardData(taskListStatus: 'Complete');
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outline),
            label: 'In Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_clock),
            label: 'Overdue',
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
