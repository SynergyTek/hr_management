import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:hr_management/data/models/api_models/post_response_model.dart';
import 'package:hr_management/data/models/service_models/service_response.dart';
import 'package:hr_management/data/models/service_models/service_response_model.dart';
import 'package:hr_management/data/models/udf_json_model/udf_json_model.dart';
import 'package:hr_management/logic/blocs/service_bloc/service_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/form_widgets/bloc_date_picker_widget.dart';
import 'package:hr_management/ui/widgets/form_widgets/bloc_dropdown_widget.dart';
import 'package:hr_management/ui/widgets/form_widgets/bloc_number_box_widget.dart';
import 'package:hr_management/ui/widgets/form_widgets/bloc_radio_button_widget.dart';
import 'package:hr_management/ui/widgets/form_widgets/bloc_text_box_widget.dart';
import 'package:hr_management/ui/widgets/nts_dropdown_select.dart';
import 'package:hr_management/ui/widgets/nts_widgets.dart';
import 'package:hr_management/ui/widgets/primary_button.dart';
import 'package:sizer/sizer.dart';

import '../create_service_form_bloc.dart';

class CreateServiceScreenBody extends StatefulWidget {
  final String templateCode;
  const CreateServiceScreenBody({Key key, this.templateCode});

  @override
  _CreateServiceScreenBodyState createState() =>
      _CreateServiceScreenBodyState();
}

class _CreateServiceScreenBodyState extends State<CreateServiceScreenBody> {
  TextEditingController subjectController = TextEditingController();
  List<Widget> columnComponentWidgets = [];
  List<Widget> componentComListWidgets = [];
  TextEditingController descriptionController = TextEditingController();
  final Map<String, String> udfJson = {};
  ServiceResponseModel serviceModel;
  UdfJson udfJsonString;
  List<ColumnComponent> columnComponent = [];
  List<ComponentComponent> componentComList = [];
  @override
  void initState() {
    super.initState();
    serviceBloc..getData(widget.templateCode);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateServiceFormBloc(),
      child: Container(
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
                final createServiceFormBloc =
                    context.read<CreateServiceFormBloc>();
                serviceModel = snapshot.data.data;
                columnComponent = [];
                componentComList = [];
                udfJsonString =
                    UdfJson.fromJson(jsonDecode(snapshot.data.data.json));
                for (UdfJsonComponent component in udfJsonString.components) {
                  if (component.columns != null &&
                      component.columns.isNotEmpty) {
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
                if (columnComponent != null && columnComponent.isNotEmpty) {
                  columnComponentWidgets = addDynamic(
                    columnComponent,
                    createServiceFormBloc,
                  );
                }
                if (componentComList != null && componentComList.isNotEmpty) {
                  addDynamicComponentComponent(
                      componentComList, createServiceFormBloc);
                }

                return FormBlocListener<CreateServiceFormBloc, String, String>(
                  onSubmitting: (context, state) {
                    if (createServiceFormBloc.startDate.value != null &&
                        createServiceFormBloc.endDate.value != null) {
                      compareStartEndDate(createServiceFormBloc.startDate.value,
                          createServiceFormBloc.endDate.value, context);
                    }
                  },
                  onSuccess: (context, state) {},
                  onFailure: (context, state) {},
                  child: ListView(
                      children:
                          formFieldsWidgets(context, createServiceFormBloc)),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  List<Widget> formFieldsWidgets(context, createServiceFormBloc) {
    List<Widget> widgets = [];
    widgets.add(Container(
      padding: EdgeInsets.all(8.0),
      height: 12.h,
      color: Colors.blue[100],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          rowChild(serviceModel.serviceNo, 'Service No', 3),
          rowChild(serviceModel.status.toString(), 'Status', 2),
          rowChild(serviceModel.versionNo.toString(), 'Version No', 2),
        ],
      ),
    ));

    widgets.add(BlocTextBoxWidget(
      fieldName: 'Subject',
      readonly: false,
      maxLines: 1,
      labelName: 'Subject',
      textFieldBloc: createServiceFormBloc.subject,
      prefixIcon: Icon(Icons.note),
    ));

    // widgets.add(BlocDatePickerWidget(
    //   labelName: 'Start Date',
    //   canSelectTime: false,
    //   inputFieldBloc: createServiceFormBloc.startDate,
    // ));

    // widgets.add(BlocDatePickerWidget(
    //   labelName: 'Due Date',
    //   canSelectTime: false,
    //   inputFieldBloc: createServiceFormBloc.endDate,
    // ));
    widgets.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BlocDatePickerWidget(
            labelName: 'Start Date',
            canSelectTime: false,
            inputFieldBloc: createServiceFormBloc.startDate,
            height: 75.0,
            width: MediaQuery.of(context).size.width / 2 - 20,
          ),
          BlocDatePickerWidget(
            labelName: 'Due Date',
            canSelectTime: false,
            inputFieldBloc: createServiceFormBloc.endDate,
            height: 75.0,
            width: MediaQuery.of(context).size.width / 2 - 20,
          )
        ],
      ),
    );

    widgets.add(BlocTextBoxWidget(
      fieldName: 'SLA',
      readonly: false,
      maxLines: 1,
      labelName: 'SLA',
      textFieldBloc: createServiceFormBloc.sla,
      prefixIcon: Icon(Icons.note),
    ));

    widgets.add(BlocTextBoxWidget(
      fieldName: 'Description',
      readonly: false,
      maxLines: 3,
      labelName: 'Description',
      textFieldBloc: createServiceFormBloc.description,
      prefixIcon: Icon(Icons.note),
    ));
    if (columnComponentWidgets != null && columnComponentWidgets.isNotEmpty) {
      widgets.addAll(columnComponentWidgets);
    }
    if (componentComListWidgets != null && componentComListWidgets.isNotEmpty) {
      widgets.addAll(componentComListWidgets);
    }
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
              createServiceFormBloc.submit();
            },
            width: 100,
          ),
        ),
      ],
    ));

    return widgets;
  }

  rowChild(String data, String field, int flex) {
    return Expanded(
      flex: flex ?? 0,
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

  List<Widget> addDynamic(model, createServiceFormBloc) {
    List<Widget> listDynamic = [];
    for (var i = 0; i < model.length; i++) {
      print(model[i].type);
      if (model[i].type == 'textfield') {
        final textField$i = new TextFieldBloc();
        udfJson[model[i].key] = '';
        listDynamic.add(
          BlocTextBoxWidget(
            labelName: model[i].label,
            fieldName: model[i].label,
            readonly: false,
            textFieldBloc: textField$i,
            prefixIcon: Icon(Icons.note),
            maxLines: 1,
            onChanged: (value) {
              udfJson[model[i].key] = value.toString();
            },
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [textField$i]);
      } else if (model[i].type == 'textarea') {
        final textArea$i = new TextFieldBloc();
        udfJson[model[i].key] = '';
        listDynamic.add(
          BlocTextBoxWidget(
            labelName: model[i].label,
            fieldName: model[i].label,
            readonly: false,
            textFieldBloc: textArea$i,
            prefixIcon: Icon(Icons.note),
            maxLines: 3,
            onChanged: (value) {
              udfJson[model[i].key] = value.toString();
            },
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [textArea$i]);
      } else if (model[i].type == 'number') {
        final number$i = new TextFieldBloc();
        udfJson[model[i].key] = '';
        listDynamic.add(
          BlocNumberBoxWidget(
            labelName: model[i].label,
            fieldName: model[i].label,
            readonly: false,
            textFieldBloc: number$i,
            prefixIcon: Icon(Icons.format_list_numbered),
            onChanged: (value) {
              udfJson[model[i].key] = value.toString();
            },
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [number$i]);
      } else if (model[i].type == 'password') {
        final password$i = new TextFieldBloc();
        udfJson[model[i].key] = '';
        listDynamic.add(
          BlocTextBoxWidget(
            labelName: model[i].label,
            fieldName: model[i].label,
            readonly: false,
            textFieldBloc: password$i,
            prefixIcon: Icon(Icons.visibility_off_rounded),
            obscureText: true,
            onChanged: (value) {
              udfJson[model[i].key] = value.toString();
            },
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [password$i]);
      } else if (model[i].type == 'checkbox') {
        udfJson[model[i].key] = '';
        listDynamic.add(new DynamicCheckBoxValue(
          code: model[i].label,
          name: model[i].label,
          key: new Key(model[i].type),
          checkUpdate: (bool check) {
            udfJson[model[i].key] = check.toString();
            // model[i].value = check.toString();
          },
        ));
      } else if (model[i].type == 'selectboxes') {
        TextEditingController _ddController = new TextEditingController();
        listDynamic.add(NTSDropDownSelect(
          title: model[i].label,
          controller: _ddController,
          hint: model[i].label,
          validationMessage: "Select " + model[i].label,
          isShowArrow: true,
          nameKey: model[i].template,
          idKey: model[i].idPath,
          url: model[i].data,
          onListTap: (dynamic value) {
            udfJson[model[i].label] = value.toString();
          },
        ));
      } else if (model[i].type == 'radio') {
        final radio$i = new SelectFieldBloc();
        udfJson[model[i].key] = '';
        listDynamic.add(
          BlocRadioButtonWidget(
            labelName: model[i].label,
            selectFieldBloc: radio$i,
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [radio$i]);
      } else if (model[i].type == 'select') {
        TextEditingController _ddController = new TextEditingController();
        listDynamic.add(NTSDropDownSelect(
          title: model[i].label,
          controller: _ddController,
          hint: model[i].label,
          validationMessage: "Select " + model[i].label,
          isShowArrow: true,
          nameKey: model[i].template,
          idKey: model[i].idPath,
          url: model[i].data.url,
          onListTap: (dynamic value) {
            udfJson[model[i].label] = value.toString();
          },
        ));
      } else if (model[i].type == 'datetime') {
        udfJson[model[i].key] = '';
        listDynamic.add(new DynamicDateTimeBox(
          name: model[i].key,
          key: new Key(model[i].label),
          selectDate: (DateTime date) {
            if (date != null) {
              udfJson[model[i].key] = date.toString();
            }
          },
        ));
      } else if (model[i].type == 'time') {
        udfJson[model[i].key] = '';
        listDynamic.add(new DynamicTimeBox(
          name: model[i].label,
          key: new Key(model[i].label),
          selectTime: (TimeOfDay time) {
            if (time != null) {
              udfJson[model[i].key] = time.toString();
            }
          },
        ));
      } else if (model[i].type == 'hidden') {
        //Hidden Field
        final hidden$i = new TextFieldBloc();
        udfJson[model[i].key] = '';
        listDynamic.add(
          BlocTextBoxWidget(
            obscureText: true,
            labelName: model[i].label,
            fieldName: model[i].label,
            readonly: true,
            textFieldBloc: hidden$i,
            prefixIcon: Icon(Icons.visibility),
            maxLines: 1,
            onChanged: (value) {
              udfJson[model[i].key] = value.toString();
            },
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [hidden$i]);
      } else if (model[i].type == 'phoneNumber') {
        //Phone Number Field
        final phoneNumber$i = new TextFieldBloc();
        udfJson[model[i].key] = '';
        listDynamic.add(
          BlocNumberBoxWidget(
            labelName: model[i].label,
            fieldName: model[i].label,
            readonly: false,
            textFieldBloc: phoneNumber$i,
            prefixIcon: Icon(Icons.phone_rounded),
            onChanged: (value) {
              udfJson[model[i].key] = value.toString();
            },
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [phoneNumber$i]);
      } else if (model[i].type == 'email') {
        //Email Field
        final email$i =
            new TextFieldBloc(validators: [FieldBlocValidators.email]);
        udfJson[model[i].key] = '';
        listDynamic.add(
          BlocTextBoxWidget(
            labelName: model[i].label,
            fieldName: model[i].label,
            readonly: false,
            textFieldBloc: email$i,
            prefixIcon: Icon(Icons.email),
            maxLines: 1,
            onChanged: (value) {
              udfJson[model[i].key] = value.toString();
            },
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [email$i]);
      } else {
        final textField$i = new TextFieldBloc();
        udfJson[model[i].key] = '';
        listDynamic.add(
          BlocTextBoxWidget(
            labelName: model[i].label,
            fieldName: model[i].label,
            readonly: false,
            textFieldBloc: textField$i,
            prefixIcon: Icon(Icons.note),
            maxLines: 1,
            onChanged: (value) {
              udfJson[model[i].key] = value.toString();
            },
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [textField$i]);
      }
    }
    return listDynamic;
  }

  addDynamicComponentComponent(model, createServiceFormBloc) {
    List<TableRow> table = [];
    // var groupControls = model?.controls
    //     ?.where((x) => x.groupTemplateFieldId == element.templateFieldId);
    // groupControls?.forEach((group) {
    var tableWidgets = addDynamic(model, createServiceFormBloc);
    table.add(TableRow(children: tableWidgets));
    // });
    // listDynamic.add(Padding(
    //   padding: const EdgeInsets.only(top: 15, bottom: 10),
    //   child: Text(
    //     element.labelDisplayName,
    //     style: TextStyle(fontSize: 13.0, color: Colors.grey),
    //   ),
    // ));
    componentComListWidgets.add(Table(
      border: TableBorder(
        top: BorderSide(
          color: Colors.grey,
          style: BorderStyle.solid,
          width: 1.0,
        ),
        bottom: BorderSide(
          color: Colors.grey,
          style: BorderStyle.solid,
          width: 1.0,
        ),
        left: BorderSide(
          color: Colors.grey,
          style: BorderStyle.solid,
          width: 1.0,
        ),
        right: BorderSide(
          color: Colors.grey,
          style: BorderStyle.solid,
          width: 1.0,
        ),
      ),
      children: table,
    ));
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

  Future<void> _showPostAlertMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Something went wrong'),
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

  Future<void> _showPostAlertMyDialog2() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Leave Applied Successfully'),
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

  serviceViewModelPostRequest() async {
    serviceModel.ownerUserId = '45bba746-3309-49b7-9c03-b5793369d73c';
    serviceModel.requestedByUserId = '45bba746-3309-49b7-9c03-b5793369d73c';
    serviceModel.serviceSubject = subjectController.text;
    serviceModel.serviceDescription = descriptionController.text;
    serviceModel.dataAction = 1;
    serviceModel.serviceStatusCode = 'SERVICE_STATUS_INPROGRESS';
    serviceModel.json = jsonEncode(udfJson);
    print(udfJson);

    PostResponse result = await serviceBloc.postData(
      serviceResponseModel: serviceModel,
    );
    if (result.isSuccess) {
      _showPostAlertMyDialog2();
    } else {
      _showPostAlertMyDialog();
    }
    print(result);
  }
}
