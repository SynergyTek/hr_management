import 'package:flutter/material.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/data/models/worklist_dashboard/worklist_dashboard_response.dart';
import 'package:hr_management/routes/route_constants.dart';
import 'package:hr_management/routes/screen_arguments.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';

import 'widgets/note_worklist.dart';
import 'widgets/task_worklist.dart';

class WorklistDashboard extends StatefulWidget {
  const WorklistDashboard({Key key}) : super(key: key);

  @override
  _WorklistDashboardState createState() => _WorklistDashboardState();
}

class _WorklistDashboardState extends State<WorklistDashboard> {
  int _selectedIndex = 0;
  NTSType ntsType = NTSType.task;
  List<Widget> _widgetOptions = [];
  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      TaskWorklist(
        ntsType: NTSType.task,
      ),
      TaskWorklist(ntsType: NTSType.service),
      NoteWorklist(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerWidget(context),
      appBar: AppbarWidget(
        title: "Worklist Dashboard",
      ),
      body: SafeArea(
        // child: InternetConnectivityWidget(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      // ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.add,
          size: 32,
        ),
        onPressed: () {
          if (ntsType == NTSType.task) {
            Navigator.pushNamed(
              context,
              NTS_TEMPLATE_REQUEST,
              arguments: ScreenArguments(
                ntstype: NTSType.task,
                arg4: 'STEP_TASK_CATEGORY',
              ),
            );
          } else if (ntsType == NTSType.service) {
            Navigator.pushNamed(
              context,
              NTS_TEMPLATE_REQUEST,
              arguments: ScreenArguments(
                ntstype: NTSType.service,
                arg4: '',
              ),
            );
          } else if (ntsType == NTSType.note) {
            // Navigator.pushNamed(
            //   context,
            //   ADD_EDIT_NOTE_ROUTE,
            //   arguments: ScreenArguments(
            //     arg1: '',
            //   ),
            // );
          }
        },
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
      if (_selectedIndex == 0) {
        ntsType = NTSType.task;
      } else if (_selectedIndex == 1) {
        ntsType = NTSType.service;
      } else if (_selectedIndex == 2) {
        ntsType = NTSType.note;
      }
    });
  }

  @override
  void dispose() {
    _widgetOptions = null;
    super.dispose();
  }
}
