import 'package:flutter/material.dart';
import 'package:hr_management/data/models/attendance_view_models/attendance_view_models.dart';
import 'package:hr_management/themes/theme_config.dart';

import 'attendance_view_bottom_sheet_widget.dart';

class AttendanceViewListTileWidget extends StatelessWidget {
  final AttendanceViewModel eachAttendanceViewModelElement;

  AttendanceViewListTileWidget({
    @required this.eachAttendanceViewModelElement,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          ListTile(
            tileColor: _handleListTileColor(context),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
            child: ListTile(
              tileColor: Theme.of(context).notInvertedColor,
              title: Text(rosterHours()),
              subtitle: Text(actualHours()),
              trailing: Icon(Icons.chevron_right),
              onTap: () => _handleListTileOnTap(context),
            ),
          ),
        ],
      ),
    );
  }

  /// _handleListTileOnTap on tap event opens the bottom sheet with
  /// descripitive details of the employee access log.
  void _handleListTileOnTap(BuildContext context) {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return AttendanceViewBottomSheetWidget(
          eachAttendanceViewModelElement: eachAttendanceViewModelElement,
        );
      },
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

  /// Helper function that returns formatted employee name.
  String rosterHours() {
    return eachAttendanceViewModelElement?.rosterText ?? 'NA';
  }

  /// Helper function that returns formatted Punching time.
  String actualHours() {
    return eachAttendanceViewModelElement?.actualText ?? 'NA';
  }
}
