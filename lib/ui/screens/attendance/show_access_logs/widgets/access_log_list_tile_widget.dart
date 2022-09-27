import 'package:flutter/material.dart';

import '../../../../../constants/formats.dart';
import '../../../../../data/models/access_log/access_log_model.dart';
import '../../../../../themes/theme_config.dart';
import 'access_log_bottom_sheet_widget.dart';

class AccessLogListTileWidget extends StatelessWidget {
  final AccessLogModel eachAccessLogModelElement;

  AccessLogListTileWidget({
    required this.eachAccessLogModelElement,
  });

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
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: _handleListTileColor(context),
              width: MediaQuery.of(context).size.width * 0.015,
            ),
          ),
        ),
        child: ListTile(
          dense: true,
          tileColor: Theme.of(context).notInvertedColor,
          title: Text(employeeName()),
          subtitle: Text(punchingTime()),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                eachAccessLogModelElement.devicePunchingTypeText ?? '-',
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodyText1!.fontSize,
                  color: _handleListTileColor(context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.chevron_right),
            ],
          ),
          onTap: () => _handleListTileOnTap(context),
        ),
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
        return AccessLogBottomSheetWidget(
          eachAccessLogModelElement: eachAccessLogModelElement,
        );
      },
    );
  }

  Color _handleListTileColor(BuildContext context) {
    // Guard clause
    if (eachAccessLogModelElement.devicePunchingType == null ||
        eachAccessLogModelElement.devicePunchingType!.isNaN)
      return Colors.white54;

    return eachAccessLogModelElement.devicePunchingType == 0
        ? Theme.of(context).textHeadingColor
        : Theme.of(context).invertedColor;
  }

  /// Helper function that returns formatted employee name.
  String employeeName() {
    return eachAccessLogModelElement.personFullName ?? 'NA';
  }

  /// Helper function that returns formatted Punching time.
  String punchingTime() {
    return eachAccessLogModelElement.punchingTime == null
        ? 'NA'
        : dateTimeformatter.format(
            DateTime.parse(eachAccessLogModelElement.punchingTime!),
          );
  }
}
