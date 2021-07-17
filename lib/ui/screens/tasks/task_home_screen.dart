import 'package:flutter/material.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/logic/blocs/task_bloc/task_bloc.dart';
import 'package:hr_management/routes/route_constants.dart';
import 'package:hr_management/routes/screen_arguments.dart';
import 'widget/task_home_body.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';

class TaskHomeScreen extends StatelessWidget {
  const TaskHomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerWidget(context),
      appBar: AppbarWidget(
        title: "Task Home",
      ),
      body: SafeArea(
        // child: InternetConnectivityWidget(
        child: TaskHomeBody(),
      ),
      // ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.add,
          size: 32,
        ),
        onPressed: () {
          taskBloc.subjectGetTaskDetails.sink.add(null);
          Navigator.pushNamed(
            context,
            NTS_TEMPLATE_REQUEST,
            arguments: ScreenArguments(
              ntstype: NTSType.task,
              arg4: 'STEP_TASK_CATEGORY',
            ),
          );
          // Navigator.pushNamed(
          //   context,
          //   CREATE_EDIT_TASK_ROUTE,
          //   arguments: ScreenArguments(
          //     arg1: 'PROJECT_ADHOC_TASK',
          //     arg2: '',
          //   ),
          // );
        },
      ),
    );
  }
}
