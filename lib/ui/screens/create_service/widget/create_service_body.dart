import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:hr_management/data/models/service_models/service_response.dart';
import 'package:hr_management/data/models/service_models/service_response_model.dart';
import 'package:hr_management/logic/blocs/service_bloc/service_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/form_widgets/bloc_date_picker_widget.dart';
import 'package:hr_management/ui/widgets/form_widgets/bloc_dropdown_widget.dart';
import 'package:hr_management/ui/widgets/form_widgets/bloc_number_box_widget.dart';
import 'package:hr_management/ui/widgets/form_widgets/bloc_radio_button_widget.dart';
import 'package:hr_management/ui/widgets/form_widgets/bloc_text_box_widget.dart';
import 'package:hr_management/ui/widgets/nts_widgets.dart';
import 'package:hr_management/ui/widgets/primary_button.dart';

import '../create_service_form_bloc.dart';

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
  @override
  void initState() {
    super.initState();
    serviceBloc..getData();
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
                addDynamic(
                  snapshot.data.data.columnList,
                  createServiceFormBloc,
                );

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
      height: 80,
      color: Colors.blue[100],
      child: Card(
        elevation: 0,
        color: Colors.blue[100],
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            rowChild(serviceModel.serviceNo, 'Service No', 3),
            rowChild(serviceModel.status.toString(), 'Status', 2),
            rowChild(serviceModel.versionNo.toString(), 'Version No', 2),
          ],
        ),
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

  addDynamic(model, createServiceFormBloc) {
    for (var i = 0; i < model.length; i++) {
      print(model[i].udfUIType);
      if (model[i].udfUIType == 1) {
        final textField$i = new TextFieldBloc();
        udfJson[model[i].name] = '';
        listDynamic.add(
          BlocTextBoxWidget(
            labelName: model[i].labelName,
            fieldName: model[i].labelName,
            readonly: false,
            textFieldBloc: textField$i,
            prefixIcon: Icon(Icons.note),
            maxLines: 1,
            onChanged: (value) {
              udfJson[model[i].name] = value.toString();
            },
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [textField$i]);
      } else if (model[i].udfUIType == 2) {
        final textArea$i = new TextFieldBloc();
        udfJson[model[i].name] = '';
        listDynamic.add(
          BlocTextBoxWidget(
            labelName: model[i].labelName,
            fieldName: model[i].labelName,
            readonly: false,
            textFieldBloc: textArea$i,
            prefixIcon: Icon(Icons.note),
            maxLines: 3,
            onChanged: (value) {
              udfJson[model[i].name] = value.toString();
            },
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [textArea$i]);
      } else if (model[i].udfUIType == 3) {
        final number$i = new TextFieldBloc();
        udfJson[model[i].name] = '';
        listDynamic.add(
          BlocNumberBoxWidget(
            labelName: model[i].labelName,
            fieldName: model[i].labelName,
            readonly: false,
            textFieldBloc: number$i,
            prefixIcon: null,
            onChanged: (value) {
              udfJson[model[i].name] = value.toString();
            },
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [number$i]);
      } else if (model[i].udfUIType == 4) {
        final password$i = new TextFieldBloc();
        udfJson[model[i].name] = '';
        listDynamic.add(
          BlocTextBoxWidget(
            labelName: model[i].labelName,
            fieldName: model[i].labelName,
            readonly: false,
            textFieldBloc: password$i,
            prefixIcon: null,
            obscureText: true,
            onChanged: (value) {
              udfJson[model[i].name] = value.toString();
            },
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [password$i]);
      } else if (model[i].udfUIType == 5) {
        udfJson[model[i].name] = '';
        listDynamic.add(new DynamicCheckBoxValue(
          code: model[i].labelName,
          name: model[i].name,
          key: new Key(model[i].udfUIType),
          checkUpdate: (bool check) {
            udfJson[model[i].name] = check.toString();
            model[i].labelName = check.toString();
          },
        ));
      } else if (model[i].udfUIType == 6) {
        final dropDown$i = new SelectFieldBloc();
        udfJson[model[i].name] = '';
        listDynamic.add(
          BlocDropDownWidget(
            labelName: model[i].labelName,
            selectFieldBloc: dropDown$i,
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [dropDown$i]);
      } else if (model[i].udfUIType == 7) {
        final radio$i = new SelectFieldBloc();
        udfJson[model[i].name] = '';
        listDynamic.add(
          BlocRadioButtonWidget(
            labelName: model[i].labelName,
            selectFieldBloc: radio$i,
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [radio$i]);
      } else if (model[i].udfUIType == 9) {
        udfJson[model[i].name] = '';
        listDynamic.add(new DynamicDateTimeBox(
          name: model[i].name,
          key: new Key(model[i].labelName),
          selectDate: (DateTime date) {
            if (date != null) {
              udfJson[model[i].name] = date.toString();
            }
          },
        ));
      } else if (model[i].udfUIType == 10) {
        udfJson[model[i].name] = '';
        listDynamic.add(new DynamicTimeBox(
          name: model[i].name,
          key: new Key(model[i].labelName),
          selectTime: (TimeOfDay time) {
            if (time != null) {
              udfJson[model[i].name] = time.toString();
            }
          },
        ));
      } else if (model[i].udfUIType == 12) {
        //Hidden Field
        final hidden$i = new TextFieldBloc();
        udfJson[model[i].name] = '';
        listDynamic.add(
          BlocTextBoxWidget(
            obscureText: true,
            labelName: model[i].labelName,
            fieldName: model[i].labelName,
            readonly: true,
            textFieldBloc: hidden$i,
            prefixIcon: null,
            maxLines: 1,
            onChanged: (value) {
              udfJson[model[i].name] = value.toString();
            },
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [hidden$i]);
      } else if (model[i].udfUIType == 17) {
        //Phone Number Field
        final phoneNumber$i = new TextFieldBloc();
        udfJson[model[i].name] = '';
        listDynamic.add(
          BlocNumberBoxWidget(
            labelName: model[i].labelName,
            fieldName: model[i].labelName,
            readonly: false,
            textFieldBloc: phoneNumber$i,
            prefixIcon: null,
            onChanged: (value) {
              udfJson[model[i].name] = value.toString();
            },
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [phoneNumber$i]);
      } else if (model[i].udfUIType == 19) {
        //Email Field
        final email$i =
            new TextFieldBloc(validators: [FieldBlocValidators.email]);
        udfJson[model[i].name] = '';
        listDynamic.add(
          BlocTextBoxWidget(
            labelName: model[i].labelName,
            fieldName: model[i].labelName,
            readonly: false,
            textFieldBloc: email$i,
            prefixIcon: null,
            maxLines: 1,
            onChanged: (value) {
              udfJson[model[i].name] = value.toString();
            },
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [email$i]);
      }
    }
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
