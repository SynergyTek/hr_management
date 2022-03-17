import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

import '../../theme/app_colors.dart';

export '../../theme/app_colors.dart';
export './label.dart';
export './primary_button.dart';
export './secondary_button.dart';
export './dotted_divider_widget.dart';
export './custom_progress_indicator.dart';
export '../../helpers/snackbar_helper/snackbar_helper.dart';
export './dotted_divider_widget.dart';

Map<String, Color> statusToColorMap = {
  "Rejected": Colors.red,
  "Complete": Colors.green.shade700,
  "Canceled": Colors.red,
  "Draft": Colors.amberAccent,
  "In Progress": Colors.blue,
  "Completed": Colors.green.shade700,
  "Overdue": Colors.orangeAccent,
};

Widget titleWidget({
  required BuildContext context,
  String caption = "",
  String title = "-",
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        caption,
        style: Theme.of(context).textTheme.caption!.copyWith(
              color: Colors.grey.shade700,
            ),
      ),
      Text(
        title,
        style: Theme.of(context).textTheme.headline6!.copyWith(
              fontSize: 12.sp,
              color: Colors.blue,
            ),
      ),
    ],
  );
}

Widget subtitleWidget({
  required BuildContext context,
  String caption = "",
  String title = "-",
  Widget? customChild,
  bool? isCentered = false,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment:
        isCentered! ? CrossAxisAlignment.center : CrossAxisAlignment.start,
    children: [
      Text(
        caption,
        style: Theme.of(context).textTheme.caption!.copyWith(
              color: AppThemeColor.textColorDark,
            ),
      ),
      customChild ??
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
    ],
  );
}

Widget statusContainerWidget({
  required Color statusColor,
}) {
  return Container(
    margin: EdgeInsets.only(
      right: 2.w,
    ),
    width: 4.w,
    height: 4.w,
    decoration: BoxDecoration(
      color: statusColor,
      shape: BoxShape.circle,
    ),
  );
}

String? formatDate({required String? date}) {
  if (date == null || date.isEmpty || date == '-') return "NA";

  try {
    return DateFormat('dd-MM-yyyy').format(DateTime.parse(date));
  } catch (e, _) {
    return date;
  }
}

class ExpandableField extends StatelessWidget {
  final TextEditingController? controller;
  final String? title;
  final List<Widget>? children;
  // final String hint;
  final Key? key;
  final bool? isTileExpanded;
  final ValueChanged? valueChanged;

  const ExpandableField(
      {this.controller,
      this.title,
      // this.hint,
      this.key,
      this.valueChanged,
      this.isTileExpanded,
      this.children});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: Padding(
        padding: EdgeInsets.only(bottom: 1.0),
        child: ExpansionTile(
            initiallyExpanded: false,
            // leading: Icon(Icons.calendar_today_sharp),
            trailing: isTileExpanded!
                ? Icon(Icons.keyboard_arrow_down)
                : Icon(Icons.keyboard_arrow_up),
            onExpansionChanged: (bool isexpand) {
              valueChanged!(isexpand);
            },
            title: Text(
              "Dates Detail",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            children: children!),
      ),
    );
  }
}
