import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:hr_management/data/helpers/download_helper/download_helper_new.dart';
import 'package:hr_management/data/helpers/download_helper/downloader_screen/downloader.dart';
import 'package:hr_management/ui/widgets/custom_controls/attachment_widget.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:hr_management/ui/widgets/custom_controls/selection_field_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../data/enums/enums.dart';
import '../../../../data/models/api_models/post_response_model.dart';
import '../../../../data/models/nts_dropdown/nts_dd_res_model.dart';
import '../../../../data/models/nts_dropdown/nts_dropdown_model.dart';
import '../../../../data/models/service_models/service.dart';
import '../../../../data/models/service_models/service_response.dart';
import '../../../../data/models/udf_json_model/udf_json_model.dart';
import '../../../../data/models/user/user.dart';
import '../../../../data/repositories/nts_dropdown_repo/nts_dropdown_repo.dart';
import '../../../../logic/blocs/nts_dropdown_bloc/nts_dropdown_api_bloc.dart';
import '../../../../logic/blocs/service_bloc/service_bloc.dart';
import '../../../../logic/blocs/user_bloc/user_bloc.dart';
import '../../../../routes/route_constants.dart';
import '../../../../routes/screen_arguments.dart';
import '../../../../themes/theme_config.dart';
import '../../../widgets/appbar_widget.dart';
import '../../../widgets/form_widgets/bloc_date_picker_widget.dart';
import '../../../widgets/form_widgets/bloc_number_box_widget.dart';
import '../../../widgets/form_widgets/bloc_radio_button_widget.dart';
import '../../../widgets/form_widgets/bloc_text_box_widget.dart';
import '../../../widgets/nts_dropdown_select.dart';
import '../../../widgets/nts_widgets.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/progress_indicator.dart';
import '../../../widgets/snack_bar.dart';
import '../create_service_form_bloc.dart';

class CreateServiceScreenBody extends StatefulWidget {
  final bool? isLeave;
  final String? serviceId;
  final String? templateCode;
  final String? title;
  const CreateServiceScreenBody(
      {Key? key, this.serviceId, this.isLeave, this.templateCode, this.title});

  @override
  _CreateServiceScreenBodyState createState() =>
      _CreateServiceScreenBodyState();
}

class _CreateServiceScreenBodyState extends State<CreateServiceScreenBody> {
  // to render UDFS
  List<Widget> columnComponentWidgets = [];
  List<Widget> componentComListWidgets = [];
  List<Widget> udfJsonCompWidgetList = [];

  final Map<String?, String?> udfJson = {};
  Service postServiceModel = new Service();
  UdfJson? udfJsonString;
  List<ColumnComponent> columnComponent = [];
  List<ComponentComponent> componentComList = [];
  List<UdfJsonComponent> udfJsonComponent = [];
  final formReason = GlobalKey<FormState>();
  TextEditingController cancelReason = TextEditingController();
  DateTime? startDate;
  DateTime? dueDate;
  bool isVisible = false;
  List<String?> selectValue = [];
  String? subjectValue;
  String? descriptionValue;
  String? slaValue;
  String? ownerUserId;
  Service? serviceModel;
  DateTime? leaveStartDate;
  DateTime? leaveEnddate;

  bool isTileVisible = true;
  TextEditingController leaveDurationControllerCalendarDays =
      new TextEditingController();
  TextEditingController leaveDurationControllerWorkingDays =
      new TextEditingController();
  TextEditingController _fromddController = new TextEditingController();

  void updateLeaveDuration() {
    if (leaveStartDate != null && leaveEnddate != null) {
      var durationCalendarDays = leaveEnddate!.difference(leaveStartDate!);

      setState(() {
        leaveDurationControllerCalendarDays.text =
            (durationCalendarDays.inDays + 1).toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();

    serviceBloc
      ..getServiceDetail(
        queryparams: _handleQueryParams(),
      );
  }

  _handleQueryParams() {
    return {
      'templatecode': widget.templateCode ?? '',
      'serviceId': widget.serviceId ?? '',
      'userId':
          BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
      'userid':
          BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
    };
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => CreateServiceFormBloc(),
        child: Container(
          padding: DEFAULT_PADDING,
          child: StreamBuilder<ServiceResponse?>(
              stream: serviceBloc.subject.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data?.error != null &&
                      snapshot.data!.error!.length > 0) {
                    return Center(
                      child: Text(snapshot.data!.error!),
                    );
                  }
                  serviceModel = snapshot.data?.data;

                  final createServiceFormBloc =
                      context.read<CreateServiceFormBloc>();

                  parseJsonToUDFModel(
                    createServiceFormBloc,
                    serviceModel!.json,
                  );
                  return Scaffold(
                    appBar: AppbarWidget(
                      title:
                          widget.serviceId == null || widget.serviceId!.isEmpty
                              ? "Create Service" // + widget.templateCode
                              // : widget.title != null
                              //     ? "Edit ${widget.title}"
                              : "Edit Service",
                    ),
                    body:
                        FormBlocListener<CreateServiceFormBloc, String, String>(
                      onSubmitting: (context, state) {},
                      onSuccess: (context, state) {},
                      onFailure: (context, state) {},
                      child: setServiceView(
                        context,
                        createServiceFormBloc,
                      ),
                    ),
                    floatingActionButton: buildSpeedDial(),
                  );
                } else {
                  return Center(
                    child: CustomProgressIndicator(),
                  );
                }
              }),
        ),
      ),

      // floatingActionButton: buildSpeedDial(),
    );
  }

  parseJsonToUDFModel(
    CreateServiceFormBloc createServiceFormBloc,
    udfJsonString,
  ) {
    columnComponent = [];
    componentComList = [];
    udfJsonComponent = [];
    if (udfJsonString != null) {
      udfJsonString = UdfJson.fromJson(jsonDecode(udfJsonString));
      for (UdfJsonComponent component in udfJsonString.components) {
        if (component.columns != null && component.columns!.isNotEmpty) {
          for (Columns column in component.columns!) {
            for (ColumnComponent columnCom in column.components!) {
              columnComponent.add(columnCom);
            }
          }
        }
        if (component.components != null && component.components!.isNotEmpty) {
          for (ComponentComponent componentComponent in component.components!) {
            componentComList.add(componentComponent);
          }
        }
      }

      for (UdfJsonComponent component in udfJsonString.components) {
        if (component.columns == null &&
            (component.components == null ||
                component.components!.length == 0)) {
          udfJsonComponent.add(component);
        } else if (component.components == null &&
            component.columns!.length == 0) {
          udfJsonComponent.add(component);
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
      if (udfJsonComponent.length > 0) {
        // udfJsonComponent.addAll(udfJsonString.components);
        udfJsonCompWidgetList =
            addDynamic(udfJsonComponent, createServiceFormBloc);
      }
    }
  }

  Widget setServiceView(
    BuildContext context,
    CreateServiceFormBloc createServiceFormBloc,
  ) {
    _fromddController.text = serviceModel?.ownerUserName ?? "Select";
    return Stack(
      children: [
        SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: formFieldsWidgets(context, createServiceFormBloc),
          ),
        ),
        Column(
          children: <Widget>[
            Expanded(child: Container()),
            Container(
              height: 50,
              color: Colors.grey[100],
              child: displayFooterWidget(createServiceFormBloc),
            ),
          ],
        ),
        Visibility(
          visible: isVisible,
          child: Center(
            child: CustomProgressIndicator(),
          ),
        ),
      ],
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
          rowChild(serviceModel!.serviceNo!, 'Service No', 3),
          rowChild(serviceModel!.serviceStatusName!, 'Status', 2),
          rowChild(serviceModel!.versionNo.toString(), 'Version No', 2),
        ],
      ),
    ));
    if (!serviceModel!.hideSubject!) {
      createServiceFormBloc.subject
          .updateInitialValue(subjectValue ?? serviceModel!.serviceSubject);
      widgets.add(
        Visibility(
          visible: true,
          child: BlocTextBoxWidget(
            fieldName: 'Subject',
            readonly: false,
            maxLines: 1,
            labelName: 'Subject',
            textFieldBloc: createServiceFormBloc.subject,
            prefixIcon: Icon(Icons.note),
            onChanged: (value) {
              subjectValue = value.toString();
            },
          ),
        ),
      );
    }
    if (widget.serviceId != null && widget.serviceId!.isNotEmpty) {
      createServiceFormBloc.sla
          .updateInitialValue(slaValue ?? serviceModel!.serviceSLA);
      widgets.add(ExpandableField(
        isTileExpanded: isTileVisible,
        valueChanged: (dynamic value) {
          bool isExpand = value;
          if (isExpand) {
            isTileVisible = false;
          } else {
            isTileVisible = true;
          }
        },
        children: [
          Visibility(
            visible: !serviceModel!.hideStartDate!,
            child: Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
              Expanded(
                child: DynamicDateTimeBox(
                  code: serviceModel!.startDate,
                  name: 'Start Date',
                  key: new Key('Start Date'),
                  selectDate: (DateTime date) {
                    if (date != null) {
                      setState(() async {
                        startDate = date;
                        if (dueDate == null && serviceModel!.dueDate != null) {
                          dueDate = DateTime.parse(serviceModel!.dueDate!);
                        }
                        if (dueDate != null && dueDate.toString().isNotEmpty)
                          compareStartEndDate(
                              startDate: startDate!,
                              enddate: dueDate!,
                              context: context,
                              updateDuration: false);
                      });
                      // udfJson[model[i].key] = date.toString();
                    }
                  },
                ),
              ),
              Expanded(
                child: DynamicDateTimeBox(
                  code: serviceModel!.dueDate,
                  name: 'Due Date',
                  key: new Key('Due Date'),
                  selectDate: (DateTime date) {
                    if (date != null) {
                      setState(() async {
                        dueDate = date;
                        if (startDate == null &&
                            serviceModel!.startDate != null) {
                          startDate = DateTime.parse(serviceModel!.startDate!);
                        }
                        if (startDate != null &&
                            startDate.toString().isNotEmpty)
                          compareStartEndDate(
                              startDate: startDate!,
                              enddate: dueDate!,
                              context: context,
                              updateDuration: false);
                      });
                      // udfJson[model[i].key] = date.toString();
                    }
                  },
                ),
              ),
            ]),
          ),
          Visibility(
            visible: serviceModel!.hideSLA!,
            child: BlocTextBoxWidget(
              fieldName: 'SLA',
              readonly: false,
              maxLines: 1,
              labelName: 'SLA',
              textFieldBloc: createServiceFormBloc.sla,
              prefixIcon: Icon(Icons.note),
              onChanged: (value) {
                slaValue = value.toString();
              },
            ),
          ),
          Visibility(
            visible: !serviceModel!.hideExpiryDate!,
            child: BlocDatePickerWidget(
              labelName: 'Reminder Date',
              canSelectTime: false,
              inputFieldBloc: createServiceFormBloc.expiryDate,
              height: 75.0,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ],
      ));
    }
    if (!serviceModel!.hideDescription!) {
      createServiceFormBloc.description.updateInitialValue(
          descriptionValue ?? serviceModel!.serviceDescription);
      widgets.add(Visibility(
        visible: true,
        child: BlocTextBoxWidget(
          fieldName: 'Description',
          readonly: false,
          maxLines: 3,
          labelName: 'Description',
          textFieldBloc: createServiceFormBloc.description,
          prefixIcon: Icon(Icons.note),
          onChanged: (value) {
            descriptionValue = value.toString();
          },
        ),
      ));
    }

    widgets.add(
      NTSDropDownSelect(
        isUserList: true,
        title: 'From',
        controller: _fromddController,
        hint: 'From',
        isShowArrow: true,
        onListTap: (value) {
          userBLoc.subjectUserDataList.sink.add(null);
          User _user = value;
          _fromddController.text = _user.name!;
          ownerUserId = _user.id;
          //     selectValue[i] = _selectedIdNameViewModel.name;
          //     udfJson[model[i].key] = _selectedIdNameViewModel.id;
        },
      ),
    );

    if (udfJsonCompWidgetList != null && udfJsonCompWidgetList.isNotEmpty) {
      widgets.addAll(udfJsonCompWidgetList);
    }
    if (columnComponentWidgets != null && columnComponentWidgets.isNotEmpty) {
      widgets.addAll(columnComponentWidgets);
    }
    if (componentComListWidgets != null && componentComListWidgets.isNotEmpty) {
      widgets.addAll(componentComListWidgets);
    }
    widgets.add(Container(
      height: 200,
    ));
    return widgets;
  }

  rowChild(String data, String field, int flex) {
    return Expanded(
      flex: flex,
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
      if (model[i].type == 'textfield') {
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId != null || widget.serviceId!.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId == null || widget.serviceId!.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        final textField$i =
            new TextFieldBloc(initialValue: udfJson[model[i].key]);
        if (!model[i].disabled) {
          listDynamic.add(
            BlocTextBoxWidget(
              labelName: model[i].label,
              fieldName: model[i].label,
              readonly: model[i].disabled,
              textFieldBloc: textField$i,
              prefixIcon: Icon(Icons.note),
              maxLines: 1,
              onChanged: (value) {
                udfJson[model[i].key] = value.toString();
              },
            ),
          );
          createServiceFormBloc.addFieldBlocs(fieldBlocs: [textField$i]);
        } else {
          listDynamic.add(StaticField(
            // initialValue: difference.toString(),
            width: MediaQuery.of(context).size.width,
            hint: model[i].label,
            icon: Icon(Icons.circle_outlined),
            style: TextStyle(color: Colors.grey[600]),
            // controller: _slaController,
            // isShowArrow: true,
          ));
          // listDynamic.add(new DynamicTextBoxWidget(
          //     model[i].label,
          //     model[i].label,
          //     new TextEditingController(),
          //     true,
          //     (String val) {}));
        }
      } else if (model[i].type == 'textarea') {
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId != null && widget.serviceId!.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId == null || widget.serviceId!.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        // final textArea$i = new TextFieldBloc();
        final textArea$i =
            new TextFieldBloc(initialValue: udfJson[model[i].key]);
        listDynamic.add(
          BlocTextBoxWidget(
            labelName: model[i].label,
            fieldName: model[i].label,
            readonly: model[i].disabled,
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
        String? initialValue;
        // final number$i = new TextFieldBloc(initialValue: initialValue);
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId == null || widget.serviceId!.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId != null || widget.serviceId!.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
          leaveDurationControllerCalendarDays.text =
              model[i].udfValue.toString();
          initialValue = leaveDurationControllerCalendarDays.text;
        }
        if (model[i].key == 'LeaveDurationCalendarDays') {
          initialValue = leaveDurationControllerCalendarDays.text;
          udfJson[model[i].key] = initialValue;
        } else {
          initialValue = udfJson[model[i].key];
        }
        final number$i = new TextFieldBloc(initialValue: initialValue);
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
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId == null || widget.serviceId!.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId != null || widget.serviceId!.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        final password$i =
            new TextFieldBloc(initialValue: udfJson[model[i].key]);
        listDynamic.add(
          BlocTextBoxWidget(
            labelName: model[i].label,
            fieldName: model[i].label,
            readonly: model[i].disabled,
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
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId == null || widget.serviceId!.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId != null || widget.serviceId!.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        listDynamic.add(new DynamicCheckBoxValue(
          code: udfJson[model[i].key],
          name: model[i].label,
          key: new Key(model[i].type),
          checkUpdate: (bool? check) {
            udfJson[model[i].key] = check.toString();
            // model[i].value = check.toString();
          },
        ));
      } else if (model[i].type == 'selectboxes') {
        TextEditingController _ddController = new TextEditingController();
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId == null || widget.serviceId!.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId != null || widget.serviceId!.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
          _ddController.text = udfJson[model[i].key]!;
        }
        listDynamic.add(
          NTSDropDownSelect(
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
              _ddController.text = _selectedIdNameViewModel.name!;
              udfJson[model[i].label] = _selectedIdNameViewModel.id;
              // udfJson[model[i].label] = value.toString();
            },
          ),
        );
      } else if (model[i].type == 'radio') {
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId == null || widget.serviceId!.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId != null || widget.serviceId!.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        final radio$i =
            new SelectFieldBloc(initialValue: udfJson[model[i].key]);
        listDynamic.add(
          BlocRadioButtonWidget(
            labelName: model[i].label,
            selectFieldBloc: radio$i,
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [radio$i]);
      } else if (model[i].type == 'select') {
        TextEditingController _ddController = new TextEditingController();
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId == null || widget.serviceId!.isEmpty)) {
          udfJson[model[i].key] = '';
          if (selectValue.length < model.length) {
            for (var j = selectValue.length; j < model.length; j++) {
              selectValue.add(null);
            }
          }
        }

        if ((selectValue != null && selectValue.isNotEmpty) &&
            (selectValue[i] != null && selectValue[i]!.isNotEmpty)) {
          _ddController.text = selectValue[i]!;
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId != null || widget.serviceId!.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
          editServiceDDValue(
              code: udfJson[model[i].key],
              idKey: model[i].idPath,
              nameKey: (model[i].template)
                  .toString()
                  .replaceAll('<span>{{', '')
                  .replaceAll('}}</span>', '')
                  .trim()
                  .split('.')[1],
              url: model[i].data.url,
              ddController: _ddController);
          if (selectValue.length < model.length) {
            for (var j = selectValue.length; j < model.length; j++) {
              selectValue.add(null);
            }
          }
        }

        listDynamic.add(
          NTSDropDownSelect(
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
              ntsDdBloc.subject.sink.add(null);
              NTSDropdownModel _selectedIdNameViewModel = value;
              _ddController.text = _selectedIdNameViewModel.name!;
              // selectValue[i] = _selectedIdNameViewModel.name;
              udfJson[model[i].key] = _selectedIdNameViewModel.id;
            },
          ),
        );
      } else if (model[i].type == 'datetime') {
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId == null || widget.serviceId!.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId != null || widget.serviceId!.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
          print(model[i].udfValue);
        }
        listDynamic.add(new DynamicDateTimeBox(
          code: udfJson[model[i].key]!.isNotEmpty
              ? model[i]
                      .udfValue
                      .toString()
                      .split(' ')[0]
                      .contains(new RegExp(r'[a-z]'))
                  ? null
                  : DateFormat("yyyy-MM-dd")
                      .parse(udfJson[model[i].key]!)
                      .toString()
              : null,
          name: model[i].label,
          key: new Key(model[i].label),
          selectDate: (DateTime date) {
            if (date != null) {
              model[i].inputFormat = date.toString();
              print(model[i].inputFormat);
              udfJson[model[i].key] = date.toString();
              if (model[i].key == 'LeaveStartDate') {
                leaveStartDate = date;
              } else if (model[i].key == 'LeaveEndDate') {
                leaveEnddate = date;
              }
              if ((model[i].key == 'LeaveStartDate' ||
                      model[i].key == 'LeaveEndDate') &&
                  leaveStartDate != null &&
                  leaveEnddate != null) {
                compareStartEndDate(
                    startDate: leaveStartDate!,
                    enddate: leaveEnddate!,
                    context: context,
                    updateDuration: true);
              }
            }
          },
        ));
      } else if (model[i].type == 'time') {
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId == null || widget.serviceId!.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId != null || widget.serviceId!.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        listDynamic.add(
          new DynamicTimeBox(
            code: udfJson[model[i].key]!.isNotEmpty
                ? DateFormat("yyyy-MM-dd HH:mm:ss aa")
                    .parse(udfJson[model[i].key]!)
                    .toString()
                : null,
            name: model[i].label,
            key: new Key(model[i].label),
            selectTime: (TimeOfDay time) {
              if (time != null) {
                udfJson[model[i].key] = time.toString();
              }
            },
          ),
        );
      } else if (model[i].type == 'hidden') {
        //Hidden Field
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId == null || widget.serviceId!.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId != null || widget.serviceId!.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        final hidden$i = new TextFieldBloc(initialValue: udfJson[model[i].key]);
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
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId == null || widget.serviceId!.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId != null || widget.serviceId!.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        final phoneNumber$i =
            new TextFieldBloc(initialValue: udfJson[model[i].key]);
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
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId == null || widget.serviceId!.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId != null || widget.serviceId!.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        final email$i = new TextFieldBloc(
            validators: [FieldBlocValidators.email],
            initialValue: udfJson[model[i].key]);
        listDynamic.add(
          BlocTextBoxWidget(
            labelName: model[i].label,
            fieldName: model[i].label,
            readonly: model[i].disabled,
            textFieldBloc: email$i,
            prefixIcon: Icon(Icons.email),
            maxLines: 1,
            onChanged: (value) {
              udfJson[model[i].key] = value.toString();
            },
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [email$i]);
      } else if (model[i].type == 'file') {
        TextEditingController attchmentController = new TextEditingController();
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId == null || widget.serviceId!.isEmpty)) {
          udfJson[model[i].key] = '';
          if (selectValue.length < model.length) {
            for (var j = selectValue.length; j < model.length; j++) {
              selectValue.add(null);
            }
          }
        }

        attchmentController.text =
            (udfJson[model[i].key] == null || udfJson[model[i].key]!.isEmpty)
                ? " Select File to Attach "
                : (selectValue[i] == null || selectValue[i]!.isEmpty)
                    ? " (1) File Attached: " + udfJson[model[i].key]!
                    : " (1) File Attached: " + selectValue[i]!;

        // attchmentController.text = udfJson[model[i].key] == null
        //     ? (widget.serviceId == null || widget.serviceId.isEmpty)
        //         ? " Select File to Attach "
        //         : model[i].label
        //     // : model[i].udfValue
        //     : " (1) File Attached " + udfJson[model[i].key];

        listDynamic.add(DynamicAttchmentWidget(
          labelName: model[i].label,
          controller: attchmentController,

          fileId: model[i].udfValue ?? '',

          // Callback for Download
          callBack1: () => _handleDownloadOnPressed(
            data: model[i],
          ),

          callBack: () {
            Navigator.pushNamed(
              context,
              NTS_ATTACHMENT,
              arguments: ScreenArguments(
                  arg1: 'Note',
                  callBack: (dynamic value, dynamic value2, dynamic value3) {
                    setState(() {
                      selectValue[i] = value2;
                      model[i].label = value2;
                      udfJson[model[i].key] = value;
                      attchmentController.text =
                          " (1) File Attached: " + selectValue[i]!;
                      // " (1) File Attached " + udfJson[model[i].key];
                    });
                  }),
            );
          },
          readOnly: false,
        ));
      } else {
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId == null || widget.serviceId!.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId != null || widget.serviceId!.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        final textField$i =
            new TextFieldBloc(initialValue: udfJson[model[i].key]);
        listDynamic.add(
          BlocTextBoxWidget(
            labelName: model[i].label,
            fieldName: model[i].label,
            readonly: model[i].disabled,
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
    for (var row in tableWidgets) {
      table.add(TableRow(children: [row]));
    }
    // table.add(TableRow(children: tableWidgets));
    // });
    // listDynamic.add(Padding(
    //   padding: const EdgeInsets.only(top: 15, bottom: 10),
    //   child: Text(
    //     element.labelDisplayName,
    //     style: TextStyle(fontSize: 13.0, color: Colors.grey),
    //   ),
    // ));
    componentComListWidgets.add(Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.top,
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

  displayFooterWidget(
    CreateServiceFormBloc createServiceFormBloc,
  ) {
    return Container(
      child: Center(
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Visibility(
              visible: serviceModel!.isCompleteButtonVisible!,
              child: PrimaryButton(
                backgroundColor: Colors.green,
                buttonText: 'Complete',
                handleOnPressed: () => serviceViewModelPostRequest(
                  2,
                  'SERVICE_STATUS_COMPLETE',
                  createServiceFormBloc,
                ),
                width: 100,
              ),
            ),
            // Visibility(
            //   visible: serviceModel.isAddCommentEnabled &&
            //       widget.serviceId != null &&
            //       widget.serviceId.isNotEmpty,
            //   child: PrimaryButton(
            //     buttonText: 'Add comment',
            //     handleOnPressed: () {
            //       Navigator.pushNamed(context, COMMENT_ROUTE,
            //           arguments: ScreenArguments(
            //             ntstype: NTSType.service,
            //             arg1: serviceModel.serviceId,
            //           ));
            //     },
            //     width: 100,
            //   ),
            // ),
            Visibility(
              // visible: true,
              visible: serviceModel!.isCancelButtonVisible!,
              child: PrimaryButton(
                backgroundColor: Colors.red,
                buttonText: 'Cancel',
                handleOnPressed: () {
                  if (serviceModel!.isCancelReasonRequired!)
                    enterReasonAlertDialog(context);
                  serviceViewModelPostRequest(
                    2,
                    'SERVICE_STATUS_CANCEL',
                    createServiceFormBloc,
                  );
                },
                width: 100,
              ),
            ),
            Visibility(
              visible: serviceModel!.isCloseButtonVisible!,
              child: PrimaryButton(
                buttonText: 'Close',
                handleOnPressed: () => Navigator.pop(context),
                width: 100,
              ),
            ),
            Visibility(
              visible: serviceModel!.isDraftButtonVisible!,
              child: PrimaryButton(
                backgroundColor: Colors.greenAccent,
                buttonText: 'Draft',
                handleOnPressed: () {
                  serviceViewModelPostRequest(
                    1,
                    'SERVICE_STATUS_DRAFT',
                    createServiceFormBloc,
                  );
                },
                width: 100,
              ),
            ),
            Visibility(
              visible: serviceModel!.isSubmitButtonVisible!,
              child: PrimaryButton(
                buttonText: 'Submit',
                handleOnPressed: () {
                  bool isValid = false;
                  for (var i = 0; i < columnComponent.length; i++) {
                    if (columnComponent[i].validate?.required != null &&
                        columnComponent[i].validate!.required == true &&
                        udfJson.containsKey(columnComponent[i].key) &&
                        (udfJson[columnComponent[i].key] == null ||
                            udfJson[columnComponent[i].key]!.isEmpty)) {
                      displaySnackBar(
                          text: 'Please enter ${columnComponent[i].label}',
                          context: context);
                      return;
                    }
                  }
                  for (var i = 0; i < componentComList.length; i++) {
                    if (componentComList[i].validate?.required != null &&
                        componentComList[i].validate!.required == true &&
                        udfJson.containsKey(componentComList[i].key) &&
                        (udfJson[componentComList[i].key] == null ||
                            udfJson[componentComList[i].key]!.isEmpty)) {
                      displaySnackBar(
                          text: 'Please enter ${componentComList[i].label}',
                          context: context);
                      return;
                    }
                  }
                  for (var i = 0; i < udfJsonComponent.length; i++) {
                    if (udfJsonComponent[i].validate?.required != null &&
                        udfJsonComponent[i].validate!.required == true &&
                        udfJson.containsKey(udfJsonComponent[i].key) &&
                        (udfJson[udfJsonComponent[i].key] == null ||
                            udfJson[udfJsonComponent[i].key]!.isEmpty)) {
                      displaySnackBar(
                          text: 'Please enter ${udfJsonComponent[i].label}',
                          context: context);
                      return;
                    }
                  }
                  serviceViewModelPostRequest(
                    1,
                    'SERVICE_STATUS_INPROGRESS',
                    createServiceFormBloc,
                  );
                },
                width: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }

  requiredFieldValidations() {
    for (var i = 0; i < columnComponent.length; i++) {
      if (columnComponent[i].validate?.required != null &&
          columnComponent[i].validate!.required == true &&
          udfJson.containsKey(columnComponent[i].key) &&
          (udfJson[columnComponent[i].key] == null ||
              udfJson[columnComponent[i].key]!.isEmpty)) {
        displaySnackBar(
            text: 'Please enter ${columnComponent[i].label}', context: context);
        return;
      }
    }
    for (var i = 0; i < componentComList.length; i++) {
      if (componentComList[i].validate?.required != null &&
          componentComList[i].validate!.required == true &&
          udfJson.containsKey(componentComList[i].key) &&
          (udfJson[componentComList[i].key] == null ||
              udfJson[componentComList[i].key]!.isEmpty)) {
        displaySnackBar(
            text: 'Please enter ${componentComList[i].label}',
            context: context);
        return;
      }
    }
    for (var i = 0; i < udfJsonComponent.length; i++) {
      if (udfJsonComponent[i].validate?.required != null &&
          udfJsonComponent[i].validate!.required == true &&
          udfJson.containsKey(udfJsonComponent[i].key) &&
          (udfJson[udfJsonComponent[i].key] == null ||
              udfJson[udfJsonComponent[i].key]!.isEmpty)) {
        displaySnackBar(
            text: 'Please enter ${udfJsonComponent[i].label}',
            context: context);
        return;
      }
    }
  }

  enterReasonAlertDialog(BuildContext context) {
    return showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Enter reason',
            textAlign: TextAlign.center,
            // style: TextStyle(
            //     fontSize: 16.sp,
            //     fontWeight: FontWeight.w400,
            //     color: Colors.black),
          ),
          // backgroundColor: Colors.grey[350],
          // shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.all(Radius.circular(15.0))),
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
                      if (formReason.currentState!.validate()) {}
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
      {required DateTime startDate,
      required DateTime enddate,
      BuildContext? context,
      bool? updateDuration}) {
    if (enddate.isBefore(startDate))
      _showMyDialog();
    else if (updateDuration!) updateLeaveDuration();
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
                Text('End Date Should be greater than Start Date.'),
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

  String? resultMsg = '';
  serviceViewModelPostRequest(int postDataAction, String serviceStatusCode,
      CreateServiceFormBloc createServiceFormBloc) async {
    String? userId =
        BlocProvider.of<UserModelBloc>(context).state.userModel!.id;
    String stringModel = jsonEncode(serviceModel);
    var jsonModel = jsonDecode(stringModel);
    postServiceModel = Service.fromJson(jsonModel);

    postServiceModel.ownerUserId = userId;
    postServiceModel.requestedByUserId = userId;
    postServiceModel.serviceSubject = createServiceFormBloc.subject.value;
    postServiceModel.serviceDescription =
        createServiceFormBloc.description.value;
    postServiceModel.dataAction = widget.serviceId!.isEmpty ? 1 : 2;
    // postDataAction;
    postServiceModel.serviceStatusCode = serviceStatusCode;
    postServiceModel.json = jsonEncode(udfJson);
    print(udfJson);

    setState(() {
      isVisible = true;
    });

    PostResponse result = await serviceBloc.postData(
      userId: BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
      isLeaves: widget.isLeave,
      service: postServiceModel,
    );
    print(result);
    if (result.isSuccess!) {
      setState(() {
        isVisible = false;
      });
      resultMsg = result.messages;
      Navigator.pop(context);
    } else {
      setState(() {
        isVisible = false;
      });
      resultMsg = result.messages;
    }
    displaySnackBar(text: resultMsg!, context: context);
  }

  editServiceDDValue(
      {String? idKey,
      String? nameKey,
      required String url,
      String? code,
      required TextEditingController ddController}) async {
    NTSDdRepository ntsDdRepository = NTSDdRepository();
    String completeUrl = url + "&filterKey=$idKey&filterValue=$code";
    NTSDdResponse ntsDdResponse = await ntsDdRepository.getFilteredDDData(
      idKey: idKey,
      nameKey: nameKey,
      url: completeUrl,
    );

    print("ntsDdResponse: ${ntsDdResponse.data.elementAt(0).name}");
    ddController.text = ntsDdResponse.data.elementAt(0).name ?? '';
    // return ntsDdResponse?.data?.elementAt(0)?.name;
  }

  SpeedDial buildSpeedDial() {
    return SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 28.0),
        backgroundColor: Colors.blue[900],
        visible: true,
        curve: Curves.bounceInOut,
        children: [
          // SpeedDialChild(
          //   child:
          //       Icon(Icons.notifications_active_outlined, color: Colors.white),
          //   backgroundColor: Colors.blue,
          //   onTap: () => print('Pressed Read Later'),
          //   label: 'Notification',
          //   labelStyle:
          //       TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          //   labelBackgroundColor: Colors.black,
          // ),
          SpeedDialChild(
            visible: serviceModel!.isAddCommentEnabled! &&
                widget.serviceId != null &&
                widget.serviceId!.isNotEmpty,
            child: Icon(Icons.comment, color: Colors.white),
            backgroundColor: Colors.blue,
            onTap: () {
              Navigator.pushNamed(
                context,
                COMMENT_ROUTE,
                arguments: ScreenArguments(
                  ntstype: NTSType.service,
                  arg1: serviceModel!.serviceId,
                ),
              );
            },
            label: 'Comment',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.black,
          ),

          SpeedDialChild(
            child: Icon(
              Icons.attachment_outlined,
              color: Colors.white,
            ),
            backgroundColor: Theme.of(context).textHeadingColor,
            onTap: () => _handleAttachmentOnPressed(),
            label: 'Attachment',
            labelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            labelBackgroundColor: Colors.black,
          ),

          // SpeedDialChild(
          //   child: Icon(
          //     Icons.tag,
          //     color: Colors.white,
          //   ),
          //   backgroundColor: Theme.of(context).textHeadingColor,
          //   onTap: () => _handleTagOnPressed(),
          //   label: 'Tag',
          //   labelStyle: TextStyle(
          //     fontWeight: FontWeight.w500,
          //     color: Colors.white,
          //   ),
          //   labelBackgroundColor: Colors.black,
          // ),

          // SpeedDialChild(
          //   child: Icon(Icons.account_tree, color: Colors.white),
          //   backgroundColor: Colors.blue,
          //   onTap: () => print('Pressed Code'),
          //   label: 'Process Design Result',
          //   labelStyle:
          //       TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          //   labelBackgroundColor: Colors.black,
          // ),
          SpeedDialChild(
            visible: widget.serviceId != null && widget.serviceId!.isNotEmpty,
            child: Icon(Icons.share, color: Colors.white),
            backgroundColor: Colors.blue,
            onTap: () => Navigator.pushNamed(context, NTS_SHARE,
                arguments: ScreenArguments(
                  ntstype: NTSType.service,
                  arg1: serviceModel!.serviceId,
                )),
            label: 'Share',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.black,
          ),
          SpeedDialChild(
            visible: widget.serviceId != null && widget.serviceId!.isNotEmpty,
            child: Icon(Icons.share, color: Colors.white),
            backgroundColor: Colors.blue,
            onTap: () => Navigator.pushNamed(
              context,
              ADD_ADHOC_TASK,
              // arguments: ScreenArguments(
              //   ntstype: NTSType.task,
              //   arg4: 'ProjectTask',
              // ),
            ),
            label: 'Adhoc Task',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.black,
          ),

          // SpeedDialChild(
          //   child: Icon(Icons.border_all, color: Colors.white),
          //   backgroundColor: Colors.blue,
          //   onTap: () => print('Pressed Code'),
          //   label: 'Adhoc Task',
          //   labelStyle:
          //       TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          //   labelBackgroundColor: Colors.black,
          // ),
          // SpeedDialChild(
          //   child: Icon(Icons.attachment, color: Colors.white),
          //   backgroundColor: Colors.blue,
          //   onTap: () => print('Pressed Code'),
          //   label: 'Attachment',
          //   labelStyle:
          //       TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          //   labelBackgroundColor: Colors.black,
          // ),
          // SpeedDialChild(
          //   child: Icon(Icons.tag, color: Colors.white),
          //   backgroundColor: Colors.blue,
          //   onTap: () => print('Pressed Code'),
          //   label: 'Tags',
          //   labelStyle:
          //       TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          //   labelBackgroundColor: Colors.black,
          // ),
          // SpeedDialChild(
          //   child: Icon(Icons.email, color: Colors.white),
          //   backgroundColor: Colors.blue,
          //   onTap: () => print('Pressed Code'),
          //   label: 'Email',
          //   labelStyle:
          //       TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          //   labelBackgroundColor: Colors.black,
          // ),
        ]);
  }

  @override
  void dispose() {
    udfJsonString = null;
    columnComponentWidgets = [];
    componentComListWidgets = [];
    udfJsonCompWidgetList = [];
    columnComponent = [];
    componentComList = [];
    super.dispose();
  }

  _handleAttachmentOnPressed() {
    Navigator.pushNamed(
      context,
      ATTACHMENT_NTS_ROUTE,
      arguments: ScreenArguments(
        ntstype: NTSType.service,
        arg1: serviceModel!.serviceId,
      ),
    );
  }

  _handleTagOnPressed() {
    Navigator.pushNamed(
      context,
      TAG_NTS_ROUTE,
      arguments: ScreenArguments(
        ntstype: NTSType.service,
        arg1: serviceModel!.serviceId,
      ),
    );
  }

  // -------------------------------------------------- //
  //            Download code goes here.                //
  // -------------------------------------------------- //

  _handleDownloadOnPressed({
    required data,
  }) async {
    if (data == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Data is unavailable. Pl try again later."),
        ),
      );

      return;
    }

    Map<String, String> queryparams = {
      'fileId': data?.udfValue ?? '',
    };

    Response response = await Dio().get(
      'https://webapidev.aitalkx.com/CHR/query/DownloadAttachment',
      queryParameters: queryparams,
    );

    print(
      response.headers['content-disposition']![0]
          .split(';')[1]
          .split('=')[1]
          .trim(),
    );

    String fileName = response.headers['content-disposition']![0]
        .split(';')[1]
        .split('=')[1]
        .trim();

    if (fileName == null || fileName.isEmpty)
      fileName = data?.label ?? 'DEFAULT_FILE_NAME';

    NewDownloadHelper().unbindPortToMainIsolate();

    showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: false,
      backgroundColor: Colors.transparent,
      enableDrag: true,
      builder: (BuildContext context) {
        return Downloader(
          filename: fileName,
          url:
              'https://webapidev.aitalkx.com/CHR/query/DownloadAttachment?fileId=${data?.udfValue ?? ''}',
        );
      },
    );
  }
}
