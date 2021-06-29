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
  ServiceResponseModel serviceModel;
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
              serviceModel = snapshot.data.data;
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
    List<Widget> widgets = [];
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
            rowChild(serviceModel.serviceNo, 'Service No'),
            rowChild(serviceModel.status.toString(), 'Status'),
            rowChild(serviceModel.versionNo.toString(), 'Version No'),
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
            style: TextStyle(color: Colors.blue[800], fontSize: 14),
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
          onListTap: (dynamic value) {
         
          },
        ));
      } else if (element.udfUIType == 9) {
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
        listDynamic.add(new DynamicNumberBoxWidget(
            element.name,
            element.labelName,
            new TextEditingController(text: element.name ?? "0"), (String val) {
          element.labelName = val.toString();
        }));
      } else if (element.udfUIType == 17) {
        listDynamic.add(new DynamicIntegerBoxWidget(
            element.name,
            element.labelName,
            new TextEditingController(text: element.name ?? "0"), (String val) {
          element.labelName = val.toString();
        }));
      } else if (element.udfUIType == 5) {
        listDynamic.add(new DynamicCheckBoxValue(
          code: element.labelName,
          name: element.name,
          key: new Key(element.udfUIType),
          checkUpdate: (bool check) {
            element.labelName = check.toString();
          },
        ));
      } else if (element.udfUIType == 1 || element.udfUIType == 2) {
        listDynamic.add(new DynamicTextBoxWidget(
            element.name,
            element.labelName,
            new TextEditingController(text: element.name),
            true,
            (String val) {}));
      } else if (element.udfUIType == 18) {
        return new DynamicLink(
            code: element.code, name: element.labelDisplayName);
      } else {
        listDynamic.add(new DynamicTextBoxWidget(
            element.name,
            element.labelName,
            new TextEditingController(text: element.name),
            false, (String val) {
          element.labelName = val.toString();
        }));
      }
    });
  }

}
