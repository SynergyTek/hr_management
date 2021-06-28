import 'package:flutter/material.dart';
import 'package:hr_management/data/models/form_fields.dart';
import 'package:hr_management/data/models/service_models/service_response.dart';
import 'package:hr_management/data/models/service_models/service_response_model.dart';
import 'package:hr_management/logic/blocs/service_bloc/service_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
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
import 'package:hr_management/ui/widgets/nts_dropdown_select.dart';
import 'package:hr_management/ui/widgets/nts_widgets.dart';
import 'package:hr_management/ui/widgets/primary_button.dart';

class CreateServiceScreenBody extends StatefulWidget {
  const CreateServiceScreenBody({Key key}) : super(key: key);

  @override
  _CreateServiceScreenBodyState createState() =>
      _CreateServiceScreenBodyState();
}

class _CreateServiceScreenBodyState extends State<CreateServiceScreenBody> {
  TextEditingController subjectController = TextEditingController();
  List<Widget> listDynamic = [];
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    serviceBloc..getData();
    // addDynamicFields(model);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: StreamBuilder<ServiceResponse>(
          stream: serviceBloc.subject.stream,
          builder: (context, AsyncSnapshot snapshot) {
            print("Snapshot data: ${snapshot.data}");
            if (snapshot.hasData) {
              if (snapshot.data.error != null &&
                  snapshot.data.error.length > 0) {
                return Center(
                  child: Text(snapshot.data.error),
                );
              }
              addDynamic(snapshot.data.data.columnList);
              return ListView(children: formFieldsWidgets());
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  List<Widget> formFieldsWidgets() {
    List<Widget> widgets = new List<Widget>();
    widgets.add(Container(
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
    ));

    widgets.add(textField(
        maxLines: 1, controller: subjectController, labelName: 'Subject'));

    widgets.add(textField(
        maxLines: 3,
        controller: descriptionController,
        labelName: 'Description'));

    widgets.addAll(listDynamic);

    widgets.add(Row(
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
    ));

    return widgets;
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
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(width: 1.0, color: Colors.white),
      ),
      child: Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(width: 1.0, color: Colors.white),
        ),
        child: TextField(
          maxLines: maxLines ?? 1,
          controller: controller,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            labelText: labelName,
            hintText: labelName,
          ),
        ),
      ),
    );
  }

  addDynamic(model) {
    //,
    //  String templateMasterName, String templateCategory) {
    model.forEach((element) {
      if (element.udfUIType == 6) {
        // 'NTS_DropDownList') {
        TextEditingController _ddController = new TextEditingController();
        // _ddController.text = element.code != null
        //     ? deriveDropDownValue(element.fieldDropDownItem, element.code)
        //     : null;
        listDynamic.add(NTSDropDownSelect(
          title: element.name,
          controller: _ddController,
          hint: element.name,
          // viewModelList: element.fieldDropDownItem,
          validationMessage: "Select " + element.name,
          isShowArrow: true,
          // onListTap: (dynamic value) {
          // IdNameViewModel _selectedIdNameViewModel;
          // _selectedIdNameViewModel = value;
          // _ddController.text = _selectedIdNameViewModel.name;
          // element.code = _selectedIdNameViewModel.code ??
          //     _selectedIdNameViewModel.id?.toString();
          // },
        ));
      } else if (element.udfUIType == 1) {
        // "NTS_DatePicker") {
        listDynamic.add(new DynamicDateTimeBox(
          // code: element.code != null
          //     ? element.code
          //         .toString()
          //         .substring(0, element.code.toString().indexOf('T'))
          //     : null,
          name: element.name,
          key: new Key(element.labelName),
          selectDate: (DateTime date) {
            if (date != null) {
              // element.code = date.toString();
              // if (templateCategory == "Leave Request" &&
              //     element.labelName == "startDate" &&
              //     templateMasterName != "Leave Adjustment" &&
              //     templateMasterName != "Leave Accrual") {
              //   leaveStartDate = date;
              //   updateLeaveDuration();
              //   if (templateMasterName == "Annual Leave") {
              //     updateLeaveBalance();
              //   }
              // } else if (templateCategory == "Leave Request" &&
              //     element.labelName == "endDate" &&
              //     templateMasterName != "Leave Adjustment" &&
              //     templateMasterName != "Leave Accrual") {
              //   leaveEnddate = date;
              //   updateLeaveDuration();
              // }
            }
          },
        ));
      } else if (element.udfUIType == 3) {
        // "NTS_NumericTextBox") {
        listDynamic.add(new DynamicNumberBoxWidget(
            element.name,
            element.labelName,
            new TextEditingController(text: element.name ?? "0"), (String val) {
          element.labelName = val.toString();
        }));
      } else if (element.udfUIType == 3) {
        // "NTS_IntegerTextBox") {
        listDynamic.add(new DynamicIntegerBoxWidget(
            element.name,
            element.labelName,
            new TextEditingController(text: element.name ?? "0"), (String val) {
          element.labelName = val.toString();
        }));
      } else if (element.udfUIType == 5) {
        // "NTS_CheckBox") {
        listDynamic.add(new DynamicCheckBoxValue(
          code: element.labelName,
          name: element.name,
          key: new Key(element.udfUIType),
          checkUpdate: (bool check) {
            element.labelName = check.toString();
          },
        ));
      } else if (element.udfUIType == 0) {
        // "NTS_Display") {
        // if (templateMasterName == "Annual Leave" &&
        //     element.labelName == "leaveBalance") {
        //   // leaveBalanace = element.code;
        // } else if (templateMasterName == "Annual Leave" &&
        //     element.labelName == "entitlement") {
        //   // leaveEntitlement = element.code;
        // }

        // if (templateCategory == "Leave Request" &&
        //     element.labelName == "leaveDuration" &&
        //     templateMasterName != "Leave Adjustment" &&
        //     templateMasterName != "Leave Accrual") {
        // leaveDurationController.text = element.value ?? element.code;
        // leaveDurationController.addListener(() {
        //   element.code = leaveDurationController.text.toString();
        // });
        // return new DynamicTextBoxWidget(element.labelDisplayName,
        //     element.labelName, leaveDurationController, true, (String val) {});
        // } else if (templateMasterName == "Annual Leave" &&
        // element.labelName == "leaveBalance") {
        // leaveBalanceController.text = element.value ?? element.code;
        // leaveBalanceController.addListener(() {
        //   element.code = leaveBalanceController.text.toString();
        // });
        // return new DynamicTextBoxWidget(element.labelDisplayName,
        //     element.labelName, leaveBalanceController, true, (String val) {});
        // } else {
        listDynamic.add(new DynamicTextBoxWidget(
            element.name,
            element.labelName,
            new TextEditingController(text:  element.name),
            true,
            (String val) {}));
        // }
        // } else if (element.fieldPartialViewName == "NTS_Hyperlink") {
        //   return new DynamicLink(
        //       code: element.code, name: element.labelDisplayName);
      } else {
        listDynamic.add(new DynamicTextBoxWidget(
            element.Name,
            element.labelName,
            new TextEditingController(text: element.name),
            false, (String val) {
          element.labelName = val.toString();
        }));
      }
    });
  }

  // addDynamic(List model) {
  //   model.forEach((element) {
  //     if (element.fieldPartialViewName == 'NTS_Group') {
  //       var table = new List<TableRow>();
  //       var groupControls = model
  //           .where((x) => x.groupTemplateFieldId == element.templateFieldId);
  //       groupControls?.forEach((group) {
  //         table.add(TableRow(children: [
  //           addGroupComponentsDynamic(
  //               group, model.templateMasterName, model.templateCategoryCode)
  //         ]));
  //       });
  //       listDynamic.add(Padding(
  //         padding: const EdgeInsets.only(top: 15, bottom: 10),
  //         child: Text(
  //           element.labelDisplayName,
  //           style: TextStyle(fontSize: 13.0, color: Colors.grey),
  //         ),
  //       ));
  //       listDynamic.add(Table(
  //         border: TableBorder(
  //           top: BorderSide(
  //             color: Colors.grey,
  //             style: BorderStyle.solid,
  //             width: 1.0,
  //           ),
  //           bottom: BorderSide(
  //             color: Colors.grey,
  //             style: BorderStyle.solid,
  //             width: 1.0,
  //           ),
  //           left: BorderSide(
  //             color: Colors.grey,
  //             style: BorderStyle.solid,
  //             width: 1.0,
  //           ),
  //           right: BorderSide(
  //             color: Colors.grey,
  //             style: BorderStyle.solid,
  //             width: 1.0,
  //           ),
  //         ),
  //         children: table,
  //       ));
  //     } else if (element.groupTemplateFieldId == null) {
  //       listDynamic.add(addGroupComponentsDynamic(
  //           element, model.templateMasterName, model.templateCategoryCode));
  //     }
  //   });
  // }

  // addDynamicFields(List model) {
  //   model.forEach((element) {
  //     if (element.udfUIType == 1) // FieldType.TextBox)
  //       widgetList.add(
  //         BlocTextBoxWidget(
  //           labelName: element.labelName,
  //           labelName: element.labelName,
  //           readonly: element.readOnly,
  //           textFieldBloc: element.textFieldBloc,
  //           prefixIcon: element.icon ?? null,
  //         ),
  //       );
  //     else if (element.udfUIType == 3) // FieldType.NumberBox)
  //       widgetList.add(
  //         BlocNumberBoxWidget(
  //           labelName: element.labelName,
  //           labelName: element.labelName,
  //           readonly: element.readOnly,
  //           textFieldBloc: element.textFieldBloc,
  //           prefixIcon: element.icon ?? null,
  //         ),
  //       );
  //     else if (element.udfUIType == 0) // FieldType.DatePicker)
  //       widgetList.add(
  //         BlocDatePickerWidget(
  //           labelName: element.labelName,
  //           canSelectTime: false,
  //           inputFieldBloc: element.inputFieldBloc,
  //           prefixIcon: element.icon ?? null,
  //         ),
  //       );
  //     else if (element.udfUIType == 6) // FieldType.DropDown)
  //       widgetList.add(
  //         BlocDropDownWidget(
  //           labelName: element.labelName,
  //           prefixIcon: element.icon ?? null,
  //           selectFieldBloc: element.selectFieldBloc,
  //         ),
  //       );
  //     // else if (element.fieldType ==5)// FieldType.CheckBoxGroup)
  //     //   widgetList.add(
  //     //     BlocCheckboxGroupWidget(
  //     //       labelName: element.labelName,
  //     //       prefixIcon: element.icon ?? null,
  //     //       multiSelectFieldBloc: element.multiSelectFieldBloc,
  //     //     ),
  //     //   );
  //     // else if (element.fieldType == 7)//FieldType.RadioButton)
  //     //   widgetList.add(
  //     //     BlocRadioButtonWidget(
  //     //       labelName: element.labelName,
  //     //       prefixIcon: element.icon ?? null,
  //     //       selectFieldBloc: element.selectFieldBloc,
  //     //     ),
  //     //   );
  //     // else if (element.fieldType ==8)// FieldType.TimePicker)
  //     //   widgetList.add(
  //     //     BlocTimePickerWidget(
  //     //       labelName: element.labelName,
  //     //       prefixIcon: element.icon ?? null,
  //     //       inputFieldBloc: element.inputFieldBloc,
  //     //     ),
  //     //   );
  //     // else if (element.fieldType == FieldType.Switch)
  //     //   widgetList.add(
  //     //     BlocSwitchWidget(
  //     //       labelName: element.labelName,
  //     //       booleanFieldBloc: element.booleanFieldBloc,
  //     //     ),
  //     //   );
  //     else if (element.udfUIType == 5) // FieldType.CheckBox)
  //       widgetList.add(
  //         BlocCheckBoxWidget(
  //           labelName: element.labelName,
  //           booleanFieldBloc: element.booleanFieldBloc,
  //         ),
  //       );
  //   });

  //   widgetList.add(
  //     ElevatedButton(
  //       // onPressed: context.read<RegistrationFormBloc>().submit,
  //       child: Text('Register'),
  //     ),
  //   );
  // }
}
