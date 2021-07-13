import 'package:flutter/material.dart';

class SelectTextField extends StatelessWidget {
  final String title;
  final void Function(BuildContext) callBack;
  final bool isShowArrow;
  final String hint;
  final String validationMessage;
  final TextEditingController controller;
  final Widget prefixIcon;
  final FormFieldValidator<String> validator;

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
                errorStyle: TextStyle(fontSize: 12.0)),
            maxLines: 1,
            validator: validator != null
                ? validator
                : (String value) => value.isEmpty ? validationMessage : null,
            onSaved: (String value) {
              controller.text = value;
            },
          ),
          Visibility(
            visible: callBack != null,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
                callBack(context);
              },
            ),
          )
        ],
      ),
    );
  }
}

class SelectDateField extends StatelessWidget {
  final void Function() callBack;
  final bool isShowArrow;
  final String hint;
  final String validationMessage;
  final TextEditingController controller;
  final Widget prefixIcon;
  final FormFieldValidator<String> validator;

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
    return Container(
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
                    prefixIcon: Icon(Icons.timer),
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
  final void Function() callBack;
  final bool isShowArrow;
  final String hint;
  final String validationMessage;
  final String initialValue;
  final Widget prefixIcon;
  final FormFieldValidator<String> validator;
  final double width;
  final TextEditingController controller;

  const StaticField(
      {this.callBack,
      this.isShowArrow,
      this.hint,
      this.validationMessage,
      this.initialValue,
      this.prefixIcon,
      this.validator,
      this.controller,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.0,
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
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                // filled: true,
                prefixIcon: Icon(Icons.timer),
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
