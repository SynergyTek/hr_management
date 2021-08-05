import 'package:flutter/material.dart';

import '../../../data/enums/enums.dart';
import '../../../logic/blocs/task_bloc/task_bloc.dart';
import '../../../routes/route_constants.dart';
import '../../../routes/screen_arguments.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';
import 'widget/task_home_body.dart';

class TaskHomeScreen extends StatelessWidget {
  final String mode;
  final String taskStatus;
  final String moduleId;
  final bool showBack;
  const TaskHomeScreen({
    Key key,
    this.taskStatus,
    this.moduleId,
    this.mode,
    this.showBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: showBack ? null : drawerWidget(context),
      appBar: AppbarWidget(
        title: "Task Home",
      ),
      body: SafeArea(
        child: TaskHomeBody(
          mode: mode,
          moduleId: moduleId,
          taskStatus: taskStatus,
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
          taskBloc.subjectGetTaskDetails.sink.add(null);
          Navigator.pushNamed(
            context,
            NTS_TEMPLATE_REQUEST,
            arguments: ScreenArguments(
              ntstype: NTSType.task,
              arg4: '',//'STEP_TASK_CATEGORY',
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
