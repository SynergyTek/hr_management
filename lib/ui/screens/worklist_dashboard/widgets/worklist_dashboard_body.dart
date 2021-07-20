import 'package:flutter/material.dart';
import 'package:hr_management/logic/blocs/worklist_dashboard_bloc/worklist_dashboard_bloc.dart';

import 'task_worklist.dart';

class WorklistDashboardBody extends StatefulWidget {
  WorklistDashboardBody({Key key}) : super(key: key);

  @override
  _WorklistDashboardBodyState createState() => _WorklistDashboardBodyState();
}

class _WorklistDashboardBodyState extends State<WorklistDashboardBody> {
  int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> _widgetOptions = [];
  @override
  void initState() {
    super.initState();
    // worklistDashboardBloc..getWorklistDashboardHomeListData();
    _widgetOptions = <Widget>[
      TaskWorklist(),
      Text('Screen 2'),
      Text('Screen 3'),
    ];
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
            icon: Icon(Icons.file_copy),
            // icon: Icon(Icons.task),
            label: 'Task',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.miscellaneous_services),
            label: 'Service',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Note',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    _widgetOptions = null;
    super.dispose();
  }
}
