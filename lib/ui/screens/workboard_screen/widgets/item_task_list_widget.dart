import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/data/models/task_models/task_list_model.dart';
import 'package:hr_management/data/models/task_models/task_list_resp_model.dart';
import 'package:hr_management/logic/blocs/task_bloc/task_bloc.dart';
import 'package:hr_management/ui/screens/tasks/widget/task_list_tile.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';

import '../../../../logic/blocs/user_model_bloc/user_model_bloc.dart';

class ItemTaskListScreen extends StatefulWidget {
  ItemTaskListScreen({Key? key}) : super(key: key);

  @override
  State<ItemTaskListScreen> createState() => _ItemTaskListScreenState();
}

class _ItemTaskListScreenState extends State<ItemTaskListScreen> {
  List<TaskListModel>? taskList;

  @override
  void initState() {
    super.initState();
    apiCall();
  }

  apiCall() {
    taskBloc.getReadTaskList(
      queryparams: {
        "templateCodes": "WB_TASK",
        "portalName": BlocProvider.of<UserModelBloc>(context)
                .state
                .extraUserInformation
                ?.portalType ??
            "HR",
        "userId":
            BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
        "parentNoteId": "ed11f145-c1ed-4612-a620-81078b611f20",
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WorkBoard Task List'),
      ),
      body: StreamBuilder<TaskListResponseModel?>(
        stream: taskBloc.subjectReadTaskList.stream,
        builder: (BuildContext context,
            AsyncSnapshot<TaskListResponseModel?> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data?.data != null &&
                snapshot.data!.data!.isNotEmpty) {
              return ListView.builder(
                itemCount: taskList?.length,
                itemBuilder: (BuildContext context, int index) {
                  taskList = snapshot.data?.data;

                  return TaskListCard(index: index, taskList: taskList);
                },
              );
            } else {
              return Center(child: Text('No data Found'));
            }
          } else {
            return Center(
              child: CustomProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
