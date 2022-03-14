import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../routes/route_constants.dart';
import '../../routes/screen_arguments.dart';

typedef ListTapPressedCallBack = void Function(dynamic key);

class NTSDropDownSelect extends StatelessWidget {
  final bool? isInitial;

  final String? title;
  final bool? isShowArrow;
  final bool? isPrefixIcon;

  final bool? isUserList;
  final bool? isTeamList;
  final String? hint;
  final String? validationMessage;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final FormFieldValidator<String>? validator;
  final String? url;
  final String? idKey;
  final String? nameKey;
  final ListTapPressedCallBack? onListTap;
  NTSDropDownSelect(
      {Key? key,
      this.title,
      this.isShowArrow,
      this.isUserList,
      this.isTeamList,
      this.hint,
      this.validationMessage,
      this.controller,
      this.prefixIcon,
      this.validator,
      this.onListTap,
      this.url,
      this.idKey,
      this.nameKey,
      this.isInitial = true,
      this.isPrefixIcon = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      height: 10.h,
      child: Stack(
        children: <Widget>[
          new TextFormField(
            style: Theme.of(context).textTheme.bodyText2,
            controller: controller,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                prefixIcon: (isPrefixIcon == false)
                    ? null
                    : ((prefixIcon != null && isPrefixIcon!)
                        ? prefixIcon
                        : Icon(Icons.select_all)),
                suffixIcon:
                    isShowArrow! ? Icon(Icons.keyboard_arrow_right) : null,
                // filled: true,
                labelText: (isInitial == true)
                    ? ("Select ") + (title ?? '')
                    : (title ?? ''),
                hintText: "Select " + hint!,
                errorStyle: TextStyle(fontSize: 11.0)),
            maxLines: 1,
            validator: validator != null
                ? validator
                : (val) =>
                    (val == null || val.isEmpty) ? validationMessage : null,
            onSaved: (String? value) {
              controller!.text = value!;
            },
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              if (isUserList != null && isUserList!) {
                Navigator.pushNamed(
                  context,
                  NTS_USER_DROPDOWN,
                  arguments: ScreenArguments(
                    func: onListTap,
                  ),
                );
              } else if (isTeamList != null && isTeamList!) {
                Navigator.pushNamed(
                  context,
                  NTS_TEAM_DROPDOWN,
                  arguments: ScreenArguments(
                    func: onListTap,
                  ),
                );
              } else {
                Navigator.pushNamed(
                  context,
                  NTS_DROPDOWN,
                  arguments: ScreenArguments(
                      arg1: url,
                      arg2: idKey,
                      arg3: nameKey,
                      arg4: title,
                      func: onListTap),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
