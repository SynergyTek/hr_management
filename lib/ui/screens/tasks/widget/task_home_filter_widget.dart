import 'package:flutter/material.dart';

import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/screens/tasks/widget/task_home_body.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/internet_connectivity_widget.dart';

class TaskHomeFilterWidget extends StatefulWidget {
  final FilterListTapCallBack onListTap;
  const TaskHomeFilterWidget({
    Key key,
    this.onListTap,
  }) : super(key: key);
  @override
  _TaskHomeFilterWidgetState createState() => _TaskHomeFilterWidgetState();
}

class _TaskHomeFilterWidgetState extends State<TaskHomeFilterWidget> {
  Map<String, String> filterOptionsMap = {
    "TASK_STATUS_DRAFT": "Draft Task",
    "TASK_STATUS_CANCEL": "Canceled Task",
    "TASK_STATUS_COMPLETE": "Completed Task",
    "TASK_STATUS_OVERDUE": "Overdue Task",
    "TASK_STATUS_REJECT": "Reject Task",
    "TASK_STATUS_INPROGRESS": "In Progress Task",
    "ASSIGN_TO": "Assigned to me Task",
    "ASSIGN_BY": "Requested by me Task",
    "SHARE_TO": "Shared with me/Team Task",
  };

  bool showFilter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Task Filter",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: Container(
            padding: DEFAULT_LARGE_PADDING,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            optionsRow(text: 'Modules'),
                            optionsRow(
                              text: 'Filters',
                              onTap: () {
                                setState(() {
                                  showFilter = !showFilter;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      VerticalDivider(color: Colors.grey),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            if (showFilter)
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: filterOptionsMap.keys.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    title: Text(filterOptionsMap[
                                        filterOptionsMap.keys
                                            .elementAt(index)]),
                                    onTap: () {
                                      widget.onListTap(filterOptionsMap.keys
                                          .elementAt(index));
                                      Navigator.pop(context);
                                    },
                                  );
                                },
                              )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     PrimaryButton(
                //       buttonText: 'Cancel',
                //       handleOnPressed: Navigator.pop,
                //       width: 100,
                //     ),
                //     PrimaryButton(
                //       buttonText: 'Apply',
                //       handleOnPressed: Navigator.pop,
                //       width: 100,
                //     )
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  optionsRow({String text, Function onTap}) {
    return InkWell(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
              ),
            ),
          ),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
      onTap: onTap,
    );
  }
}
