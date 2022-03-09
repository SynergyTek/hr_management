import 'package:flutter/cupertino.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

enum FieldType {
  TextBox,
  NumberBox,
  DatePicker,
  TimePicker,
  CheckBox,
  CheckBoxGroup,
  DropDown,
  RadioButton,
  Switch,
}

class FormModel {
  // Specify the field type
  FieldType? fieldType;

  // Common for all fields
  String? labelName;

  // For number box and text box
  String? fieldName;
  bool? readOnly;
  TextFieldBloc? textFieldBloc;

  // For checkbox, date and time picker, dropdown, text and number box, radio button
  Icon? icon;

  //Date Time Picker specific fields
  bool? canSelectTime;

  //For date and time picker
  InputFieldBloc? inputFieldBloc;

  //For checkbox group
  MultiSelectFieldBloc? multiSelectFieldBloc;

  //For dropdown and radio button
  SelectFieldBloc? selectFieldBloc;

  //For switch and single checkbox
  BooleanFieldBloc? booleanFieldBloc;
  AlignmentGeometry? alignment;

  FormModel({
    this.labelName,
    this.fieldName,
    this.readOnly,
    this.textFieldBloc,
    this.icon,
    this.fieldType,
    this.canSelectTime,
    this.inputFieldBloc,
    this.multiSelectFieldBloc,
    this.selectFieldBloc,
    this.booleanFieldBloc,
    this.alignment,
  });
}
