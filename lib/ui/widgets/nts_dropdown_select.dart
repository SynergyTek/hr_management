import 'package:flutter/material.dart';
import 'package:hr_management/routes/route_constants.dart';
import 'package:hr_management/routes/screen_arguments.dart';

typedef ListTapPressedCallBack = void Function(dynamic key);

class NTSDropDownSelect extends StatelessWidget {
  final String title;
  final bool isShowArrow;
  final String hint;
  final String validationMessage;
  final TextEditingController controller;
  final Widget prefixIcon;
  final FormFieldValidator<String> validator;
  final String url;
  final String idKey;
  final String nameKey;
  final ListTapPressedCallBack onListTap;
  NTSDropDownSelect(
      {Key key,
      this.title,
      this.isShowArrow,
      this.hint,
      this.validationMessage,
      this.controller,
      this.prefixIcon,
      this.validator,
      this.onListTap,
      this.url,
      this.idKey,
      this.nameKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      height: 80.0,
      child: Stack(
        children: <Widget>[
          new TextFormField(
            style: Theme.of(context).textTheme.bodyText2,
            controller: controller,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                prefixIcon:
                    prefixIcon != null ? prefixIcon : Icon(Icons.select_all),
                suffixIcon:
                    isShowArrow ? Icon(Icons.keyboard_arrow_right) : null,
                // filled: true,
                labelText: "Select " + title,
                hintText: "Select " + hint,
                errorStyle: TextStyle(fontSize: 11.0)),
            maxLines: 1,
            validator: validator != null
                ? validator
                : (val) =>
                    (val == null || val.isEmpty) ? validationMessage : null,
            onSaved: (String value) {
              controller.text = value;
            },
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.pushNamed(
                context,
                NTS_DROPDOWN,
                arguments: ScreenArguments(
                    arg1: url,
                    arg2: idKey,
                    arg3: nameKey,
                    arg4: title,
                    arg5: onListTap),
              );
            },
          )
        ],
      ),
    );
  }
}
