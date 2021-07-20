import 'package:flutter/material.dart';
import '../../../../data/enums/enums.dart';
import '../../../../data/models/worklist_dashboard/worklist_dashboard_response.dart';
import 'note_worklist.dart';
import 'task_worklist.dart';

class WorklistDashboardBody extends StatefulWidget {
  WorklistDashboardBody({Key key}) : super(key: key);

  @override
  _WorklistDashboardBodyState createState() => _WorklistDashboardBodyState();
}

class _WorklistDashboardBodyState extends State<WorklistDashboardBody> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = [];
  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      TaskWorklist(ntsType: NTSType.task,),
      TaskWorklist(ntsType: NTSType.service),
      NoteWorklist(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: StreamBuilder<WorklistDashboardResponse>(
          stream: null,
          builder: (context, snapshot) {
            return BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.task),
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
            );
          }),
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
