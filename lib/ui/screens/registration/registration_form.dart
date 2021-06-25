import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:hr_management/data/models/form_fields.dart';
import 'package:hr_management/logic/blocs/registration_form_bloc.dart';
import 'package:hr_management/ui/widgets/form_widgets/bloc_checkbox_group_widget.dart';
import 'package:hr_management/ui/widgets/form_widgets/bloc_checkbox_widget.dart';
import 'package:hr_management/ui/widgets/form_widgets/bloc_date_picker_widget.dart';
import 'package:hr_management/ui/widgets/form_widgets/bloc_dropdown_widget.dart';
import 'package:hr_management/ui/widgets/form_widgets/bloc_number_box_widget.dart';
import 'package:hr_management/ui/widgets/form_widgets/bloc_radio_button_widget.dart';
import 'package:hr_management/ui/widgets/form_widgets/bloc_switch_widget.dart';
import 'package:hr_management/ui/widgets/form_widgets/bloc_text_box_widget.dart';
import 'package:hr_management/ui/widgets/form_widgets/bloc_time_picker_widget.dart';

class RegistrationForm extends StatefulWidget {
  RegistrationForm({Key key}) : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  List<Widget> widgetList = [];
  List<FormModel> model = [];

  @override
  void initState() {
    super.initState();

    model.add(new FormModel(
        labelName: 'First Name',
        fieldName: 'firstName',
        readOnly: false,
        icon: Icon(Icons.person),
        fieldType: FieldType.TextBox,
        textFieldBloc: context.read<RegistrationFormBloc>().firstName));
    model.add(new FormModel(
        labelName: 'Last Name',
        fieldName: 'lastName',
        readOnly: false,
        icon: Icon(Icons.person),
        fieldType: FieldType.TextBox,
        textFieldBloc: context.read<RegistrationFormBloc>().lastName));
    model.add(new FormModel(
        labelName: 'Email',
        fieldName: 'email',
        readOnly: false,
        icon: Icon(Icons.email),
        fieldType: FieldType.TextBox,
        textFieldBloc: context.read<RegistrationFormBloc>().email));
    model.add(new FormModel(
        labelName: 'Phone Number',
        fieldName: 'phoneNumber',
        readOnly: false,
        icon: Icon(Icons.phone_android_sharp),
        fieldType: FieldType.NumberBox,
        textFieldBloc: context.read<RegistrationFormBloc>().phoneNumber));
    model.add(new FormModel(
        labelName: 'Phone number type',
        icon: Icon(Icons.home),
        fieldType: FieldType.RadioButton,
        selectFieldBloc: context.read<RegistrationFormBloc>().phoneNumberType));
    model.add(new FormModel(
        labelName: 'Date of Birth',
        canSelectTime: false,
        icon: Icon(Icons.calendar_today),
        fieldType: FieldType.DatePicker,
        inputFieldBloc: context.read<RegistrationFormBloc>().dob));
    model.add(new FormModel(
        labelName: 'Country',
        icon: Icon(Icons.map),
        fieldType: FieldType.DropDown,
        selectFieldBloc: context.read<RegistrationFormBloc>().country));
    model.add(new FormModel(
        labelName: 'Language',
        icon: Icon(Icons.language),
        fieldType: FieldType.CheckBoxGroup,
        multiSelectFieldBloc: context.read<RegistrationFormBloc>().language));
    model.add(new FormModel(
        labelName: 'Suitable Time',
        fieldType: FieldType.TimePicker,
        inputFieldBloc: context.read<RegistrationFormBloc>().suitableTime));
    model.add(new FormModel(
        labelName: 'Dark Mode On',
        fieldType: FieldType.Switch,
        booleanFieldBloc: context.read<RegistrationFormBloc>().mode));
    model.add(new FormModel(
        labelName: 'Save Data',
        fieldType: FieldType.CheckBox,
        booleanFieldBloc: context.read<RegistrationFormBloc>().saveData));

    addDynamicFields(model);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationFormBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: Text('Registration')),
            body: FormBlocListener<RegistrationFormBloc, String, String>(
              onSubmitting: (context, state) {},
              onSuccess: (context, state) {},
              onFailure: (context, state) {},
              child: SingleChildScrollView(
                child: AutofillGroup(
                  child: Column(
                    children: widgetList,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  addDynamicFields(List model) {
    model.forEach((element) {
      if (element.fieldType == FieldType.TextBox)
        widgetList.add(
          BlocTextBoxWidget(
            labelName: element.labelName,
            fieldName: element.fieldName,
            readonly: element.readOnly,
            textFieldBloc: element.textFieldBloc,
            prefixIcon: element.icon ?? null,
          ),
        );
      else if (element.fieldType == FieldType.NumberBox)
        widgetList.add(
          BlocNumberBoxWidget(
            labelName: element.labelName,
            fieldName: element.fieldName,
            readonly: element.readOnly,
            textFieldBloc: element.textFieldBloc,
            prefixIcon: element.icon ?? null,
          ),
        );
      else if (element.fieldType == FieldType.DatePicker)
        widgetList.add(
          BlocDatePickerWidget(
            labelName: element.labelName,
            canSelectTime: element.canSelectTime,
            inputFieldBloc: element.inputFieldBloc,
            prefixIcon: element.icon ?? null,
          ),
        );
      else if (element.fieldType == FieldType.DropDown)
        widgetList.add(
          BlocDropDownWidget(
            labelName: element.labelName,
            prefixIcon: element.icon ?? null,
            selectFieldBloc: element.selectFieldBloc,
          ),
        );
      else if (element.fieldType == FieldType.CheckBoxGroup)
        widgetList.add(
          BlocCheckboxGroupWidget(
            labelName: element.labelName,
            prefixIcon: element.icon ?? null,
            multiSelectFieldBloc: element.multiSelectFieldBloc,
          ),
        );
      else if (element.fieldType == FieldType.RadioButton)
        widgetList.add(
          BlocRadioButtonWidget(
            labelName: element.labelName,
            prefixIcon: element.icon ?? null,
            selectFieldBloc: element.selectFieldBloc,
          ),
        );
      else if (element.fieldType == FieldType.TimePicker)
        widgetList.add(
          BlocTimePickerWidget(
            labelName: element.labelName,
            prefixIcon: element.icon ?? null,
            inputFieldBloc: element.inputFieldBloc,
          ),
        );
      else if (element.fieldType == FieldType.Switch)
        widgetList.add(
          BlocSwitchWidget(
            labelName: element.labelName,
            booleanFieldBloc: element.booleanFieldBloc,
          ),
        );
      else if (element.fieldType == FieldType.CheckBox)
        widgetList.add(
          BlocCheckBoxWidget(
            labelName: element.labelName,
            booleanFieldBloc: element.booleanFieldBloc,
          ),
        );
    });

    widgetList.add(
      ElevatedButton(
        onPressed: context.read<RegistrationFormBloc>().submit,
        child: Text('Register'),
      ),
    );
  }
}
