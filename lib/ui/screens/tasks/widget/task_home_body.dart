import 'package:flutter/material.dart';
import 'package:hr_management/routes/route_constants.dart';
import '../../../../data/models/task_models/task_model.dart';
import '../../../../data/models/task_models/task_response_model.dart';
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
  List<TaskModel> _taskList = [];
  List<TaskModel> _filteredTaskList = [];
  @override
  void initState() {
    super.initState();
    taskBloc..getTaskHomeListData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_LARGE_PADDING,
      child: Column(
        children: [
          ListTile(
            trailing: Icon(Icons.filter_list),
            title: Text("Filter"),
            onTap: () {
              Navigator.pushNamed(
                context,
                TASK_FILTER,
              );
            },
          ),
          StreamBuilder<TaskResponseModel>(
              stream: taskBloc.subject.stream,
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
                    listItems: _taskList,
                    filteredSearchList: _filteredTaskList,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 4,
                        child: ListTile(
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
                            ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CustomProgressIndicator(),
                  );
                }
              }),
        ],
      ),
    );
  }
}
