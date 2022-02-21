import 'package:flutter/material.dart';
import 'package:hr_management/data/models/case_management_model/case_management_model.dart';
import 'package:hr_management/data/models/case_management_model/case_management_response.dart';
import 'package:hr_management/logic/blocs/case_management_bloc/pending_task_count_bloc/pending_task_count_bloc.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';

import '../../../../../themes/theme_config.dart';
import '../../../../widgets/progress_indicator.dart';

class TaskSummaryWidget extends StatefulWidget {
  TaskSummaryWidget();

  @override
  _TaskSummaryWidgetState createState() => _TaskSummaryWidgetState();
}

class _TaskSummaryWidgetState extends State<TaskSummaryWidget> {
  @override
  void initState() {
    super.initState();

    pendingTaskCountBloc
      ..getData(
        queryparams: _handleQueryparams(),
      );
  }

  _handleQueryparams() => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: StreamBuilder<CaseManagementResponse>(
        stream: pendingTaskCountBloc.subject.stream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return Center(
                child: Text(snapshot.data.error),
              );
            }

            return _bodyWidget(snapshot.data.data);
          } else {
            return CustomProgressIndicator();
          }
        },
      ),
    );
  }

  Widget _bodyWidget(List<CaseManagementModel>? data) {
    if (data == null || data.isEmpty)
      return Center(
        child: Text(
          "No data found.",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Theme.of(context).textHeadingColor,
              ),
        ),
      );

    return ListView.builder(
      itemCount: data.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return _eachListTile(
          data: data.elementAt(index),
        );
      },
    );
  }

  Widget _eachListTile({
    required CaseManagementModel data,
  }) {
    return Card(
      child: ListTile(
        title: Container(
          padding: DEFAULT_VERTICAL_PADDING,
          child: Text(data.name ?? "-"),
        ),
        subtitle: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'In Progress: \t',
                          style: TextStyle(
                            color: Colors.orange,
                          ),
                        ),
                        TextSpan(
                          text: data.inProgress.toString() ?? "-",
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Colors.black87,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Draft: \t',
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        TextSpan(
                          text: data.draft.toString() ?? "-",
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Colors.black87,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Overdue: \t',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        TextSpan(
                          text: data.overDue.toString() ?? "-",
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Colors.black87,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Completed: \t',
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                        TextSpan(
                          text: data.completed.toString() ?? "-",
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Colors.black87,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
