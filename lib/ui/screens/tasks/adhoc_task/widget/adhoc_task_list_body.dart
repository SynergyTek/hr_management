import 'package:flutter/material.dart';
import '../../../../../data/models/task_models/task_list_model.dart';
import '../../../../../data/models/task_models/task_list_resp_model.dart';
import '../../../../../logic/blocs/task_bloc/task_bloc.dart';
import '../../widget/task_list_tile.dart';
import '../../../../widgets/empty_list_widget.dart';
import '../../../../widgets/progress_indicator.dart';
import 'package:listizer/listizer.dart';

class AdhocTaskListBody extends StatefulWidget {
  @override
  _AdhocTaskListBodyState createState() => _AdhocTaskListBodyState();
}

class _AdhocTaskListBodyState extends State<AdhocTaskListBody> {
  List<TaskListModel> _taskList = [];
  List<TaskListModel> _filteredTaskList = [];

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> queryparams = Map();
    taskBloc..loadServiceAdhocTaskData(queryparams: queryparams);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: StreamBuilder<TaskListResponseModel>(
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
                return Center(
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
