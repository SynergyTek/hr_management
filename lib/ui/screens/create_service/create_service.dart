import 'package:flutter/material.dart';
import 'package:hr_management/data/models/form_fields.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/drawer/nav_drawer_widget.dart';
import 'package:hr_management/ui/widgets/form_widgets/bloc_checkbox_group_widget.dart';
import 'package:hr_management/ui/widgets/form_widgets/bloc_checkbox_widget.dart';
import 'package:hr_management/ui/widgets/form_widgets/bloc_date_picker_widget.dart';
import 'package:hr_management/ui/widgets/form_widgets/bloc_dropdown_widget.dart';
import 'package:hr_management/ui/widgets/form_widgets/bloc_number_box_widget.dart';
import 'package:hr_management/ui/widgets/form_widgets/bloc_radio_button_widget.dart';
import 'package:hr_management/ui/widgets/form_widgets/bloc_switch_widget.dart';
import 'package:hr_management/ui/widgets/form_widgets/bloc_text_box_widget.dart';
import 'package:hr_management/ui/widgets/form_widgets/bloc_time_picker_widget.dart';
import 'package:hr_management/ui/widgets/primary_button.dart';

class CreateServiceScreen extends StatefulWidget {
  const CreateServiceScreen({Key key}) : super(key: key);

  @override
  _CreateServiceScreenState createState() => _CreateServiceScreenState();
}

class _CreateServiceScreenState extends State<CreateServiceScreen> {
  TextEditingController subjectController = TextEditingController();
  List<Widget> widgetList = [];
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // addDynamicFields(model);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerWidget(context),
      appBar: AppbarWidget(
        title: "Create Service",
        actions: [
          IconButton(
            icon: Icon(Icons.attach_file),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.tag),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            height: 80,
            color: Colors.blue[100],
            child: Card(
              elevation: 0,
              color: Colors.blue[100],
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  rowChild('S-25.06.2021-5', 'Service No'),
                  rowChild('Draft', 'Status'),
                  rowChild('1', 'Version No'),
                ],
              ),
            ),
          ),
          textField(
              maxLines: 1, controller: subjectController, labelName: 'Subject'),
          textField(
              maxLines: 3,
              controller: descriptionController,
              labelName: 'Description'),
          Column(
            children: widgetList,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: PrimaryButton(
                  buttonText: 'Save As Draft',
                  handleOnPressed: () {},
                  width: 100,
                ),
              ),
              Expanded(
                child: PrimaryButton(
                  buttonText: 'Submit',
                  handleOnPressed: () {},
                  width: 100,
                ),
              ),
            ],
          )
        ],
      )),
    );
  }

  rowChild(String data, String field) {
    return Expanded(
      child: Column(
        children: [
          Text(
            data,
            style: TextStyle(color: Colors.blue[800], fontSize: 16),
          ),
          Text(
            field,
            style: TextStyle(color: Colors.grey[700], fontSize: 14),
          ),
        ],
      ),
    );
  }

  textField(
      {int maxLines, TextEditingController controller, String labelName}) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: TextField(
        maxLines: maxLines ?? 1,
        controller: controller,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          labelText: labelName,
          hintText: labelName,
        ),
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
        // onPressed: context.read<RegistrationFormBloc>().submit,
        child: Text('Register'),
      ),
    );
  }
}
