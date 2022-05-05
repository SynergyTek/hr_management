import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:sizer/sizer.dart';
import 'package:synergy_nts/src/theme/theme_config.dart';
import 'package:synergy_nts/src/ui/map_widgets/google_maps_current_location_widget.dart';
import 'package:synergy_nts/src/ui/nts_comments/nts_comments_screen.dart';
import 'package:synergy_nts/src/ui/share/share_screen.dart';
import 'package:synergy_nts/src/ui/tag_nts_screen/tag_nts_screen.dart';
import 'package:synergy_nts/src/ui/widgets/form_widgets.dart';

// Constansts:
import '../bloc/nts_dropdown_bloc/abstract_nts_dropdown_bloc.dart';
import '../bloc/task_bloc/abstract_task_bloc.dart';
import '../bloc/user_bloc/abstract_user_bloc.dart';
import '../constants/api_endpoints.dart';

// Widgets/UI
import '../../synergy_nts.dart';

// Helpers:
import '../helpers/download_helper/download.dart';
import '../helpers/multiselectList_helper.dart';
import '../helpers/parse_json_helper.dart';
import '../helpers/validation_helper.dart';
import '../models/nts_dropdown_model/nts_dropdown_model.dart';
import '../models/udf_models/udf_json_model.dart';
import '../models/user_model/team_model.dart';
import '../theme/light_theme.dart';
import 'attachment_nts_screen/attachment_nts_screen.dart';
import 'widgets/form_widgets/attachment.dart';
import 'widgets/widgets.dart';
import 'task_widgets/task_widgets/widgets/reassign_bottom_sheet_widget.dart';

class TaskWidget extends StatefulWidget {
  final String userId;
  // final bool isEmployeePortal;

  final String? title;
  final String taskId;
  final String? taskTemplateCode;
  final String? serviceTemplateCode;
  final Map<String, dynamic>? extraInformationMap;

  const TaskWidget({
    Key? key,
    //
    required this.userId,
    // required this.isEmployeePortal,
    this.title,
    required this.taskId,
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

  DateTime? startDate;
  DateTime? dueDate;
  String? resultMsg = "";
  String? subjectValue;
  String? descriptionValue;
  String? slaValue;
  bool isTileVisible = true;
  TextEditingController _fromddController = TextEditingController();
  String? ownerUserId;

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

  @override
  void initState() {
    taskBloc.subjectGetTaskDetails.sink.add(null);
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
                  floatingActionButton: buildSpeedDial(),
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

  SpeedDial buildSpeedDial() {
    return SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: const IconThemeData(size: 28.0),
        backgroundColor: LightTheme().lightThemeData().primaryColor,
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
            visible: taskModel.isAddCommentEnabled! && widget.taskId.isNotEmpty,
            child: Icon(Icons.comment, color: Colors.white),
            backgroundColor: Colors.blue,
            onTap: () => _handleCommentOnPressed(),
            label: 'Comment',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.black,
          ),

          SpeedDialChild(
            visible: taskModel.isAddCommentEnabled! && widget.taskId.isNotEmpty,
            child: Icon(Icons.timelapse, color: Colors.white),
            backgroundColor: Colors.blue,
            onTap: () {
              // Navigator.pushNamed(
              //   context,
              //   COMMENT_ROUTE,
              //   arguments: ScreenArguments(
              //     ntstype: NTSType.service,
              //     arg1: serviceModel!.serviceId,
              //   ),
              // );
            },
            label: 'Time entries',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.black,
          ),
          SpeedDialChild(
            visible: taskModel.isAddCommentEnabled! && widget.taskId.isNotEmpty,
            child: Icon(Icons.email_sharp, color: Colors.white),
            backgroundColor: Colors.blue,
            onTap: () {
              // Navigator.pushNamed(
              //   context,
              //   COMMENT_ROUTE,
              //   arguments: ScreenArguments(
              //     ntstype: NTSType.service,
              //     arg1: serviceModel!.serviceId,
              //   ),
              // );
            },
            label: 'Emails',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.black,
          ),
          SpeedDialChild(
            visible: taskModel.isAddCommentEnabled! && widget.taskId.isNotEmpty,
            child: Icon(Icons.tag_sharp, color: Colors.white),
            backgroundColor: Colors.blue,
            onTap: () => _handleTagOnPressed(),
            label: 'Tags',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.black,
          ),
          SpeedDialChild(
            visible: taskModel.isAddCommentEnabled! && widget.taskId.isNotEmpty,
            child: Icon(Icons.info, color: Colors.white),
            backgroundColor: Colors.blue,
            onTap: () {
              // Navigator.pushNamed(
              //   context,
              //   COMMENT_ROUTE,
              //   arguments: ScreenArguments(
              //     ntstype: NTSType.service,
              //     arg1: serviceModel!.serviceId,
              //   ),
              // );
            },
            label: 'Logs',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.black,
          ),

          SpeedDialChild(
            visible: taskModel.isAddCommentEnabled! && widget.taskId.isNotEmpty,
            child: Icon(Icons.notifications, color: Colors.white),
            backgroundColor: Colors.blue,
            onTap: () {
              // Navigator.pushNamed(
              //   context,
              //   COMMENT_ROUTE,
              //   arguments: ScreenArguments(
              //     ntstype: NTSType.service,
              //     arg1: serviceModel!.serviceId,
              //   ),
              // );
            },
            label: 'Notification',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.black,
          ),

          SpeedDialChild(
            child: const Icon(
              Icons.attachment_outlined,
              color: Colors.white,
            ),
            backgroundColor: Theme.of(context).textHeadingColor,
            onTap: () => _handleAttachmentOnPressed(),
            label: 'Attachment',
            labelStyle: const TextStyle(
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
            visible: widget.taskId != null && widget.taskId.isNotEmpty,
            child: Icon(Icons.share, color: Colors.white),
            backgroundColor: Colors.blue,
            onTap: () => _handleShareOnPressed(),
            //  => Navigator.pushNamed(context, NTS_SHARE,
            //     arguments: ScreenArguments(
            //       ntstype: NTSType.service,
            //       arg1: serviceModel!.serviceId,
            //     )),
            label: 'Share',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.black,
          ),
          // SpeedDialChild(
          //   visible: widget.taskId.isNotEmpty,
          //   child: const Icon(Icons.share, color: Colors.white),
          //   backgroundColor: Colors.blue,
          //   onTap: () {},
          //   //  => Navigator.pushNamed(
          //   //   context,
          //   //   ADD_ADHOC_TASK,
          //   //   // arguments: ScreenArguments(
          //   //   //   ntstype: NTSType.task,
          //   //   //   arg4: 'ProjectTask',
          //   //   // ),
          //   // ),
          //   label: 'Adhoc Task',
          //   labelStyle:
          //       TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          //   labelBackgroundColor: Colors.black,
          // ),

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

  _handleShareOnPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return ShareScreen(
          ntsId: widget.taskId,
          ntsType: NTSType.service,
        );
      }),
    );
  }

  _handleTagOnPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return TagNTSScreen(
          ntsId: widget.taskId,
          ntsType: NTSType.service,
        );
      }),
    );
  }

  _handleCommentOnPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return NTSCommentsScreen(
          userId: widget.userId,
          ntsId: widget.taskId,
        );
      }),
    );
  }

  _handleAttachmentOnPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return AttachmentNTSScreen(
          userId: widget.userId,
          ntsType: NTSType.task,
          ntsId: widget.taskId,
        );
      }),
    );
  }

  Widget setTaskView(
    BuildContext context,
    CreateServiceFormBloc createServiceFormBloc,
  ) {
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

    columnComponentList = _parseJsonHelper.parseGenericUDFs(
      udfJsonString,
      conditionalValues,
      widget.taskId,
    );
    if (columnComponentList.isNotEmpty) {
      columnComponentWidgets = addDynamic(
        columnComponentList,
        createServiceFormBloc,
        false,
      );
    }
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
            (widget.taskId != null || widget.taskId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId == null || widget.taskId.isEmpty)) {
          udfJson[model[i].key] = '';
        }

        final textField$i = TextFieldBloc(
          initialValue: model[i].defaultValue ?? udfJson[model[i].key],
        );

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
            (widget.taskId != null && widget.taskId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId == null || widget.taskId.isEmpty)) {
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
        String initialValue;

        // final number$i = TextFieldBloc(initialValue: initialValue);
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId == null || widget.taskId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null || widget.taskId.isNotEmpty)) {
          udfJson[model[i].key] =
              model[i].udfValue ?? model[i]?.defaultValue?.toString() ?? '';
          leaveDurationControllerCalendarDays.text = udfJson[model[i].key]!;
          // leaveDurationControllerCalendarDays.text = model[i].udfValue;
          initialValue = leaveDurationControllerCalendarDays.text;
        }
        if (model[i].key == 'LeaveDurationCalendarDays') {
          initialValue = leaveDurationControllerCalendarDays.text;
        } else {
          initialValue = udfJson[model[i].key]!;
        }

        udfJson[model[i].key] = initialValue;

        final number$i = TextFieldBloc(initialValue: initialValue);
        listDynamic.add(
          BlocNumberBoxWidget(
            labelName: model[i].label,
            fieldName: model[i].label,
            readonly: true,
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
            (widget.taskId == null || widget.taskId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null || widget.taskId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        final password$i = TextFieldBloc(initialValue: udfJson[model[i].key]);
        listDynamic.add(
          BlocTextBoxWidget(
            isRequired: model[i].validate?.required,
            labelName: model[i].label,
            fieldName: model[i].label,
            readonly: true,
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
            (widget.taskId == null || widget.taskId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null || widget.taskId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        listDynamic.add(
          DynamicCheckBoxValue(
            readonly: true,
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
            (widget.taskId == null || widget.taskId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null || widget.taskId.isNotEmpty)) {
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
            (widget.taskId == null || widget.taskId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null || widget.taskId.isNotEmpty)) {
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
            (widget.taskId == null || widget.taskId.isEmpty)) {
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
            (widget.taskId != null || widget.taskId.isNotEmpty)) {
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
            isReadonly: true,
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
            (widget.taskId == null || widget.taskId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null || widget.taskId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        listDynamic.add(DynamicDateBox(
          isReadonly: true,
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
            (widget.taskId == null || widget.taskId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null || widget.taskId.isNotEmpty)) {
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
            (widget.taskId == null || widget.taskId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null || widget.taskId.isNotEmpty)) {
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
            (widget.taskId == null || widget.taskId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null || widget.taskId.isNotEmpty)) {
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
            (widget.taskId == null || widget.taskId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null || widget.taskId.isNotEmpty)) {
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
            (widget.taskId == null || widget.taskId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null || widget.taskId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }

        TextEditingController attachmentController = TextEditingController();
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId == null || widget.taskId.isEmpty)) {
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
            : selectValue.isNotEmpty
                ? (selectValue[i] == null || selectValue[i].isEmpty)
                    ? " (1) File Attached: " + udfJson[model[i].key]!
                    : " (1) File Attached: " + selectValue[i]
                : " (1) File Attached: " + udfJson[model[i].key]!;

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

    widgets.addAll(
      _staticFieldsWidget(
        context,
        createServiceFormBloc,
      ),
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

  List<Widget> _staticFieldsWidget(
    BuildContext context,
    CreateServiceFormBloc createServiceFormBloc,
  ) {
    List<Widget> listDynamic = [];

    _fromddController.text = taskModel.ownerUserName ?? '';
    ownerUserId = taskModel.ownerUserId;

    if (!taskModel.hideSubject!) {
      createServiceFormBloc.subject
          .updateInitialValue(subjectValue ?? taskModel.taskSubject);
      listDynamic.add(BlocTextBoxWidget(
        fieldName: 'Subject',
        readonly: false,
        maxLines: 1,
        labelName: 'Subject',
        textFieldBloc: createServiceFormBloc.subject,
        prefixIcon: const Icon(Icons.note),
        onChanged: (value) {
          subjectValue = value.toString();
        },
      ));
    }
    createServiceFormBloc.sla.updateInitialValue(slaValue ?? taskModel.taskSLA);
    listDynamic.add(
      ExpandableField(
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
            visible: !taskModel.hideStartDate!,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: DynamicDateTimeBox(
                    code: taskModel.startDate,
                    name: 'Start Date',
                    key: const Key('Start Date'),
                    selectDate: (DateTime date) {
                      if (date != null) {
                        setState(() async {
                          startDate = date;
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
                    code: taskModel.dueDate,
                    name: 'Due Date',
                    key: const Key('Due Date'),
                    selectDate: (DateTime date) {
                      if (date != null) {
                        setState(() async {
                          dueDate = date;
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
                )
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Visibility(
                  visible: !taskModel.hideSLA!,
                  child: BlocTextBoxWidget(
                    fieldName: 'SLA',
                    readonly: false,
                    maxLines: 1,
                    labelName: 'SLA',
                    textFieldBloc: createServiceFormBloc.sla,
                    prefixIcon: const Icon(Icons.note),
                    onChanged: (value) {
                      slaValue = value.toString();
                    },
                  ),
                ),
              ),
              Expanded(
                child: DynamicDateTimeBox(
                  code: taskModel.reminderDate,
                  name: 'Reminder Date',
                  key: const Key('Reminder Date'),
                  selectDate: (DateTime date) {
                    if (date != null) {
                      setState(() async {});
                      // udfJson[model[i].key] = date.toString();
                    }
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );

    if (!taskModel.hideDescription!) {
      createServiceFormBloc.description
          .updateInitialValue(descriptionValue ?? taskModel.taskDescription);
      listDynamic.add(BlocTextBoxWidget(
        fieldName: 'Description',
        readonly: false,
        maxLines: 3,
        labelName: 'Description',
        textFieldBloc: createServiceFormBloc.description,
        prefixIcon: const Icon(Icons.note),
        onChanged: (value) {
          descriptionValue = value.toString();
        },
      ));
    }

    listDynamic.add(
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
    return listDynamic;
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

    postTaskModel.portalId = APIEndpointConstants.EGOV_CUSTOMER_PORTAL_ID;

    postTaskModel.portalName = APIEndpointConstants.EGOV_CUSTOMER_PORTAL_NAME;

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
