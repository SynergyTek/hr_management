import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hr_management/data/models/service_models/service_response.dart';
import 'package:hr_management/data/models/service_models/service_response_model.dart';
import 'package:hr_management/data/models/udf_json_model/udf_json_model.dart';
import 'package:hr_management/logic/blocs/service_bloc/service_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/nts_dropdown_select.dart';
import 'package:hr_management/ui/widgets/nts_widgets.dart';
import 'package:hr_management/ui/widgets/primary_button.dart';
import 'package:sizer/sizer.dart';

class CreateServiceScreenBody extends StatefulWidget {
  const CreateServiceScreenBody({Key key});

  @override
  _CreateServiceScreenBodyState createState() =>
      _CreateServiceScreenBodyState();
}

class _CreateServiceScreenBodyState extends State<CreateServiceScreenBody> {
  TextEditingController subjectController = TextEditingController();
  List<Widget> listDynamic = [];
  TextEditingController descriptionController = TextEditingController();
  final Map<String, String> udfJson = {};
  ServiceResponseModel serviceModel;
  UdfJson udfJsonString;
  List<ColumnComponent> columnComponent = [];
  List<ComponentComponent> componentComList = [];
  @override
  void initState() {
    super.initState();
    serviceBloc..getData();
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
              udfJsonString =
                  UdfJson.fromJson(jsonDecode(snapshot.data.data.json));
              for (UdfJsonComponent component in udfJsonString.components) {
                if (component.columns != null && component.columns.isNotEmpty) {
                  for (Columns column in component.columns) {
                    for (ColumnComponent columnCom in column.components) {
                      columnComponent.add(columnCom);
                    }
                  }
                  if (component.components != null &&
                      component.components.isNotEmpty) {
                    for (ComponentComponent componentComponent
                        in component.components) {
                      componentComList.add(componentComponent);
                    }
                  }
                }
              }

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
      height: 12.h,
      color: Colors.blue[100],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          rowChild(serviceModel.serviceNo, 'Service No'),
          rowChild(serviceModel.status.toString(), 'Status'),
          rowChild(serviceModel.versionNo.toString(), 'Version No'),
        ],
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
            handleOnPressed: () {
              serviceViewModelPostRequest();
            },
            width: 100,
          ),
        ),
        Expanded(
          child: PrimaryButton(
            buttonText: 'Submit',
            handleOnPressed: () {
              serviceViewModelPostRequest();
            },
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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

  addDynamic(model) {
    //,
    //  String templateMasterName, String templateCategory) {
    model.forEach((element) {
      if (element.udfUIType == 6) {
        udfJson[element.name] = '';
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
            udfJson[element.name] = value.toString();
          },
        ));
      } else if (element.udfUIType == 9) {
        udfJson[element.name] = '';
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
              udfJson[element.name] = date.toString();
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
        udfJson[element.name] = '';
        listDynamic.add(new DynamicNumberBoxWidget(
            element.name,
            element.labelName,
            new TextEditingController(text: "0"), (String val) {
          udfJson[element.name] = val;
          element.labelName = val.toString();
        }));
      } else if (element.udfUIType == 17) {
        udfJson[element.name] = '';
        listDynamic.add(new DynamicIntegerBoxWidget(
            element.name,
            element.labelName,
            new TextEditingController(text: "0"), (String val) {
          udfJson[element.name] = val;
          element.labelName = val.toString();
        }));
      } else if (element.udfUIType == 5) {
        udfJson[element.name] = '';
        listDynamic.add(new DynamicCheckBoxValue(
          code: element.labelName,
          name: element.name,
          key: new Key(element.udfUIType),
          checkUpdate: (bool check) {
            udfJson[element.name] = check.toString();
            element.labelName = check.toString();
          },
        ));
      } else if (element.udfUIType == 1 || element.udfUIType == 2) {
        udfJson[element.name] = '';
        listDynamic.add(new DynamicTextBoxWidget(
            element.name, element.labelName, new TextEditingController(), false,
            (String val) {
          udfJson[element.name] = val;
          udfJson[element.name] = val;
        }));
      } else if (element.udfUIType == 18) {
        udfJson[element.name] = '';
        listDynamic.add(DynamicLink(code: element.code, name: element.name));
      } else {
        udfJson[element.name] = '';
        listDynamic.add(new DynamicTextBoxWidget(
            element.name, element.labelName, new TextEditingController(), false,
            (String val) {
          udfJson[element.name] = val;
          element.labelName = val.toString();
        }));
      }
    });
  }

  serviceViewModelPostRequest() async {
    serviceModel.ownerUserId = '45bba746-3309-49b7-9c03-b5793369d73c';
    serviceModel.requestedByUserId = '45bba746-3309-49b7-9c03-b5793369d73c';
    serviceModel.serviceSubject = 'test Subject';
    serviceModel.serviceDescription = 'test description';
    serviceModel.dataAction = 1;
    serviceModel.serviceStatusCode = 'SERVICE_STATUS_INPROGRESS';
    serviceModel.json = jsonEncode(udfJson);
    print(jsonEncode(udfJson));
    serviceBloc.postData(
      serviceResponseModel: serviceModel,
    );
  }
}
