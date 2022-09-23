import 'package:flutter/material.dart';
import 'package:hr_management/ui/widgets/dotted_divider_widget.dart';
import '../../../../data/models/task_models/task_list_model.dart';
import '../../../../logic/blocs/task_bloc/task_bloc.dart';
import '../../../../routes/route_constants.dart';
import '../../../../routes/screen_arguments.dart';
import '../../../widgets/widgets.dart';

class TaskListCard extends StatelessWidget {
  final bool? onTap;
  final int index;
  final List<TaskListModel>? taskList;
  const TaskListCard(
      {Key? key, required this.index, required this.taskList, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: GestureDetector(
        onTap: onTap!
            ? () {
                taskBloc.subjectGetTaskDetails.sink.add(null);
                Navigator.pushNamed(
                  context,
                  CREATE_EDIT_TASK_ROUTE,
                  arguments: ScreenArguments(
                    arg1: '',
                    arg2: taskList![index].taskActionId,
                    // arg2: taskList![index].id,
                    arg3: taskList![index].taskSubject,
                  ),
                  // arg3: _taskList[index].templateMasterCode),
                );
              }
            : () {},
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: statusToColorMap[taskStatusName(index)] ??
                    Colors.transparent,
                width: MediaQuery.of(context).size.width * 0.015,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: titleWidget(
                      context: context,
                      caption: taskNoValue(index),
                      title: taskSubject(index),
                    ),
                  ),
                  Expanded(
                    child: subtitleWidget(
                      context: context,
                      caption: "Status",
                      customChild: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            taskStatusName(index),
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02),
                          statusContainerWidget(
                            statusColor:
                                statusToColorMap[taskStatusName(index)] ??
                                    Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              DottedDividerWidget(),
              Row(
                children: <Widget>[
                  Flexible(
                    child: Text(
                      ownerUserName(index),
                      style: TextStyle(color: Colors.deepPurple[900]),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(" to "),
                  Flexible(
                    child: Text(
                      assigneeDisplayName(index),
                      style: TextStyle(color: Colors.deepPurple[900]),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: subtitleWidget(
                      context: context,
                      caption: "Requested Date",
                      title: requestedDate(index),
                    ),
                  ),
                  Expanded(
                    child: subtitleWidget(
                      context: context,
                      caption: "Due Date",
                      title: dueDate(index),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  String taskSubject(int index) {
    return taskList?[index].serviceName ?? "-";
  }

  String taskNoValue(int index) {
    return taskList?[index].taskNo ?? "-";
  }

  String ownerUserName(int index) {
    return taskList?[index].serviceOwner ?? "-";
  }

  String assigneeDisplayName(int index) {
    return taskList?[index].assigneeUserName ?? "-";
  }

  String taskStatusName(int index) {
    return taskList?[index].taskStatusName ?? "-";
  }

  // String dueDateDisplay(int index) {
  //   return taskList?[index].dueDateDisplay ?? "-";
  // }

  String dueDate(int index) {
    if (taskList?[index].dueDate != null &&
        taskList![index].dueDate!.isNotEmpty &&
        taskList![index].dueDate!.contains("T")) {
      return taskList![index].dueDate!.split("T")[0];
    } else {
      return taskList?[index].dueDate ?? "-";
    }
  }

  String requestedDate(int index) {
    if (taskList?[index].createdDate != null &&
        taskList![index].createdDate!.isNotEmpty &&
        taskList![index].createdDate!.contains("T")) {
      return taskList![index].createdDate!.split("T")[0];
    } else {
      return taskList?[index].createdDate ?? "-";
    }
  }
}
