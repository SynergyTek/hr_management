import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:hr_management/data/models/api_models/post_response_model.dart';
import 'package:hr_management/data/models/nts_dropdown/nts_dropdown_model.dart';
import 'package:hr_management/data/models/service_models/service_response.dart';
import 'package:hr_management/data/models/service_models/service_response_model.dart';
import 'package:hr_management/data/models/udf_json_model/udf_json_model.dart';
import 'package:hr_management/logic/blocs/service_bloc/service_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/form_widgets/bloc_date_picker_widget.dart';
import 'package:hr_management/ui/widgets/form_widgets/bloc_number_box_widget.dart';
import 'package:hr_management/ui/widgets/form_widgets/bloc_radio_button_widget.dart';
import 'package:hr_management/ui/widgets/form_widgets/bloc_text_box_widget.dart';
import 'package:hr_management/ui/widgets/nts_dropdown_select.dart';
import 'package:hr_management/ui/widgets/nts_widgets.dart';
import 'package:hr_management/ui/widgets/primary_button.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import 'package:hr_management/ui/widgets/snack_bar.dart';
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

  // to render UDFS
  List<Widget> columnComponentWidgets = [];
  List<Widget> componentComListWidgets = [];
  List<Widget> udfJsonCompWidgetList = [];

  TextEditingController descriptionController = TextEditingController();
  final Map<String, String> udfJson = {};
  ServiceResponseModel serviceModel;
  UdfJson udfJsonString;
  List<ColumnComponent> columnComponent = [];
  List<ComponentComponent> componentComList = [];
  final formReason = GlobalKey<FormState>();
  TextEditingController cancelReason = TextEditingController();
  DateTime startDate;
  DateTime dueDate;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    serviceBloc..getServiceDetail(widget.templateCode);
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

                parseJsonToUDFModel(createServiceFormBloc, serviceModel.json);

                return FormBlocListener<CreateServiceFormBloc, String, String>(
                  onSubmitting: (context, state) {
                    // if (createServiceFormBloc.startDate.value != null &&
                    //     createServiceFormBloc.endDate.value != null) {
                    //   compareStartEndDate(createServiceFormBloc.startDate.value,
                    //       createServiceFormBloc.endDate.value, context);
                    // }
                  },
                  onSuccess: (context, state) {},
                  onFailure: (context, state) {},
                  child: setServiceView(context, createServiceFormBloc,
                      serviceModel, columnComponent),
                );
              } else {
                return Center(
                  child: CustomProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  parseJsonToUDFModel(
      CreateServiceFormBloc createServiceFormBloc, udfJsonString) {
    columnComponent = [];
    componentComList = [];
    udfJsonString = UdfJson.fromJson(jsonDecode(udfJsonString));
    for (UdfJsonComponent component in udfJsonString.components) {
      if (component.columns != null && component.columns.isNotEmpty) {
        for (Columns column in component.columns) {
          for (ColumnComponent columnCom in column.components) {
            columnComponent.add(columnCom);
          }
        }
        if (component.components != null && component.components.isNotEmpty) {
          for (ComponentComponent componentComponent in component.components) {
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
      addDynamicComponentComponent(componentComList, createServiceFormBloc);
    }
    if (udfJsonString.components != null &&
        udfJsonString.components.isNotEmpty) {
      udfJsonCompWidgetList =
          addDynamic(udfJsonString.components, createServiceFormBloc);
    }
  }

  Widget setServiceView(
      BuildContext context,
      CreateServiceFormBloc createServiceFormBloc,
      ServiceResponseModel serviceModel,
      List<ColumnComponent> columnComponent) {
    createServiceFormBloc.subject
        .updateInitialValue(serviceModel.serviceSubject);
    createServiceFormBloc.description
        .updateInitialValue(serviceModel.serviceDescription);
    createServiceFormBloc.sla.updateInitialValue(serviceModel.serviceSLA);

    return Stack(
      children: [
        ListView(
          children:
              formFieldsWidgets(context, createServiceFormBloc, serviceModel),
        ),
        Column(
          children: <Widget>[
            Expanded(child: Container()),
            Container(
              height: 50,
              color: Colors.grey[100],
              child: displayFooterWidget(serviceModel, columnComponent),
            ),
          ],
        ),
        Visibility(
            visible: isVisible,
            child: Center(child: CustomProgressIndicator())),
      ],
    );
  }

  List<Widget> formFieldsWidgets(
      context, createServiceFormBloc, ServiceResponseModel serviceModel) {
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
          rowChild(serviceModel.serviceStatusName, 'Status', 2),
          rowChild(serviceModel.versionNo.toString(), 'Version No', 2),
        ],
      ),
    ));
    if (!serviceModel.hideSubject)
      widgets.add(BlocTextBoxWidget(
        fieldName: 'Subject',
        readonly: false,
        maxLines: 1,
        labelName: 'Subject',
        textFieldBloc: createServiceFormBloc.subject,
        prefixIcon: Icon(Icons.note),
      ));

    if (!serviceModel.hideStartDate)
      widgets.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            DynamicDateTimeBox(
              code: serviceModel.startDate,
              name: 'Start Date',
              key: new Key('Start Date'),
              selectDate: (DateTime date) {
                if (date != null) {
                  setState(() async {
                    startDate = date;
                  });
                  // udfJson[model[i].key] = date.toString();
                }
              },
            ),
            DynamicDateTimeBox(
              code: serviceModel.dueDate,
              name: 'Due Date',
              key: new Key('Due Date'),
              selectDate: (DateTime date) {
                if (date != null) {
                  setState(() async {
                    dueDate = date;
                    compareStartEndDate(startDate, dueDate, context);
                  });
                  // udfJson[model[i].key] = date.toString();
                }
              },
            )
          ],
        ),
      );

    if (!serviceModel.hideSLA)
      widgets.add(BlocTextBoxWidget(
        fieldName: 'SLA',
        readonly: false,
        maxLines: 1,
        labelName: 'SLA',
        textFieldBloc: createServiceFormBloc.sla,
        prefixIcon: Icon(Icons.note),
      ));

    if (!serviceModel.hideExpiryDate)
      widgets.add(BlocDatePickerWidget(
        labelName: 'Expiry Date',
        canSelectTime: false,
        inputFieldBloc: createServiceFormBloc.expiryDate,
        height: 75.0,
        width: MediaQuery.of(context).size.width / 2 - 20,
      ));

    if (!serviceModel.hideDescription)
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
    widgets.add(Container(
      height: 50,
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
            NTSDropdownModel _selectedIdNameViewModel = value;
            _ddController.text = _selectedIdNameViewModel.name;
            udfJson[model[i].label] = _selectedIdNameViewModel.id;
            // udfJson[model[i].label] = value.toString();
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
          nameKey: (model[i].template)
              .toString()
              .replaceAll('<span>{{', '')
              .replaceAll('}}</span>', '')
              .trim()
              .split('.')[1],
          idKey: model[i].idPath,
          url: model[i].data.url,
          onListTap: (dynamic value) {
            NTSDropdownModel _selectedIdNameViewModel = value;
            _ddController.text = _selectedIdNameViewModel.name;
            udfJson[model[i].label] = _selectedIdNameViewModel.id;
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

  displayFooterWidget(ServiceResponseModel serviceModel,
      List<ColumnComponent> columnComponent) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Visibility(
                visible: serviceModel.isCompleteButtonVisible,
                child: Expanded(
                  flex: 1,
                  child: PrimaryButton(
                    buttonText: 'Complete',
                    handleOnPressed: () {},
                    width: 100,
                  ),
                ),
              ),
              Visibility(
                visible: serviceModel.isCancelButtonVisible,
                child: Expanded(
                  flex: 1,
                  child: PrimaryButton(
                    buttonText: 'Cancel',
                    handleOnPressed: () {
                      if (serviceModel.isCancelReasonRequired)
                        enterReasonAlertDialog(context);
                    },
                    width: 100,
                  ),
                ),
              ),
              Visibility(
                visible: serviceModel.isCloseButtonVisible,
                child: Expanded(
                  flex: 1,
                  child: PrimaryButton(
                    buttonText: 'Close',
                    handleOnPressed: () {},
                    width: 100,
                  ),
                ),
              ),
              Visibility(
                visible: serviceModel.isDraftButtonVisible,
                child: PrimaryButton(
                  buttonText: 'Draft',
                  handleOnPressed: () {},
                  width: 100,
                ),
              ),
              Visibility(
                visible: serviceModel.isSubmitButtonVisible,
                child: PrimaryButton(
                  buttonText: 'Submit',
                  handleOnPressed: () {
                    bool isValid = false;
                    for (var i = 0; i < columnComponent.length; i++) {
                      if (columnComponent[i]?.validate?.required != null &&
                          columnComponent[i].validate.required == true &&
                          udfJson.containsKey(columnComponent[i].key) &&
                          (udfJson[columnComponent[i].key] == null ||
                              udfJson[columnComponent[i].key].isEmpty)) {
                        displaySnackBar(
                            text: 'Please enter ${columnComponent[i].label}',
                            context: context);
                        return;
                      }
                    }
                    serviceViewModelPostRequest();
                  },
                  width: 100,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  enterReasonAlertDialog(BuildContext context) {
    return showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Enter reason',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black),
          ),
          backgroundColor: Colors.grey[350],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          content: Form(
            key: formReason,
            child: new TextFormField(
              controller: cancelReason,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Please enter reason'),
              validator: (value) {
                return ((value == null || value.isEmpty)
                    ? 'Please Enter Reason'
                    : null);
              },
            ),
          ),
          actions: <Widget>[
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrimaryButton(
                    buttonText: 'Cancel',
                    handleOnPressed: () {
                      Navigator.of(context).pop();
                    },
                    width: 80,
                  ),
                  SizedBox(width: 2.w),
                  PrimaryButton(
                    buttonText: 'Save',
                    handleOnPressed: () {
                      if (formReason.currentState.validate()) {}
                      Navigator.of(context)
                          .pop(); //TODO:add appropriate save action
                    },
                    width: 80,
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  void compareStartEndDate(
      DateTime startDate, DateTime enddate, BuildContext context) {
    if (enddate.isBefore(startDate)) _showMyDialog();
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
                Text(''),
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

  String resultMsg = '';
  serviceViewModelPostRequest() async {
    serviceModel.ownerUserId = '45bba746-3309-49b7-9c03-b5793369d73c';
    serviceModel.requestedByUserId = '45bba746-3309-49b7-9c03-b5793369d73c';
    serviceModel.serviceSubject = subjectController.text;
    serviceModel.serviceDescription = descriptionController.text;
    serviceModel.dataAction = 1;
    serviceModel.serviceStatusCode = 'SERVICE_STATUS_INPROGRESS';
    serviceModel.json = jsonEncode(udfJson);
    print(udfJson);

    setState(() {
      isVisible = true;
    });

    PostResponse result = await serviceBloc.postData(
      serviceResponseModel: serviceModel,
    );
    print(result);
    if (result.isSuccess) {
      resultMsg = 'Leave Applied Successfully';
    } else {
      //  resultMsg = result.messages;
      resultMsg = 'SomeThing went wrong';
    }
    setState(() {
      isVisible = false;
    });
    displaySnackBar(text: resultMsg, context: context);
  }

  @override
  void dispose() {
    columnComponentWidgets = [];
    componentComListWidgets = [];
    udfJsonCompWidgetList = [];
    columnComponent = [];
    componentComList = [];
    super.dispose();
  }
}
