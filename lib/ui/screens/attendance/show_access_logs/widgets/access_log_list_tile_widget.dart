import 'package:flutter/material.dart';
import '../../../../../constants/formats.dart';
import '../../../../../data/models/access_log/access_log_model.dart';
import '../../../../../themes/theme_config.dart';
import 'access_log_bottom_sheet_widget.dart';

class AccessLogListTileWidget extends StatelessWidget {
  final AccessLogModel eachAccessLogModelElement;

  AccessLogListTileWidget({
    @required this.eachAccessLogModelElement,
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
              title: Text(employeeName()),
              subtitle: Text(punchingTime()),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    eachAccessLogModelElement?.devicePunchingTypeText ?? 'NA',
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyText1.fontSize,
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
        return AccessLogBottomSheetWidget(
          eachAccessLogModelElement: eachAccessLogModelElement,
        );
      },
    );
  }

  Color _handleListTileColor(BuildContext context) {
    // Guard clause
    if (eachAccessLogModelElement?.devicePunchingType == null ||
        eachAccessLogModelElement.devicePunchingType.isNaN)
      return Colors.white54;

    return eachAccessLogModelElement.devicePunchingType == 0
        ? Theme.of(context).textHeadingColor
        : Theme.of(context).invertedColor;
  }

  /// Helper function that returns formatted employee name.
  String employeeName() {
    return eachAccessLogModelElement?.personFullName ?? 'NA';
  }

  /// Helper function that returns formatted Punching time.
  String punchingTime() {
    return dateTimeformatter
            .format(DateTime.parse(eachAccessLogModelElement?.punchingTime)) ??
        'NA';
  }
}
