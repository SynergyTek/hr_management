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

class SelectTextField extends StatelessWidget {
  final String? title;
  final void Function(BuildContext)? callBack;
  final bool? isShowArrow;
  final String? hint;
  final String? validationMessage;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final FormFieldValidator<String>? validator;

  const SelectTextField(
      {this.title,
      this.callBack,
      this.isShowArrow,
      this.hint,
      this.validationMessage,
      this.controller,
      this.prefixIcon,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(bottom:0.0),
      alignment: Alignment.centerLeft,
      height: 65.0,
      child: Stack(
        children: <Widget>[
          TextFormField(
            style: Theme.of(context).textTheme.bodyText2,
            controller: controller,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                prefixIcon: prefixIcon ?? const Icon(Icons.select_all),
                suffixIcon: isShowArrow!
                    ? const Icon(Icons.keyboard_arrow_right)
                    : null,
                // filled: true,
                labelText: "Select " + title!,
                hintText: "Select " + hint!,
                errorStyle: const TextStyle(fontSize: 12.0)),
            maxLines: 1,
            validator: validator ??
                ((String value) => value.isEmpty ? validationMessage : null)
                    as String? Function(String?)?,
            onSaved: (String? value) {
              controller!.text = value!;
            },
          ),
          Visibility(
            visible: callBack != null,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
                callBack!(context);
              },
            ),
          )
        ],
      ),
    );
  }
}

class SelectDateField extends StatelessWidget {
  final void Function()? callBack;
  final bool? isShowArrow;
  final String? hint;
  final String? validationMessage;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final FormFieldValidator<String>? validator;

  const SelectDateField(
      {this.callBack,
      this.isShowArrow,
      this.hint,
      this.validationMessage,
      this.controller,
      this.prefixIcon,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.0,
      width: MediaQuery.of(context).size.width / 2 - 20,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              TextFormField(
                  controller: controller,
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: hint,
                    labelText: hint,
                    // suffixIcon: Icon(Icons.chevron_right),
                    labelStyle:
                        TextStyle(color: Theme.of(context).primaryColor),
                    // filled: true,
                    prefixIcon: const Icon(Icons.timer),
                  )),
              Container(
                color: Colors.grey,
                height: 1,
              )
            ],
          ),
          GestureDetector(
            onTap: callBack,
          ),
        ],
      ),
    );
  }
}

class StaticField extends StatelessWidget {
  final void Function()? callBack;
  final bool? isShowArrow;
  final String? hint;
  final String? validationMessage;
  final String? initialValue;
  final Widget? prefixIcon;
  final FormFieldValidator<String>? validator;
  final double? width;
  final TextEditingController? controller;
  final Icon? icon;
  final TextStyle? style;
  final Color? color;

  const StaticField({
    this.callBack,
    this.isShowArrow,
    this.hint,
    this.validationMessage,
    this.initialValue,
    this.prefixIcon,
    this.validator,
    this.controller,
    this.width,
    this.icon,
    this.style,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Colors.grey[350],
      // height: 65.0,
      width: width,
      child: Column(
        children: <Widget>[
          TextFormField(
              controller: controller,
              // initialValue: initialValue,
              enabled: false,
              decoration: InputDecoration(
                hintText: hint,
                labelText: hint,
                labelStyle:
                    style ?? TextStyle(color: Theme.of(context).primaryColor),
                // filled: true,
                prefixIcon: icon ?? const Icon(Icons.timer),
              )),
          Container(
            color: Colors.grey,
            height: 1,
          )
        ],
      ),
    );
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
