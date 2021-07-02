import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hr_management/constants/formats.dart';
import 'package:hr_management/data/models/service_models/service_response.dart';
import 'package:hr_management/data/models/service_models/service_response_model.dart';
import 'package:hr_management/logic/blocs/service_bloc/service_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/custom_controls/selection_field_widget.dart';
import 'package:hr_management/ui/widgets/nts_dropdown_select.dart';
import 'package:hr_management/ui/widgets/nts_widgets.dart';
import 'package:hr_management/ui/widgets/primary_button.dart';

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

  TextEditingController _slaController = new TextEditingController();
  TextEditingController _startDateController = new TextEditingController();
  TextEditingController _endDateController = new TextEditingController();
  TextEditingController _reminderDateController = new TextEditingController();
  
  int difference = 0;
  DateTime startDate = DateTime.now();
  DateTime enddate = DateTime.now();
  final Map<String, String> udfJson = {};
  ServiceResponseModel serviceModel;
  @override
  void initState() {
    super.initState();
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
    widgets.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SelectDateField(
            controller: _startDateController,
            hint: 'Start Date',
            isShowArrow: true,
            callBack: () {
              // if (widget.templateMasterId != 0) {
              setState(() async {
                startDate = await _selectDate(context);
                _startDateController.text = dateformatter.format(startDate);
              });
              // }
            },
          ),
          SelectDateField(
            controller: _endDateController,
            hint: 'End Date',
            isShowArrow: true,
            callBack: () {
              // if (widget.templateMasterId != 0) {
                setState(() async {
                  enddate = await _selectDate(context);
                  var validate =
                      compareStartEndDate(startDate, enddate, context);
                  if (validate) {
                    setState(() {
                      difference = (enddate.difference(startDate)).inDays;
                      _slaController.text = difference.toString() + ' days';
                    });
                  } else {
                    enddate = startDate;
                  }
                  _endDateController.text = dateformatter.format(enddate);
                });
              // }
            },
          ),
        ],
      ),
    );

    widgets.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          StaticField(
            initialValue: serviceModel.serviceSLA, //difference.toString(),
            width: MediaQuery.of(context).size.width / 2 - 20,
            hint: 'SLA',
            controller: _slaController,
            // isShowArrow: true,
          ),
          SelectDateField(
            controller: _reminderDateController,
            hint: 'Reminder Date',
            isShowArrow: true,
            callBack: () {
              // if (widget.templateMasterId != 0) {
              //   setState(() async {
              //     reminderDate = await _selectDate(context);
              //     _reminderDateController.text =
              //         dateformatter.format(reminderDate);
              //   });
              // }
            },
          ),
        ],
      ),
    );

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

   Future<DateTime> _selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
    return selectedDate;
  }

  bool compareStartEndDate(
    DateTime startDate, DateTime enddate, BuildContext context) {
  if (enddate.isBefore(startDate)) {
  _showMyDialog();
    
    return false;
  } else {
    return true;
  }
}

Future<void> _showMyDialog() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Alert'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Start Date Should be greater than End Date.'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
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
            new TextEditingController(text: element.name ?? "0"), (String val) {
          udfJson[element.name] = val;
          element.labelName = val.toString();
        }));
      } else if (element.udfUIType == 17) {
        udfJson[element.name] = '';
        listDynamic.add(new DynamicIntegerBoxWidget(
            element.name,
            element.labelName,
            new TextEditingController(text: element.name ?? "0"), (String val) {
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
            element.name,
            element.labelName,
            new TextEditingController(text: element.name),
            false, (String val) {
          udfJson[element.name] = val;
          udfJson[element.name] = val;
        }));
      } else if (element.udfUIType == 18) {
        udfJson[element.name] = '';
        listDynamic.add(DynamicLink(code: element.code, name: element.name));
      } else {
        udfJson[element.name] = '';
        listDynamic.add(new DynamicTextBoxWidget(
            element.name,
            element.labelName,
            new TextEditingController(text: element.name),
            false, (String val) {
          udfJson[element.name] = val;
          element.labelName = val.toString();
        }));
      }
    });
  }

  serviceViewModelPostRequest() async {
    serviceModel.serviceSubject = subjectController.text;
    serviceModel.serviceDescription = descriptionController.text;
    serviceModel.dataAction = 1;
    serviceModel.serviceStatusCode = 'SERVICE_STATUS_INPROGRESS';
    serviceModel.json = jsonEncode(udfJson);
    print(udfJson);

    serviceBloc.postData(
      serviceResponseModel: serviceModel,
    );
  }
}
