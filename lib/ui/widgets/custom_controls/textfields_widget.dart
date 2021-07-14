import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DescriptionText extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hint;
  final Key key;

  const DescriptionText({
    this.controller,
    this.title,
    this.hint,
    this.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0.0),
      child: TextField(
        key: key,
        maxLines: 3,
        maxLength: 1000,
        cursorColor: Theme.of(context).primaryColor,
        controller: controller,
        // style: Theme.of(context).textTheme.body1,
        decoration: InputDecoration(
          hintText: hint,
          // filled: true,
          // hintStyle: Theme.of(context).textTheme.display3,
          labelText: title,
          // border: OutlineInputBorder() //InputBorder.none
        ),
      ),
    );
  }
}

class DescriptionTextWithValidation extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hint;
  final Key key;
  final String validationMessage;
  final FormFieldValidator<String> validator;
  final FocusNode textFocus;
  final TextInputType inputType;
  const DescriptionTextWithValidation({
    this.controller,
    this.title,
    this.hint,
    this.key,
    this.validationMessage,
    this.validator,
    this.textFocus,
    this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0.0),
      child: TextFormField(
        key: key,
        maxLines: 3,
        maxLength: 1000,
        cursorColor: Theme.of(context).primaryColor,
        controller: controller,
        focusNode: textFocus,
        textInputAction: TextInputAction.done,
        keyboardType: inputType,
        decoration: InputDecoration(
          hintText: hint,
          // filled: true,
          // hintStyle: Theme.of(context).textTheme.display3,
          labelText: title,
          // border: OutlineInputBorder() //InputBorder.none
        ),
        validator: validator != null
            ? validator
            : (String value) => value.isEmpty ? validationMessage : null,
      ),
    );
  }
}

class HollowTextBoxField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hint;
  final Icon prefixIcon;
  final TextInputType inputType;
  final String validationMessage;
  final FormFieldValidator<String> validator;
  final Key key;
  final Widget suffixWidget;
  final FocusNode textFocus;
  final List<TextInputFormatter> inputFormatter;

  const HollowTextBoxField(
      {this.controller,
      this.title,
      this.hint,
      this.prefixIcon,
      this.inputType,
      this.validationMessage,
      this.validator,
      this.key,
      this.suffixWidget,
      this.textFocus,
      this.inputFormatter});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
      child: TextFormField(
        focusNode: textFocus,
        key: key,
        textInputAction: TextInputAction.done,
        keyboardType: inputType,
        cursorColor: Theme.of(context).primaryColor,
        controller: controller,
        inputFormatters: inputFormatter,
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixWidget,
            hintText: hint,
            labelStyle: TextStyle(color: Theme.of(context).primaryColor),
            labelText: title,
            // filled: true,
            errorStyle: TextStyle(fontSize: 12.0)),
        maxLines: 1,
        validator: (validator != null)
            ? validator
            : (String value) => value.isEmpty ? validationMessage : null,
      ),
    );
  }
}

class FixedTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;

  final Icon prefixIcon;
  final TextInputType inputType;
  final Widget leadingWidget;
  final Key key;

  const FixedTextField(
      {this.controller,
      this.title,
      this.prefixIcon,
      this.inputType,
      this.key,
      this.leadingWidget});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingWidget != null ? leadingWidget : Container(),
      title: TextField(
        enabled: false,
        key: key,
        keyboardType: inputType,
        cursorColor: Theme.of(context).primaryColor,
        controller: controller,
        style: TextStyle(
            color: Color.fromRGBO(114, 114, 114, 1),
            fontSize: 18.0,
            fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: prefixIcon,
          labelText: title,
          labelStyle: TextStyle(color: Color.fromRGBO(139, 139, 139, 1)),
        ),
        maxLines: 1,
      ),
    );
  }
}

class ExpandableDescriptionField extends StatelessWidget {
  final TextEditingController controller;
  final String title;

  // final String hint;
  final Key key;
  final bool isTileExpanded;
  final ValueChanged valueChanged;

  const ExpandableDescriptionField(
      {this.controller,
      this.title,
      // this.hint,
      this.key,
      this.valueChanged,
      this.isTileExpanded});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.0),
        child: ExpansionTile(
          initiallyExpanded: true,
          leading: Icon(Icons.description),
          trailing: isTileExpanded
              ? Icon(Icons.keyboard_arrow_down)
              : Icon(Icons.keyboard_arrow_up),
          onExpansionChanged: (bool isexpand) {
            valueChanged(isexpand);
          },
          title: Text(
            "Add Descripition",
            // style: Theme.of(context).textTheme.body1,
          ),
          children: <Widget>[
            DescriptionText(
              controller: controller,
              hint: "Description",
            ),
          ],
        ),
      ),
    );
  }
}
