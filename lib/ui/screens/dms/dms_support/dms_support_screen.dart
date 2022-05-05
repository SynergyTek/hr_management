import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/logic/blocs/task_bloc/task_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/drawer/nav_drawer_widget.dart';
import 'package:hr_management/ui/widgets/internet_connectivity_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:hr_management/themes/theme_config.dart';

import 'widget/dms_task_list.dart';

class DMSSupport extends StatefulWidget {
  @override
  _DMSSupportState createState() => _DMSSupportState();
}

class _DMSSupportState extends State<DMSSupport> {
  int _selectedIndex = 0;
  List<bool> isSelected = [true, false];
  List<Widget>? _widgetOptions = [];
  String requestBy = 'RequestedByMe';
  String taskListStatus = 'InProgress';

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      DMSTaskList(
        taskListStatus: 'InProgress',
        requestBy: requestBy,
      ),
      DMSTaskList(
        taskListStatus: 'Overdue',
        requestBy: requestBy,
      ),
      DMSTaskList(
        taskListStatus: 'Complete',
        requestBy: requestBy,
      )
    ];
    apiCall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppbarWidget(
        title: "DMS Support",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _toggle(),
              Expanded(
                child: _body(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _bottomNavigation(),
    );
  }

  void _onItemTapped(int index) {
    taskBloc.subjectTaskList.sink.add(null);
    if (index == 0) {
      taskListStatus = 'InProgress';
    } else if (index == 1) {
      taskListStatus = 'Overdue';
    } else {
      taskListStatus = 'Complete';
    }

    setState(() {
      _selectedIndex = index;
    });
    apiCall();
  }

  apiCall() {
    taskBloc.subjectTaskList.sink.add(null);
    Map<String, dynamic> queryparams = Map();
   
    queryparams['userId'] =
        BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '';

    // queryparams['templateCodes'] = 'DMS_SUPPORT_TICKET';
    // queryparams['categoryCodes'] = 'DMS_TASK';
    // queryparams['portalName'] = 'DMS';
    queryparams['requestby'] = requestBy;
    // queryparams['userId'] = '45bba746-3309-49b7-9c03-b5793369d73c';

    taskBloc
      ..getTaskDashBoardData(
        queryparams: queryparams,
        taskListStatus: taskListStatus,
      );
  }

  _toggle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        ToggleButtons(
          constraints: BoxConstraints.expand(width: 45.w, height: 5.h),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(1.w),
              child: Text('Requested By Me'),
            ),
            Padding(
              padding: EdgeInsets.all(1.w),
              child: Text('Assigned To Me'),
            ),
          ],
          isSelected: isSelected,
          textStyle: TextStyle(
            color: Theme.of(context).textHeadingColor,
            fontWeight: FontWeight.bold,
          ),
          color: Colors.blue[600],
          selectedColor: Colors.blue[800],
          fillColor: Colors.blue[100],
          highlightColor: Colors.blueAccent[700],
          borderColor: Colors.blue[300],
          borderWidth: 2,
          selectedBorderColor: Colors.blue[600],
          onPressed: (int index) {
            setState(() {
              isSelected.setAll(0, [false, false]);
              isSelected[index] = true;
              requestBy = index == 0 ? 'RequestedByMe' : 'AssignedToMe';
            });
            apiCall();
          },
        ),
      ],
    );
  }

  _body() {
    return _widgetOptions!.elementAt(_selectedIndex);
  }

  _bottomNavigation() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.work_outline),
          label: 'In Progress',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.lock),
          // icon: Icon(Icons.lock_clock_outlined),
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
    );
  }

  @override
  void dispose() {
    _widgetOptions = null;
    super.dispose();
  }
}
