import 'package:flutter/material.dart';

import '../../../../../data/models/attendance_view_models/attendance_view_models.dart';
import '../../../../../themes/theme_config.dart';

class AttendanceViewBottomSheetWidget extends StatelessWidget {
  final AttendanceViewModel eachAttendanceViewModelElement;

  const AttendanceViewBottomSheetWidget({
    @required this.eachAttendanceViewModelElement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            16.0,
          ),
          topRight: Radius.circular(
            16.0,
          ),
        ),
      ),
      padding: DEFAULT_LARGE_PADDING,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // For basic details:
          ListTile(
            title: Text(
              eachAttendanceViewModelElement?.employeeName ?? '',
              style: TextStyle(
                color: Theme.of(context).textHeadingColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              eachAttendanceViewModelElement?.attDate ?? 'NA',
            ),
            trailing: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    // eachAttendanceViewModelElement?. ??
                    'NA',
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.headline6.fontSize,
                      color: _handleListTileColor(context),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Status"),
                ],
              ),
            ),
          ),

          // For Roster Text and Actual Text
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: ListTile(
                  title: Text(
                    "Roster \n(Time In - Time Out)",
                    // style: Theme.of(context).textTheme.bodyText1,
                  ),
                  subtitle: Text(
                    eachAttendanceViewModelElement?.rosterText ?? 'NA',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text(
                    "Actual \n(Time In - Time Out)",
                    // style: Theme.of(context).textTheme.bodyText1,
                  ),
                  subtitle: Text(
                    eachAttendanceViewModelElement?.actualText ?? 'NA',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ],
          ),

          // For Employee comments.
          ListTile(
            title: Text(
              "Employee Comments",
              // style: Theme.of(context).textTheme.bodyText1,
            ),
            subtitle: Text(
              eachAttendanceViewModelElement?.employeeComments ?? 'NA',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),

          // For Employee comments.
          ListTile(
            title: Text(
              "Employee Comments",
              // style: Theme.of(context).textTheme.bodyText1,
            ),
            subtitle: Text(
              eachAttendanceViewModelElement?.employeeComments ?? 'NA',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );
  }

  Color _handleListTileColor(BuildContext context) {
    // Guard clause
    // if (eachAttendanceViewModelElement?.devicePunchingType == null ||
    //     eachAttendanceViewModelElement.devicePunchingType.isNaN)
    //   return Colors.white54;

    // return eachAttendanceViewModelElement.devicePunchingType == 0
    //     ? Theme.of(context).textHeadingColor
    //     : Theme.of(context).invertedColor;

    return Theme.of(context).textHeadingColor;
  }
}
