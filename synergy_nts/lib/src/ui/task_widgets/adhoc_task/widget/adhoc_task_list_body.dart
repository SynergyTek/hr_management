import 'package:flutter/material.dart';

import '../../../../bloc/task_bloc/abstract_task_bloc.dart';
import '../../../widgets/custom_progress_indicator.dart';
import '../../../widgets/empty_list_widget.dart';
import '../../../widgets/listizer.dart';
import '../../widgets/task_list_tile.dart';

class AdhocTaskListBody extends StatefulWidget {
  final String userId;

  const AdhocTaskListBody({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  _AdhocTaskListBodyState createState() => _AdhocTaskListBodyState();
}

class _AdhocTaskListBodyState extends State<AdhocTaskListBody> {
  List<TaskListModel>? _taskList = [];
  List<TaskListModel> _filteredTaskList = [];

  @override
  void initState() {
    super.initState();

    taskBloc.loadServiceAdhocTaskData(
      queryparams: {
        'userid': widget.userId,
        'userId': widget.userId,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: StreamBuilder<TaskListResponseModel?>(
            stream: taskBloc.subjectTaskList.stream,
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
                    return TaskListCard(
                      index: index,
                      taskList: _taskList,
                      onTap: true,
                    );
                  },
                );
              } else {
                return const Center(
                  child: CustomProgressIndicator(),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
