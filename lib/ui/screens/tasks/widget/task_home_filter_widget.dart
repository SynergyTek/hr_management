import 'package:flutter/material.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/internet_connectivity_widget.dart';
import 'package:hr_management/ui/widgets/primary_button.dart';

class TaskHomeFilterWidget extends StatefulWidget {
  @override
  _TaskHomeFilterWidgetState createState() => _TaskHomeFilterWidgetState();
}

class _TaskHomeFilterWidgetState extends State<TaskHomeFilterWidget> {
  final List<String> filterOptions = [
    'Draft Task',
    'Canceled Task',
    'Completed Task',
    'Overdue Task',
    'Reject Task',
    'In Progress Task',
    'Assigned to me Task',
    'Requested by me Task',
    'Shared with me/Team Task',
  ];

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
                            optionsRow(icons: Icons.home, text: 'Home'),
                            optionsRow(
                                icons: Icons.calendar_today,
                                text: 'Pending Till Today'),
                            optionsRow(
                                icons: Icons.calendar_view_day,
                                text: 'Ending in Next 7 Days'),
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
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            if (showFilter)
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: filterOptions.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    title: Text(filterOptions[index]),
                                  );
                                },
                              )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrimaryButton(
                      buttonText: 'Cancel',
                      handleOnPressed: Navigator.pop,
                      width: 100,
                    ),
                    PrimaryButton(
                      buttonText: 'Apply',
                      handleOnPressed: Navigator.pop,
                      width: 100,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  optionsRow({IconData icons, String text, Function onTap}) {
    return InkWell(
      child: Row(
        children: [
          Icon(icons ?? null),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: TextStyle(fontSize: 14, color: Colors.grey[800]),
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
