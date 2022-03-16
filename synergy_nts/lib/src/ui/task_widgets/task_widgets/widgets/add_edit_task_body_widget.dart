import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:synergy_nts/src/ui/map_widgets/google_maps_current_location_widget.dart';
import 'package:synergy_nts/src/ui/widgets/form_widgets.dart';

// Constansts:
import '../../../../bloc/nts_dropdown_bloc/abstract_nts_dropdown_bloc.dart';
import '../../../../bloc/task_bloc/abstract_task_bloc.dart';
import '../../../../bloc/user_bloc/abstract_user_bloc.dart';
import '../../../../constants/api_endpoints.dart';

// Widgets/UI
import '../../../../../synergy_nts.dart';

// Helpers:
import '../../../../helpers/download_helper/download.dart';
import '../../../../helpers/multiselectList_helper.dart';
import '../../../../helpers/parse_json_helper.dart';
import '../../../../helpers/validation_helper.dart';
import '../../../../models/common_model/common_list_model.dart';
import '../../../../models/nts_dropdown_model/nts_dropdown_model.dart';
import '../../../../models/udf_models/udf_json_model.dart';
import '../../../../models/user_model/read_hierarchy_model.dart';
import '../../../../models/user_model/team_model.dart';
import '../../../nts_comments/nts_comments_screen.dart';
import '../../../widgets/form_widgets/attachment.dart';
import '../../../widgets/widgets.dart';
import 'reassign_bottom_sheet_widget.dart';

class TaskWidget extends StatefulWidget {
  final String userId;
  final bool isEmployeePortal;

  final String? title;
  final String? taskId;
  final String? taskTemplateCode;
  final String? serviceTemplateCode;
  final Map<String, dynamic>? extraInformationMap;

  const TaskWidget({
    Key? key,
    //
    required this.userId,
    required this.isEmployeePortal,
    this.title,
    this.taskId,
    this.taskTemplateCode,
    this.serviceTemplateCode,
    this.extraInformationMap,
  }) : super(key: key);

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  // to render UDFs
  List<Widget> columnComponentWidgets = [];
  List<Widget> componentComListWidgets = [];
  List<Widget> udfJsonCompWidgetList = [];

  TaskModel postTaskModel = TaskModel();

  late TaskModel taskModel;

  UdfJson? udfJsonString;
  final Map<String, String> udfJson = {};

  List<ColumnComponent> columnComponent = [];
  List<ColumnComponent> columnComponentList = [];
  List<UdfJsonComponent> udfJsonComponent = [];

  //Community Hall Booking specific values
  Map<String, String> conditionalValues = {};

  // For Circular Progress Indicator
  bool isVisible = false;

  String? resultMsg = "";

  // Temp variable
  // String? truckLoadTripsTempVariable;

  TextEditingController leaveDurationControllerCalendarDays =
      TextEditingController();

  TextEditingController leaveDurationControllerWorkingDays =
      TextEditingController();

  List<String> selectValue = [];

  DateTime? leaveStartDate;
  DateTime? leaveEnddate;

  // String? ownerUserId;
  // final TextEditingController _fromddController = TextEditingController();

  bool isAttachmentUploaded = false;

  bool isLocationRequired = false;

  ReadTeamDataModel? _selectedModel;

  //Assign data
  CommonListModel? _selectedAssignToTypeModel;
  ReadTeamDataModel? _selectedAssignToTeamModel;
  User? _selectedAssignToTeamUserModel;
  User? _selectedAssignToHierarchyLevelModel;
  User? _selectedAssignToUserModel;
  ReadUserHierarchyModel? _selectedAssignToUserHierarchyModel;

  @override
  void initState() {
    //
    taskBloc.getTaskDetails(
      templateCode: widget.taskTemplateCode,
      taskId: widget.taskId,
      userId: widget.userId,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateServiceFormBloc(),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<TaskResponseModel?>(
            stream: taskBloc.subjectGetTaskDetails.stream,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data?.error != null &&
                    snapshot.data!.error.length > 0) {
                  return Center(
                    child: Text(snapshot.data!.error!),
                  );
                }

                final createServiceFormBloc =
                    context.read<CreateServiceFormBloc>();

                taskModel = snapshot.data?.data;

                if (taskModel.json != null) {
                  parseJsonToUDFModel(
                    createServiceFormBloc,
                    taskModel.json,
                    snapshot.data?.data?.templateCode,
                  );
                }

                return Scaffold(
                  appBar: AppBar(
                    title: const Text("Edit Task"),
                  ),
                  body: FormBlocListener<CreateServiceFormBloc, String, String>(
                    onSuccess: (context, state) {},
                    onFailure: (context, state) {},
                    child: taskModel.id != null
                        ? setTaskView(
                            context,
                            createServiceFormBloc,
                          )
                        : Container(),
                  ),
                  floatingActionButton: Visibility(
                      visible: taskModel.isAddCommentEnabled!,
                      child: FloatingActionButton(
                        backgroundColor: Colors.blue,
                        child: const Icon(Icons.sms),
                        onPressed: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => NTSCommentsScreen(
                            userId: widget.userId,
                            ntsId: taskModel.taskId,
                          ),
                        )),
                      )),
                );
              } else {
                return const Center(
                  child: CustomProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  Widget setTaskView(
    BuildContext context,
    CreateServiceFormBloc createServiceFormBloc,
  ) {
    // _fromddController.text = taskModel.ownerUserName!;
    // ownerUserId = taskModel.ownerUserId!;

    return Stack(
      children: [
        SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: formFieldsWidgets(
              context,
              createServiceFormBloc,
              taskModel,
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Expanded(child: Container()),
            Container(
              height: 50,
              color: AppThemeColor.backgroundColor,
              child: displayFooterWidget(
                taskModel,
                createServiceFormBloc,
              ),
            ),
          ],
        ),
        Visibility(
          visible: isVisible,
          child: const Center(
            child: CustomProgressIndicator(),
          ),
        ),
      ],
    );
  }

  parseJsonToUDFModel(
    CreateServiceFormBloc createServiceFormBloc,
    udfJsonString,
    String? templateCode,
  ) {
    ParseJsonHelper _parseJsonHelper = ParseJsonHelper();
    columnComponentList = [];

    // ! hardcoding UNDO
    // if (widget.serviceTemplateCode == 'GRV_BIRTH AND DEATH CERTIFICATE' ||
    //     widget.serviceTemplateCode == "EGOV_BUILDINGS" ||
    //     widget.serviceTemplateCode == "CIVIL_WORKS" ||
    //     widget.serviceTemplateCode == "GRV_DRAINAGE" ||
    //     widget.serviceTemplateCode == "GRV_ENCROACHMENT" ||
    //     widget.serviceTemplateCode == "GRV_ENFORCEMENT" ||
    //     widget.serviceTemplateCode == "GRV_ESTATE" ||
    //     widget.serviceTemplateCode == "GRV_Factories" ||
    //     widget.serviceTemplateCode == "GRV_GARDEN_AND_TREES" ||
    //     widget.serviceTemplateCode == "GRV_HEALTH" ||
    //     widget.serviceTemplateCode == "EGOV_LEGAL" ||
    //     widget.serviceTemplateCode == "GRV_LICENSE" ||
    //     widget.serviceTemplateCode == "GRV_OTHERS" ||
    //     widget.serviceTemplateCode == "EGOV_PEST_CONTROL" ||
    //     widget.serviceTemplateCode == "GRV_REVENUE" ||
    //     widget.serviceTemplateCode == "GRV_ROADS_AND_TRAFFIC" ||
    //     widget.serviceTemplateCode == "GRV_SANITATION" ||
    //     widget.serviceTemplateCode == "EGOV_SCHOOL" ||
    //     widget.serviceTemplateCode == "GRV_SEWERAGE_OPERATION_CONTROL_RIVER" ||
    //     widget.serviceTemplateCode == "EGOV_SHOPS_AND_ESTABLISHMENTS" ||
    //     widget.serviceTemplateCode == "GRV_SOLID_WASTE_MANAGEMENT" ||
    //     widget.serviceTemplateCode == "GRV_STRAY_DOGS" ||
    //     widget.serviceTemplateCode == "GRV_STREET_LIGHTS" ||
    //     widget.serviceTemplateCode == "GRV_WATER_SUPPLY") {
    //   columnComponentList = _parseJsonHelper.grievanceUDFs(udfJsonString);

    //   if (columnComponentList != null && columnComponentList.isNotEmpty) {
    //     columnComponentWidgets = addDynamic(
    //       columnComponentList,
    //       createServiceFormBloc,
    //       false,
    //     );
    //   }
    // } else if (widget.serviceTemplateCode ==
    //     'EGOV_PUBLIC_GRIEVANCE_REGISTRATION') {
    //   columnComponentList =
    //       _parseJsonHelper.parsePublicGrievanceUDFs(udfJsonString);

    //   if (columnComponentList != null && columnComponentList.isNotEmpty) {
    //     columnComponentWidgets = addDynamic(
    //       columnComponentList,
    //       createServiceFormBloc,
    //       false,
    //     );
    //   }
    // } else if (widget.serviceTemplateCode == 'BIRTH_REGISTRATION' ||
    //     widget.serviceTemplateCode == 'DEATH_REGISTRATION' ||
    //     widget.serviceTemplateCode == 'STILL_BIRTH_REGISTRATION') {
    //   //For Birth Registration, Death Registration, Stillbirth Registration service
    //   columnComponentList =
    //       _parseJsonHelper.parseBirthDeathRegistrationUDFs(udfJsonString);

    //   if (columnComponentList != null && columnComponentList.isNotEmpty) {
    //     columnComponentWidgets = addDynamic(
    //       columnComponentList,
    //       createServiceFormBloc,
    //       true,
    //     );
    //   }
    // } else if (widget.serviceTemplateCode == 'CommunityHallBooking' ||
    //     widget.serviceTemplateCode == 'DocumentVerifierCommunityHallBooking') {
    //   columnComponentList = _parseJsonHelper.parseCommunityHallBookingUDFs(
    //     udfJsonString,
    //     conditionalValues,
    //   );

    //   if (columnComponentList != null && columnComponentList.isNotEmpty) {
    //     columnComponentWidgets = addDynamic(
    //       columnComponentList,
    //       createServiceFormBloc,
    //       false,
    //     );
    //   }
    // } else if (widget.serviceTemplateCode ==
    //     'NEW_SEWERAGE_CONNECTION_REQUEST') {
    //   columnComponentList = _parseJsonHelper.parseSewerageConnectionUDFs(
    //       udfJsonString,
    //       widget.extraInformationMap!['SewerageConnectionRequiredFor']
    //           .extraInfo['codeId']);
    //   if (columnComponentList != null && columnComponentList.isNotEmpty) {
    //     columnComponentWidgets = addDynamic(
    //       columnComponentList,
    //       createServiceFormBloc,
    //       false,
    //     );
    //   }
    // } else {
    columnComponentList = _parseJsonHelper.parseGenericUDFs(
      udfJsonString,
      conditionalValues,
      widget.taskId,
    );
    if (columnComponentList != null && columnComponentList.isNotEmpty) {
      columnComponentWidgets = addDynamic(
        columnComponentList,
        createServiceFormBloc,
        false,
      );
    }
    // }
  }

  List<Widget> addDynamic(
    model,
    createServiceFormBloc,
    bool isOtherDetails,
  ) {
    List<Widget> listDynamic = [];
    for (var i = 0; i < model.length; i++) {
      if (model[i].type == 'textfield' && model[i].hidden != true) {
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null || widget.taskId!.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId == null || widget.taskId!.isEmpty)) {
          udfJson[model[i].key] = '';
        }

        final textField$i = TextFieldBloc(
          initialValue: model[i].defaultValue ?? udfJson[model[i].key],
        );

        // if (!model[i].disabled) {
        listDynamic.add(
          BlocTextBoxWidget(
            isRequired: model[i].validate?.required,
            labelName: model[i].label,
            fieldName: model[i].label,
            readonly: true,
            // readonly: model[i].disabled,
            textFieldBloc: textField$i,
            prefixIcon: const Icon(Icons.note, color: AppThemeColor.iconColor),
            maxLines: 1,
            onChanged: (value) {
              udfJson[model[i].key] = value.toString();
            },
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [textField$i]);
        // } else {
        //   listDynamic.add(StaticField(
        //     // initialValue: difference.toString(),
        //     width: MediaQuery.of(context).size.width,
        //     hint: model[i].label,
        //     icon: Icon(Icons.circle_outlined),
        //     style: TextStyle(color: Colors.grey),
        //     // controller: _slaController,
        //     // isShowArrow: true,
        //   ));
        //   // listDynamic.add(DynamicTextBoxWidget(
        //   //     model[i].label,
        //   //     model[i].label,
        //   //     TextEditingController(),
        //   //     true,
        //   //     (String val) {}));
        // }
      } else if (model[i].type == 'textarea' && model[i].hidden != true) {
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null && widget.taskId!.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId == null || widget.taskId!.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        // final textArea$i = TextFieldBloc();
        final textArea$i = TextFieldBloc(initialValue: udfJson[model[i].key]);
        listDynamic.add(
          BlocTextBoxWidget(
            isRequired: model[i].validate?.required,
            readonly: true,
            labelName: model[i].label,
            fieldName: model[i].label,
            // readonly: model[i].disabled,
            textFieldBloc: textArea$i,
            prefixIcon: const Icon(
              Icons.note,
              color: AppThemeColor.iconColor,
            ),
            maxLines: 3,
            onChanged: (value) {
              udfJson[model[i].key] = value.toString();
            },
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [textArea$i]);
      } else if (model[i].type == 'number' && model[i].hidden != true) {
        // if (model[i].key == 'TruckLoadTrips') {
        //   truckLoadTripsTempVariable = model[i].udfValue;
        // }

        String initialValue;
        String? defaultValue = model[i]?.defaultValue?.toString();

        // final number$i = TextFieldBloc(initialValue: initialValue);
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId == null || widget.taskId!.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null || widget.taskId!.isNotEmpty)) {
          udfJson[model[i].key] =
              model[i].udfValue ?? model[i]?.defaultValue?.toString() ?? '';
          leaveDurationControllerCalendarDays.text = udfJson[model[i].key]!;
          // leaveDurationControllerCalendarDays.text = model[i].udfValue;
          initialValue = leaveDurationControllerCalendarDays.text;
        }
        if (model[i].key == 'LeaveDurationCalendarDays') {
          initialValue = leaveDurationControllerCalendarDays.text;
        }

        // Logic for rate
        // rate's default value * number of trips:

        // ! hardcoding UNDO
        /*else if (model[i].key == 'BillAmount' &&
            defaultValue != null &&
            defaultValue.isNotEmpty &&
            truckLoadTripsTempVariable != null &&
            truckLoadTripsTempVariable!.isNotEmpty) {
          initialValue =
              (int.parse(defaultValue) * int.parse(truckLoadTripsTempVariable!))
                  .toString();
        }*/
        else {
          initialValue = udfJson[model[i].key]!;
        }

        udfJson[model[i].key] = initialValue;

        final number$i = TextFieldBloc(initialValue: initialValue);
        listDynamic.add(
          BlocNumberBoxWidget(
            labelName: model[i].label,
            fieldName: model[i].label,
            readonly: true,
            // readonly: model[i].disabled,
            textFieldBloc: number$i,
            prefixIcon: const Icon(Icons.format_list_numbered,
                color: AppThemeColor.iconColor),
            onChanged: (value) {
              udfJson[model[i].key] = value.toString();
            },
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [number$i]);
      } else if (model[i].type == 'password' && model[i].hidden != true) {
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId == null || widget.taskId!.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null || widget.taskId!.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        final password$i = TextFieldBloc(initialValue: udfJson[model[i].key]);
        listDynamic.add(
          BlocTextBoxWidget(
            isRequired: model[i].validate?.required,
            labelName: model[i].label,
            fieldName: model[i].label,
            readonly: true,
            // readonly: model[i].disabled,
            textFieldBloc: password$i,
            prefixIcon: const Icon(Icons.visibility_off_rounded),
            obscureText: true,
            onChanged: (value) {
              udfJson[model[i].key] = value.toString();
            },
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [password$i]);
      } else if (model[i].type == 'checkbox' && model[i].hidden != true) {
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId == null || widget.taskId!.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null || widget.taskId!.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        listDynamic.add(
          DynamicCheckBoxValue(
            readonly: true,
            // readonly: model[i].disabled,
            code: udfJson[model[i].key],
            name: model[i].label,
            key: Key(model[i].label),
            value: udfJson[model[i].key],
            checkUpdate: (bool check) {
              udfJson[model[i].key] = check.toString();
              // model[i].value = check.toString();
            },
          ),
        );
      } else if (model[i].type == 'selectboxes' && model[i].hidden != true) {
        TextEditingController _ddController = TextEditingController();
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId == null || widget.taskId!.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null || widget.taskId!.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
          _ddController.text = udfJson[model[i].key]!;
        }
        listDynamic.add(NTSDropDownSelect(
          isRequired: model[i].validate?.required,
          isReadonly: true,
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
            udfJson[model[i].label] = _selectedIdNameViewModel.id!;
            // udfJson[model[i].label] = value.toString();
          },
        ));
      } else if (model[i].type == 'radio' && model[i].hidden != true) {
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId == null || widget.taskId!.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null || widget.taskId!.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        final radio$i = SelectFieldBloc(initialValue: udfJson[model[i].key]);
        listDynamic.add(
          BlocRadioButtonWidget(
            labelName: model[i].label,
            selectFieldBloc: radio$i,
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [radio$i]);
      } else if (model[i].type == 'select' && model[i].hidden != true) {
        TextEditingController _ddController = TextEditingController();
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId == null || widget.taskId!.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (selectValue.length < model.length) {
          for (var j = selectValue.length; j < model.length; j++) {
            selectValue.add('');
          }
        }
        List<NTSDropdownModel>? _dropdownModelList = [];
        model[i].data?.values?.forEach(
              (e) => _dropdownModelList.add(
                NTSDropdownModel(
                  id: e.value,
                  name: e.label,
                ),
              ),
            );
        if ((selectValue != null && selectValue.isNotEmpty) &&
            (selectValue[i] != null && selectValue[i].isNotEmpty)) {
          _ddController.text = selectValue[i];
        }

        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null || widget.taskId!.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
          if (model[i].template == null) {
            List<FileTypeData> _value = model[i].data.values;
            _value.forEach((element) {
              if (element.value == model[i].udfValue) {
                _ddController.text = element.label!;
              }
            });
          } else {
            // if else loop added to separate processing of multi-select and
            // single-select conditions
            if (model[i].multiple != null &&
                model[i].multiple &&
                udfJson[model[i].key] != null &&
                udfJson[model[i].key]!.isNotEmpty) {
              getMultiSelectListNames(
                udfValue: udfJson[model[i].key],
                idKey: model[i].idPath,
                nameKey: (model[i].template)
                    .toString()
                    .replaceAll('<span>{{', '')
                    .replaceAll('}}</span>', '')
                    .trim()
                    .split('.')[1],
                url: model[i].data.url,
                ddController: _ddController,
              ).then((value) => _ddController.text =
                  value.toString().split('[')[1].split(']')[0]);
            } else {
              editTaskDDValue(
                  code: udfJson[model[i].key]!,
                  idKey: model[i].idPath,
                  nameKey: (model[i].template)
                      .toString()
                      .replaceAll('<span>{{', '')
                      .replaceAll('}}</span>', '')
                      .trim()
                      .split('.')[1],
                  url: model[i].data.url,
                  index: i,
                  ddController: _ddController);
            }
          }
        }

        listDynamic.add(
          NTSDropDownSelect(
            isRequired: model[i].validate?.required,
            // isReadonly: model[i].disabled,
            isReadonly: true,
            // isReadonly: model[i].disabled,
            title: model[i].label,
            controller: _ddController,
            hint: model[i].label,
            validationMessage: "Select " + model[i].label,
            isShowArrow: true,
            dropdownValues: _dropdownModelList,
            multiple: model[i].multiple ?? false,
            nameKey: model[i].template != null
                ? (model[i].template)
                    .toString()
                    .replaceAll('<span>{{', '')
                    .replaceAll('}}</span>', '')
                    .trim()
                    .split('.')[1]
                : '',
            idKey: model[i].idPath,
            url: model[i].data.url,
            onListTap: (dynamic value) {
              ntsDdBloc.subject.sink.add(null);
              NTSDropdownModel _selectedIdNameViewModel = value;
              _ddController.text = _selectedIdNameViewModel.name!;
              selectValue[i] = _selectedIdNameViewModel.name!;
              udfJson[model[i].key] = _selectedIdNameViewModel.id!;
            },
          ),
        );
      } else if (model[i].type == 'datetime' && model[i].hidden != true) {
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId == null || widget.taskId!.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null || widget.taskId!.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        listDynamic.add(DynamicDateBox(
          isReadonly: true,
          // isReadonly: model[i].disabled,
          code: udfJson[model[i].key]!.isNotEmpty
              ? model[i]
                      .udfValue
                      .toString()
                      .split(' ')[0]
                      .contains(RegExp(r'[a-z]'))
                  ? null
                  : DateFormat("yyyy-MM-dd")
                      .parse(udfJson[model[i].key]!)
                      .toString()
              : null,
          name: model[i].label,
          key: Key(model[i].label),
          selectDate: (DateTime date) {
            model[i].inputFormat = date.toString();

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
                updateDuration: true,
              );
            }
          },
        ));
      } else if (model[i].type == 'time' && model[i].hidden != true) {
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId == null || widget.taskId!.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null || widget.taskId!.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        listDynamic.add(
          DynamicTimeBox(
            code: udfJson[model[i].key]!.isNotEmpty
                ? DateFormat("yyyy-MM-dd HH:mm:ss aa")
                    .parse(udfJson[model[i].key]!)
                    .toString()
                : null,
            name: model[i].label,
            key: Key(model[i].label),
            selectTime: (TimeOfDay time) {
              udfJson[model[i].key] = time.toString();
            },
          ),
        );
      } else if (model[i].type == 'hidden' && model[i].hidden != true) {
        //Hidden Field
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId == null || widget.taskId!.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null || widget.taskId!.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        final hidden$i = TextFieldBloc(initialValue: udfJson[model[i].key]);
        listDynamic.add(
          BlocTextBoxWidget(
            obscureText: true,
            labelName: model[i].label,
            fieldName: model[i].label,
            readonly: true,
            textFieldBloc: hidden$i,
            prefixIcon:
                const Icon(Icons.visibility, color: AppThemeColor.iconColor),
            maxLines: 1,
            onChanged: (value) {
              udfJson[model[i].key] = value.toString();
            },
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [hidden$i]);
      } else if (model[i].type == 'phoneNumber' && model[i].hidden != true) {
        //Phone Number Field
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId == null || widget.taskId!.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null || widget.taskId!.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        final phoneNumber$i =
            TextFieldBloc(initialValue: udfJson[model[i].key]);
        listDynamic.add(
          BlocNumberBoxWidget(
            labelName: model[i].label,
            fieldName: model[i].label,
            readonly: true,
            // readonly: false,
            textFieldBloc: phoneNumber$i,
            prefixIcon:
                const Icon(Icons.phone_rounded, color: AppThemeColor.iconColor),
            onChanged: (value) {
              udfJson[model[i].key] = value.toString();
            },
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [phoneNumber$i]);
      } else if (model[i].type == 'email' && model[i].hidden != true) {
        //Email Field
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId == null || widget.taskId!.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null || widget.taskId!.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        final email$i = TextFieldBloc(
            validators: [FieldBlocValidators.email],
            initialValue: udfJson[model[i].key]);
        listDynamic.add(
          BlocTextBoxWidget(
            isRequired: model[i].validate?.required,
            labelName: model[i].label,
            fieldName: model[i].label,
            readonly: true,
            // readonly: model[i].disabled,
            textFieldBloc: email$i,
            prefixIcon: const Icon(Icons.email_outlined,
                color: AppThemeColor.iconColor),
            maxLines: 1,
            onChanged: (value) {
              udfJson[model[i].key] = value.toString();
            },
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [email$i]);
      } else if (model[i].type == 'file' && model[i].hidden != true) {
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId == null || widget.taskId!.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null || widget.taskId!.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }

        TextEditingController attachmentController = TextEditingController();
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId == null || widget.taskId!.isEmpty)) {
          udfJson[model[i].key] = '';
          if (selectValue.length < model.length) {
            for (var j = selectValue.length; j < model.length; j++) {
              selectValue.add('');
            }
          }
        }

        attachmentController.text = (udfJson[model[i].key] == null ||
                udfJson[model[i].key]!.isEmpty ||
                udfJson[model[i].key] == '[]')
            ? model[i].label ?? " Select File to Attach "
            : (selectValue[i] == null || selectValue[i].isEmpty)
                ? " (1) File Attached: " + udfJson[model[i].key]!
                : " (1) File Attached: " + selectValue[i];

        listDynamic.add(
          DynamicAttachmentWidget(
            isRequired: model[i].validate?.required,
            labelName: model[i].label,
            fieldName: model[i].label,
            controller: attachmentController,

            fileId: (model[i].udfValue == '[]')
                ? model[i].udfValue.replaceAll(RegExp(r'[^\w\s]+'), '')
                : model[i].udfValue,

            // Callback for Download
            callBack1: () => _handleDownloadOnPressed(
              data: model[i],
            ),

            callBack: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return SelectAttachment(
                    ntsId: 'Note',
                    userId: widget.userId,
                    onListTap: (dynamic value, dynamic value2, dynamic value3) {
                      setState(() {
                        isAttachmentUploaded = true;

                        selectValue[i] = value2;
                        model[i].label = value2;
                        udfJson[model[i].key] = value;
                        attachmentController.text =
                            " (1) File Attached: " + selectValue[i];
                      });
                    },
                  );
                }),
              );
            },
            readOnly: true,
          ),
        );
        // TextEditingController attchmentController = TextEditingController();
        // if (!udfJson.containsKey(model[i].key) &&
        //     (widget.taskId == null || widget.taskId!.isEmpty)) {
        //   udfJson[model[i].key] = '';
        //   if (selectValue.length < model.length) {
        //     for (var j = selectValue.length; j < model.length; j++) {
        //       selectValue.add('');
        //     }
        //   }
        // }

        // attchmentController.text =
        //     (udfJson[model[i].key] == null || udfJson[model[i].key]!.isEmpty)
        //         ? " Select File to Attach "
        //         : (selectValue[i] == null || selectValue[i].isEmpty)
        //             ? " (1) File Attached: " + udfJson[model[i].key]!
        //             : " (1) File Attached: " + selectValue[i];
      } else if (model[i].type == 'legend' && model[i].hidden != true) {
        listDynamic.add(
          DynamicTextDisplay(text: model[i].label),
        );
      } else if (model[i].type == 'map') {
        isLocationRequired = true;

        listDynamic.add(
          SizedBox(
            height: 1.h,
          ),
        );
        listDynamic.add(
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 25.h,
            child: _mapWidget(
              isGoogleMaps: false,
            ),
          ),
        );
      } else {
        // TODO: ?
      }
    }

    // ! hardcoding UNDO
    // if (taskModel.assignedToUserName == "Assist Composite Officer" &&
    //     taskModel.taskStatusCode == 'TASK_STATUS_INPROGRESS') {
    //   TextEditingController _assignToTypeController = TextEditingController();
    //   TextEditingController _assignToTeamController = TextEditingController();
    //   TextEditingController _assignToTeamUserController =
    //       TextEditingController();
    //   TextEditingController _assignToHierarchyLevelController =
    //       TextEditingController();
    //   TextEditingController _assignToUserController = TextEditingController();
    //   TextEditingController _assignToUserHierarchyController =
    //       TextEditingController();

    //   List<ReadTeamDataModel>? _assignToTeamModelList = [];
    //   List<User>? _assignToTeamUserModelList = [];
    //   List<User>? _assignToUserModelList = [];
    //   List<ReadUserHierarchyModel>? _assignToUserHierarchyModelList = [];
    //   List<User>? _assignToUserHierarchyModelLevelList = [];

    //   if (taskModel.nextTaskAssignedToTypeId != null &&
    //       taskModel.nextTaskAssignedToTypeId.isNotEmpty) {
    //     editTaskDDValue(
    //       nameKey: 'Name',
    //       idKey: 'Id',
    //       code: taskModel.nextTaskAssignedToTypeId,
    //       url: 'cms/query/GetLOVIdNameList?lovType=TASK_ASSIGN_TO_TYPE',
    //       ddController: _assignToTypeController,
    //     );
    //   }

    //   if (taskModel.nextTaskAssignedToTeamId != null &&
    //       taskModel.nextTaskAssignedToTeamId!.isNotEmpty) {
    //     userBLoc.readTeamData().then((value) {
    //       _assignToTeamModelList = value?.list;
    //       _assignToTeamModelList?.forEach((element) {
    //         if (element.id == taskModel.nextTaskAssignedToTeamId) {
    //           _selectedAssignToTeamModel = element;
    //           _assignToTeamController.text = element.name!;
    //         }
    //       });
    //     });
    //   }

    //   if (taskModel.nextTaskAssignedToTeamUserId != null &&
    //       taskModel.nextTaskAssignedToTeamUserId!.isNotEmpty) {
    //     userBLoc.readTeamUserData(queryparams: {
    //       'id': taskModel.nextTaskAssignedToTeamId
    //     }).then((value) {
    //       _assignToTeamUserModelList = value?.list;
    //       _assignToTeamUserModelList?.forEach((element) {
    //         if (element.id == taskModel.nextTaskAssignedToTeamUserId) {
    //           _selectedAssignToTeamUserModel = element;
    //           _assignToTeamUserController.text = element.name!;
    //         }
    //       });
    //     });
    //   }

    //   if (taskModel.nextTaskAssignedToUserId != null &&
    //       taskModel.nextTaskAssignedToUserId!.isNotEmpty) {
    //     userBLoc.readUserData().then((value) {
    //       _assignToUserModelList = value?.list;
    //       _assignToUserModelList?.forEach((element) {
    //         if (element.id == taskModel.nextTaskAssignedToUserId) {
    //           _selectedAssignToUserModel = element;
    //           _assignToUserController.text = element.name!;
    //         }
    //       });
    //     });
    //   }

    //   if (taskModel.nextTaskAssignedToHierarchyMasterId != null &&
    //       taskModel.nextTaskAssignedToHierarchyMasterId!.isNotEmpty) {
    //     userBLoc.readUserHierarchyData().then((value) {
    //       _assignToUserHierarchyModelList = value?.list;
    //       _assignToUserHierarchyModelList?.forEach((element) {
    //         if (element.id == taskModel.nextTaskAssignedToHierarchyMasterId) {
    //           _selectedAssignToUserHierarchyModel = element;
    //           _assignToUserHierarchyController.text = element.name!;
    //         }
    //       });
    //     });
    //   }

    //   // if (taskModel.nextTaskAssignedToHierarchyMasterLevelId != null &&
    //   //     taskModel.nextTaskAssignedToHierarchyMasterLevelId!.isNotEmpty) {
    //   //   userBLoc.readTeamUserData().then((value) {
    //   //     _assignToUserHierarchyModelLevelList = value?.list;
    //   //     _assignToUserHierarchyModelLevelList?.forEach((element) {
    //   //       if (element.id ==
    //   //           taskModel.nextTaskAssignedToHierarchyMasterLevelId) {
    //   //         _selectedAssignToHierarchyLevelModel = element;
    //   //         _assignToHierarchyLevelController.text = element.name!;
    //   //       }
    //   //     });
    //   //   });
    //   // }

    //   if (_selectedAssignToTypeModel != null) {
    //     _assignToTypeController.text = _selectedAssignToTypeModel!.name!;
    //   }
    //   if (_selectedAssignToTeamModel != null) {
    //     _assignToTeamController.text = _selectedAssignToTeamModel!.name!;
    //   }
    //   if (_selectedAssignToUserHierarchyModel != null) {
    //     _assignToUserHierarchyController.text =
    //         _selectedAssignToUserHierarchyModel!.name!;
    //   }

    //   listDynamic.add(
    //     _futureBuilderWidget(
    //       key: 'GetLOVIdNameList',
    //       future: commonBloc.getLOVIdNameList(queryparams: {
    //         'lovType': 'TASK_ASSIGN_TO_TYPE',
    //       }),
    //       controller: _assignToTypeController,
    //       title: 'Assign To Type',
    //       url: 'cms/query/GetLOVIdNameList?lovType=TASK_ASSIGN_TO_TYPE',
    //       onListTap: (dynamic value) {
    //         ntsDdBloc.subject.sink.add(null);
    //         _selectedAssignToTypeModel = value;
    //         setState(() {
    //           taskModel.nextTaskAssignedToTypeCode =
    //               _selectedAssignToTypeModel!.code;
    //           taskModel.nextTaskAssignedToTypeId =
    //               _selectedAssignToTypeModel!.id;
    //           _assignToTypeController.text = _selectedAssignToTypeModel!.name!;
    //         });
    //       },
    //     ),
    //   );

    //   if (taskModel.nextTaskAssignedToTypeCode == 'TASK_ASSIGN_TO_TEAM') {
    //     listDynamic.add(
    //       _futureBuilderWidget(
    //         key: 'ReadTeamData',
    //         future: userBLoc.readTeamData(),
    //         controller: _assignToTeamController,
    //         title: 'Assign To Team',
    //         url: 'cms/query/ReadTeamData',
    //         onListTap: (dynamic value) {
    //           ntsDdBloc.subject.sink.add(null);
    //           _selectedAssignToTeamModel = value;
    //           setState(() {
    //             taskModel.nextTaskAssignedToTeamId =
    //                 _selectedAssignToTeamModel?.id;
    //             _assignToTeamController.text =
    //                 _selectedAssignToTeamModel!.name!;
    //           });
    //         },
    //       ),
    //     );
    //     listDynamic.add(
    //       _futureBuilderWidget(
    //         key: 'ReadUserTeamData',
    //         future: userBLoc.readTeamUserData(
    //             queryparams: {'id': _selectedAssignToTeamModel?.id ?? ''}),
    //         controller: _assignToTeamUserController,
    //         title: 'Assign To team User',
    //         url: 'cms/query/ReadUserTeamData',
    //         onListTap: (dynamic value) {
    //           ntsDdBloc.subject.sink.add(null);
    //           _selectedAssignToTeamUserModel = value;
    //           setState(() {
    //             taskModel.nextTaskAssignedToTeamUserId =
    //                 _selectedAssignToTeamUserModel?.id;
    //             _assignToTeamUserController.text =
    //                 _selectedAssignToTeamUserModel!.name!;
    //           });
    //         },
    //       ),
    //     );
    //   } else if (taskModel.nextTaskAssignedToTypeCode ==
    //       'TASK_ASSIGN_TO_USER') {
    //     listDynamic.add(
    //       _futureBuilderWidget(
    //         key: 'ReadUserData',
    //         future: userBLoc.readUserData(),
    //         controller: _assignToUserController,
    //         title: 'Assign To',
    //         url: 'cms/query/ReadUserData',
    //         onListTap: (dynamic value) {
    //           ntsDdBloc.subject.sink.add(null);
    //           _selectedAssignToUserModel = value;
    //           taskModel.nextTaskAssignedToUserId =
    //               _selectedAssignToUserModel?.id;
    //           _assignToUserController.text = _selectedAssignToUserModel!.name!;
    //         },
    //       ),
    //     );
    //   } else if (taskModel.nextTaskAssignedToTypeCode ==
    //       'TASK_ASSIGN_TO_USER_HIERARCHY') {
    //     listDynamic.add(
    //       _futureBuilderWidget(
    //         key: 'ReadHierarchyMasterData',
    //         future: userBLoc.readUserHierarchyData(),
    //         controller: _assignToUserHierarchyController,
    //         title: 'Assign To Hierarchy',
    //         url: 'cms/query/ReadHierarchyMasterData',
    //         onListTap: (dynamic value) {
    //           ntsDdBloc.subject.sink.add(null);
    //           _selectedAssignToUserHierarchyModel = value;
    //           setState(() {
    //             taskModel.nextTaskAssignedToHierarchyMasterId =
    //                 _selectedAssignToUserHierarchyModel?.id;
    //             _assignToUserHierarchyController.text =
    //                 _selectedAssignToUserHierarchyModel!.name!;
    //           });
    //         },
    //       ),
    //     );
    //     listDynamic.add(
    //       _futureBuilderWidget(
    //         key: 'ReadUserTeamData',
    //         future: userBLoc.readTeamUserData(queryparams: {
    //           'id': _selectedAssignToUserHierarchyModel?.id ?? ''
    //         }),
    //         controller: _assignToHierarchyLevelController,
    //         title: 'Assign To Hierarchy Level',
    //         url: 'cms/query/ReadUserTeamData',
    //         onListTap: (dynamic value) {
    //           ntsDdBloc.subject.sink.add(null);
    //           _selectedAssignToHierarchyLevelModel = value;
    //           taskModel.nextTaskAssignedToHierarchyMasterLevelId =
    //               _selectedAssignToHierarchyLevelModel?.id;
    //           _assignToHierarchyLevelController.text =
    //               _selectedAssignToHierarchyLevelModel!.name!;
    //         },
    //       ),
    //     );
    //   }
    // }
    return listDynamic;
  }

  Widget rowChild(
    String data,
    String field,
    int flex,
  ) {
    return Expanded(
      flex: flex,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            data,
            style: TextStyle(color: Colors.blue.shade800, fontSize: 14),
          ),
          Text(
            field,
            style: const TextStyle(
                color: AppThemeColor.textColorDark, fontSize: 14),
          ),
        ],
      ),
    );
  }

  List<Widget> formFieldsWidgets(
    BuildContext context,
    CreateServiceFormBloc createServiceFormBloc,
    TaskModel taskModel,
  ) {
    List<Widget> widgets = [];

    widgets.add(
      _metadataWidget(context),
    );

    if (udfJsonCompWidgetList.isNotEmpty) {
      widgets.addAll(udfJsonCompWidgetList);
    }

    if (columnComponentWidgets.isNotEmpty) {
      widgets.addAll(columnComponentWidgets);
    }

    if (componentComListWidgets.isNotEmpty) {
      widgets.addAll(componentComListWidgets);
    }

    widgets.add(
      Container(
        height: 50,
      ),
    );

    return widgets;
  }

  _metadataWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.24),
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: subtitleWidget(
                        context: context,
                        caption: 'Task Number',
                        customChild: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 4),

                                //
                                Text(
                                  taskModel.taskNo?.toString().trim() ?? "",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    //
                    subtitleWidget(
                      context: context,
                      caption: "Version",
                      isCentered: true,
                      customChild: Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          taskModel.versionNo?.toString().trim() ?? "",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText1!,
                        ),
                      ),
                    ),
                  ],
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 4),
                  child: Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                ),

                //
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    subtitleWidget(
                      context: context,
                      caption: 'Assigned to',
                      customChild: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 4),

                              //
                              Text(
                                taskModel.assignedToUserName
                                        ?.toString()
                                        .trim() ??
                                    "",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Text(
                                taskModel.assignedToUserEmail
                                        ?.toString()
                                        .trim() ??
                                    "",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.caption!,
                              ),
                            ],
                          ),
                          SizedBox(width: 2.w),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: 1,
              height: 12.5.h,
              color: Colors.white,
            ),
          ),
          //
          subtitleWidget(
            context: context,
            caption: "Status",
            customChild: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    taskModel.taskStatusName?.toString().trim() ?? "",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: statusToColorMap[taskModel.taskStatusName] ??
                              AppThemeColor.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  displayFooterWidget(
    TaskModel taskModel,
    CreateServiceFormBloc createServiceFormBloc,
  ) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Visibility(
            visible: checkLockVisibility(),
            child: PrimaryButton(
              buttonText: 'Lock team task',
              handleOnPressed: () =>
                  _handleLockYourTaskOnPressed(taskId: taskModel.taskId),
              width: 100,
            ),
          ),
          Visibility(
            visible: checkReleaseVisibility(),
            child: PrimaryButton(
              buttonText: 'Release Lock',
              handleOnPressed: () =>
                  _handleReleaseLockOnPressed(taskId: taskModel.taskId),
              width: 100,
            ),
          ),
          Visibility(
            visible: taskModel.isTaskTeamOwner!,
            child: PrimaryButton(
              buttonText: 'Reassign',
              handleOnPressed: () {
                showModalBottomSheet(
                  elevation: 8,
                  enableDrag: true,
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  builder: (builder) {
                    final List<ReadTeamDataModel?> _teamMemberList = [];
                    if (taskModel.teamMembers != null) {
                      _teamMemberList.clear();
                      _teamMemberList.addAll(
                        readTeamDataModelFromJson(
                          jsonEncode(taskModel.teamMembers),
                        ),
                      );
                    }

                    return ReassignBottomSheetWidget(
                      data: _teamMemberList,
                      selectedDataMember: _selectedModel,
                      onChanged: (ReadTeamDataModel? model) {
                        setState(() {
                          _selectedModel = model;
                        });

                        _handleLockYourTaskOnPressed(
                          taskId: taskModel.taskId,
                          userId: _selectedModel?.id,
                        );
                      },
                    );
                  },
                );
              },
              width: 100,
            ),
          ),
          // Visibility(
          //   visible: taskModel.isTaskTeamOwner!,
          //   child: PrimaryButton(
          //     buttonText: 'Start Task',
          //     handleOnPressed: () =>
          //         _handleStartTaskOnPressed(taskId: taskModel.taskId),
          //     width: 100,
          //   ),
          // ),
          Visibility(
            visible: taskModel.isAcceptButtonVisible!,
            child: PrimaryButton(
              buttonText: 'Accept',
              handleOnPressed: () {},
              width: 100,
            ),
          ),
          Visibility(
            visible: taskModel.isCloseButtonVisible!,
            child: PrimaryButton(
              buttonText: 'Close',
              handleOnPressed: () => Navigator.pop(context),
              width: 100,
            ),
          ),
          Visibility(
            visible: taskModel.isSaveChangesVisible!,
            child: PrimaryButton(
              buttonText: 'Save Changes',
              handleOnPressed: () {
                for (var i = 0; i < columnComponentList.length; i++) {
                  if (_phoneNumberConditions(i)) {
                    if (!validateMobile(udfJson[columnComponentList[i].key]!)) {
                      return displaySnackBar(
                          text:
                              'Please enter valid ${columnComponentList[i].label}',
                          context: context);
                      // return;
                    }
                  }
                }
                taskViewModelPostRequest(
                  2,
                  'TASK_STATUS_SAVECHAGES',
                  createServiceFormBloc,
                );
              },
              width: 100,
            ),
          ),
          Visibility(
            visible: taskModel.isCompleteButtonVisible!,
            child: PrimaryButton(
              backgroundColor: Colors.green,
              buttonText: 'Complete',
              handleOnPressed: () {
                taskViewModelPostRequest(
                  2,
                  'TASK_STATUS_COMPLETE',
                  createServiceFormBloc,
                );

                // if (taskModel.isCompleteReasonRequired)
                //   enterReasonAlertDialog(
                //       context, 'Enter Reason', 'Please enter reason');
              },
              width: 100,
            ),
          ),
          Visibility(
            visible: taskModel.isDraftButtonVisible!,
            child: PrimaryButton(
              backgroundColor: Colors.greenAccent,
              buttonText: 'Draft',
              handleOnPressed: () {
                taskViewModelPostRequest(
                  1,
                  'TASK_STATUS_DRAFT',
                  createServiceFormBloc,
                );
              },
              width: 100,
            ),
          ),
          Visibility(
            visible: taskModel.isRejectButtonVisible!,
            child: PrimaryButton(
              backgroundColor: Colors.red,
              buttonText: 'Reject',
              handleOnPressed: () {
                // if (taskModel.isRejectReasonRequired!) {
                //   enterReasonAlertDialog(
                //       context, 'Enter Reason', 'Please enter reason');
                // }
                taskViewModelPostRequest(
                  2,
                  'TASK_STATUS_REJECT',
                  createServiceFormBloc,
                );
              },
              width: 100,
            ),
          ),
          Visibility(
            visible: taskModel.isReplyButtonVisible!,
            child: PrimaryButton(
              buttonText: 'Reply',
              handleOnPressed: () {},
              width: 100,
            ),
          ),
          Visibility(
            visible: taskModel.isSubmitButtonVisible!,
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
                taskViewModelPostRequest(
                  1,
                  'TASK_STATUS_INPROGRESS',
                  createServiceFormBloc,
                );
              },
              width: 100,
            ),
          ),
        ],
      ),
    );
  }

  _handleLockYourTaskOnPressed({
    String? taskId,
    String? userId,
  }) async {
    Map<String, dynamic>? queryparams;
    queryparams = {
      'taskId': taskId,
      'userId': userId,
    };

    setState(() {
      isVisible = true;
    });

    String result = await taskBloc.lockTaskData(queryparams: queryparams);

    setState(() {
      isVisible = false;
    });

    if (userId == null) {
      _displayResult(context: context, message: result);
    } else if (result == 'Task locked successfully.') {
      _displayResult(
          context: context,
          message: "Task re-assigned to: ${_selectedModel?.name ?? "-"}");
    }

    //
    taskBloc.getTaskDetails(
      templateCode: widget.taskTemplateCode,
      taskId: widget.taskId,
      userId: widget.userId,
    );
  }

  _handleReleaseLockOnPressed({String? taskId}) async {
    Map<String, dynamic>? queryparams;
    queryparams = {
      'taskId': taskId,
      // 'userId': widget.userId,
    };

    setState(() {
      isVisible = true;
    });

    String result = await taskBloc.releaseTaskData(queryparams: queryparams);

    setState(() {
      isVisible = false;
    });

    _displayResult(context: context, message: result);

    //
    taskBloc.getTaskDetails(
      templateCode: widget.taskTemplateCode,
      taskId: widget.taskId,
      userId: widget.userId,
    );
  }

  // _handleStartTaskOnPressed({String? taskId}) async {
  //   Map<String, dynamic>? queryparams;
  //   queryparams = {'taskId': taskId};
  //   PostResponse result =
  //       await taskBloc.startTaskData(queryparams: queryparams);

  //   _displayResult(context: context, message: result.messages);
  // }

  _displayResult({BuildContext? context, String? message}) {
    setState(() {
      isVisible = false;
    });
    displaySnackBar(text: message, context: context);
  }

  taskViewModelPostRequest(
    int postDataAction,
    String taskStatusCode,
    CreateServiceFormBloc createServiceFormBloc,
  ) async {
    String userId = widget.userId;

    String stringModel = jsonEncode(taskModel);
    var jsonModel = jsonDecode(stringModel);
    postTaskModel = TaskModel.fromJson(jsonModel);

    postTaskModel.ownerUserId = userId;
    postTaskModel.requestedByUserId = userId;
    postTaskModel.assignedToUserId = userId;
    postTaskModel.taskSubject = createServiceFormBloc.subject.value;
    postTaskModel.taskDescription = createServiceFormBloc.description.value;
    postTaskModel.dataAction = postDataAction;
    postTaskModel.taskStatusCode = taskStatusCode;

    postTaskModel.portalId = !widget.isEmployeePortal
        ? APIEndpointConstants.EGOV_CUSTOMER_PORTAL_ID
        : APIEndpointConstants.EGOV_EMPLOYEE_PORTAL_ID;

    postTaskModel.portalName = !widget.isEmployeePortal
        ? APIEndpointConstants.EGOV_CUSTOMER_PORTAL_NAME
        : APIEndpointConstants.EGOV_EMPLOYEE_PORTAL_NAME;

    postTaskModel.json = jsonEncode(udfJson);

    setState(() {
      isVisible = true;
    });

    PostResponse result = await taskBloc.postData(
      taskModel: postTaskModel,
    );

    if (result.isSuccess!) {
      setState(() {
        isVisible = false;
      });
      resultMsg = result.messages ?? '';
      Navigator.pop(context);
    } else {
      setState(() {
        isVisible = false;
      });
      resultMsg = result.messages ?? '';
    }

    if (resultMsg != null && resultMsg!.isNotEmpty) {
      displaySnackBar(text: resultMsg, context: context);
    }
  }

  bool checkLockVisibility() {
    if (taskModel.assignedToTeamId != null &&
        taskModel.assignedToTeamId.isNotEmpty) {
      if ((taskModel.isLockVisible.toString() != 'false') &&
          (taskModel.isReleaseVisible.toString() != 'true') &&
          (taskModel.assignedToUserId == widget.userId ||
              taskModel.ownerUserId == widget.userId)) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  bool checkReleaseVisibility() {
    if (taskModel.assignedToTeamId != null &&
        taskModel.assignedToTeamId.isNotEmpty) {
      if ((taskModel.isReleaseVisible.toString() == 'true')
          //  &&
          //     (taskModel.assignedToUserId == widget.userId ||
          //         taskModel.ownerUserId == widget.userId)
          ) //isOwner)
      {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  editTaskDDValue(
      {String? idKey,
      String? nameKey,
      String? url,
      String? code,
      int? index,
      TextEditingController? ddController}) async {
    NTSDropdownRepository ntsDdRepository = NTSDropdownRepository();
    String completeUrl = url! + "&filterKey=$idKey&filterValue=$code";
    NTSDropdownResponse ntsDdResponse = await ntsDdRepository.getFilteredDDData(
      idKey: idKey,
      nameKey: nameKey,
      url: completeUrl,
    );

    ddController!.text = ntsDdResponse.data?.elementAt(0).name ?? '';

    if (index != null) {
      selectValue[index] = ddController.text;
    }
  }

  void compareStartEndDate({
    required DateTime startDate,
    required DateTime enddate,
    required BuildContext context,
    required bool updateDuration,
  }) {
    if (enddate.isBefore(startDate)) {
      _showMyDialog();
    } else if (updateDuration) {
      updateLeaveDuration();
    }
  }

  void updateLeaveDuration() {
    if (leaveStartDate != null && leaveEnddate != null) {
      var durationCalendarDays = leaveEnddate!.difference(leaveStartDate!);

      setState(() {
        leaveDurationControllerCalendarDays.text =
            (durationCalendarDays.inDays + 1).toString();
      });
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
  // -------------------------------------------------- //
  //            Download code goes here.                //
  // -------------------------------------------------- //

  _handleDownloadOnPressed({
    @required data,
  }) async {
    if (data == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Data is unavailable. Please try again later."),
        ),
      );

      return;
    }

    Map<String, String> queryparams = {
      'fileId': data?.udfValue ?? '',
    };

    Response response = await Dio().get(
      APIEndpointConstants.DOWNLOAD_ATTACHMENT,
      queryParameters: queryparams,
    );

    String fileName = response.headers['content-disposition']![0]
        .split(';')[1]
        .split('=')[1]
        .trim();

    if (fileName == null || fileName.isEmpty) {
      fileName = data?.label ?? 'DEFAULT_FILE_NAME';
    }

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

  Widget _mapWidget({
    bool? isGoogleMaps = false,
  }) {
    return const GoogleMapsCurrentLocationWidget();
  }

  _phoneNumberConditions(int i) {
    return ((((columnComponentList[i].type == 'number' &&
                    (columnComponentList[i].key!.contains('MobileNo') ||
                        columnComponentList[i].key!.contains('ContactNumber') ||
                        columnComponentList[i].key!.contains('ContactNo'))) ||
                columnComponentList[i].type == 'phoneNumber') &&
            udfJson[columnComponentList[i].key] != null &&
            udfJson[columnComponentList[i].key]!.isNotEmpty) ||
        ((columnComponentList[i].validate?.required != null &&
                columnComponentList[i].validate!.required == true &&
                ((columnComponentList[i].type == 'number' &&
                        (columnComponentList[i].key!.contains('MobileNo') ||
                            columnComponentList[i]
                                .key!
                                .contains('ContactNumber') ||
                            columnComponentList[i]
                                .key!
                                .contains('ContactNo'))) ||
                    columnComponentList[i].type == 'phoneNumber')) &&
            columnComponentList[i].disabled.toString() != 'true'));
  }

  // Widget _futureBuilderWidget<T>({
  //   required String key,
  //   required Future<T?> future,
  //   TextEditingController? controller,
  //   required String title,
  //   required String url,
  //   required void Function(dynamic) onListTap,
  // }) =>
  //     FutureBuilder<T?>(
  //       future: future,
  //       builder: (
  //         BuildContext context,
  //         AsyncSnapshot snapshot,
  //       ) {
  //         if (snapshot.hasData) {
  //           return Center(
  //             child: NTSDropDownSelect(
  //               commonListValues:
  //                   url.contains('GetLOVIdNameList') ? snapshot.data.list : [],
  //               teamListValues:
  //                   url.contains('ReadTeamData') ? snapshot.data.list : [],
  //               userListValues: url.contains('ReadUserData') ||
  //                       url.contains('ReadUserTeamData')
  //                   ? snapshot.data.list
  //                   : [],
  //               userHierarchyListValues: url.contains('ReadHierarchyMasterData')
  //                   ? snapshot.data.list
  //                   : [],
  //               title: title,
  //               controller: controller,
  //               hint: title,
  //               isShowArrow: true,
  //               url: url,
  //               onListTap: onListTap,
  //             ),
  //           );
  //         }

  //         return _loadingWidget(text: "Fetching metadata details...");
  //       },
  //     );

  // Widget _loadingWidget({
  //   String? text,
  // }) {
  //   return Center(
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         const CircularProgressIndicator(),
  //         SizedBox(height: 10.h),
  //         Text(text ?? "Loading..."),
  //       ],
  //     ),
  //   );
  // }

  // getAssignToTypeList(
  //   List<CommonListModel>? commonListValues,
  // ) async {
  //   CommonListResponse commonListResponse = await commonBloc.getLOVIdNameList(
  //     queryparams: {
  //       'lovType': 'TASK_ASSIGN_TO_TYPE',
  //     },
  //   );

  //   commonListValues = commonListResponse.list;
  // }
}
