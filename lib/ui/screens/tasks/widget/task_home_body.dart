import 'package:flutter/material.dart';
import 'package:hr_management/data/models/task_models/task_list_model.dart';
import 'package:hr_management/data/models/task_models/task_list_resp_model.dart';
import '../../../../logic/blocs/task_bloc/task_bloc.dart';
import '../../../../themes/theme_config.dart';
import '../../../widgets/progress_indicator.dart';

import 'package:listizer/listizer.dart';

class TaskHomeBody extends StatefulWidget {
  TaskHomeBody({Key key}) : super(key: key);

  @override
  _TaskHomeBodyState createState() => _TaskHomeBodyState();
}

class _TaskHomeBodyState extends State<TaskHomeBody> {
  List<TaskListModel> _taskList = [];
  List<TaskListModel> _filteredTaskList = [];
  @override
  void initState() {
    super.initState();
    taskBloc..getTaskHomeListData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_LARGE_PADDING,
      child: StreamBuilder<TaskListResponseModel>(
          stream: taskBloc.subjectTaskList.stream,
          builder: (context, AsyncSnapshot snapshot) {
            print("Snapshot data: ${snapshot.data}");
            if (snapshot.hasData) {
              if (snapshot.data.error != null &&
                  snapshot.data.error.length > 0) {
                return Center(
                  child: Text(snapshot.data.error),
                );
              }

              return Listizer(
                showSearchBar: true,
                listItems: _taskList,
                filteredSearchList: _filteredTaskList,
                itemBuilder: (context, index) {
                  return ListTile(
                      // leading: TextCircleAvater(
                      //     text: _filteredTaskList[index].subject,
                      //     context: context,
                      //     radius: 20,
                      //     fontSize: 18,
                      //     color: Theme.of(context).primaryColorLight),
                      // title: Text(
                      //   _filteredTaskList[index].name != null
                      //       ? _filteredTaskList[index].name
                      //       : "",
                      //   maxLines: 2,
                      //   style: Theme.of(context).textTheme.headline6,
                      // ),
                      // onTap: () {
                      //   if (widget.onListTap != null) {
                      //     widget.onListTap(_filteredTaskList[index]);
                      //     Navigator.of(context).pop();
                      //   }
                      // },
                      );
                },
              );
            } else {
              return Center(
                child: CustomProgressIndicator(),
              );
            }
          }),
    );
  }
}
