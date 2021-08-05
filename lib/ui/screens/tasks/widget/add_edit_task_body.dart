import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../../../../constants/api_endpoints.dart';
import '../../../../data/models/user/user.dart';
import '../../../../logic/blocs/user_bloc/user_bloc.dart';
import '../../../widgets/appbar_widget.dart';
import '../../../../constants/api_endpoints.dart';
import '../../../../data/models/user/user.dart';
import '../../../../logic/blocs/user_bloc/user_bloc.dart';
import '../../../../data/enums/enums.dart';
import '../../../../data/models/task_models/task_model.dart';
import '../../../../data/models/task_models/task_response_model.dart';
import '../../../../logic/blocs/nts_dropdown_bloc/nts_dropdown_api_bloc.dart';
import '../../../../logic/blocs/task_bloc/task_bloc.dart';
import '../../../../routes/route_constants.dart';
import '../../../../routes/screen_arguments.dart';
import '../../service/create_service_form_bloc.dart';
import '../../../../data/models/api_models/post_response_model.dart';
import '../../../../data/models/nts_dropdown/nts_dropdown_model.dart';
import '../../../../data/models/udf_json_model/udf_json_model.dart';
import '../../../../themes/theme_config.dart';
import '../../../widgets/form_widgets/bloc_number_box_widget.dart';
import '../../../widgets/form_widgets/bloc_radio_button_widget.dart';
import '../../../widgets/form_widgets/bloc_text_box_widget.dart';
import '../../../widgets/nts_dropdown_select.dart';
import '../../../widgets/nts_widgets.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/progress_indicator.dart';
import '../../../widgets/snack_bar.dart';
import 'package:sizer/sizer.dart';

class AddEditTaskBody extends StatefulWidget {
  final String templateCode;
  final String taskId;
  final String title;
  const AddEditTaskBody({Key key, this.templateCode, this.taskId, this.title});

  @override
  _AddEditTaskBodyState createState() => _AddEditTaskBodyState();
}

class _AddEditTaskBodyState extends State<AddEditTaskBody> {
  // to render UDFS
  List<Widget> columnComponentWidgets = [];
  List<Widget> componentComListWidgets = [];
  List<Widget> udfJsonCompWidgetList = [];

  final Map<String, String> udfJson = {};
  TaskModel taskModel;
  TaskModel postTaskModel = TaskModel();
  UdfJson udfJsonString;
  List<ColumnComponent> columnComponent = [];
  List<ComponentComponent> componentComList = [];
  List<UdfJsonComponent> udfJsonComponent = [];
  final formReason = GlobalKey<FormState>();
  TextEditingController cancelReason = TextEditingController();
  DateTime startDate;
  DateTime dueDate;
  bool isVisible = false;
  List<String> selectValue = [];
  String subjectValue;
  String descriptionValue;
  String slaValue;
  String ownerUserId;

  DateTime leaveStartDate;
  DateTime leaveEnddate;
  TextEditingController leaveDurationControllerCalendarDays =
      new TextEditingController();
  TextEditingController leaveDurationControllerWorkingDays =
      new TextEditingController();
 TextEditingController _fromddController = new TextEditingController();

  void updateLeaveDuration() {
    if (leaveStartDate != null && leaveEnddate != null) {
      var durationCalendarDays = leaveEnddate.difference(leaveStartDate);

      setState(() {
        leaveDurationControllerCalendarDays.text =
            (durationCalendarDays.inDays + 1).toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    taskBloc
      ..getTaskDetails(
        templateCode: widget.templateCode,
        taskId: widget.taskId,
        // userId: '45bba746-3309-49b7-9c03-b5793369d73c',
      );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateServiceFormBloc(),
      child: Container(
        padding: DEFAULT_PADDING,
        child: StreamBuilder<TaskResponseModel>(
            stream: taskBloc.subjectGetTaskDetails.stream,
            builder: (context, AsyncSnapshot snapshot) {
              print("Snapshot data: ${snapshot.data}");
              if (snapshot.hasData) {
                if (snapshot?.data?.error != null &&
                    snapshot.data.error.length > 0) {
                  return Center(
                    child: Text(snapshot.data.error),
                  );
                }
                final createServiceFormBloc =
                    context.read<CreateServiceFormBloc>();
                taskModel = snapshot?.data?.data;

                if (taskModel.json != null) {
                  parseJsonToUDFModel(
                    createServiceFormBloc,
                    taskModel.json,
                  );
                }

                return Scaffold(
                  appBar: AppbarWidget(
                    // actions: [IconButton(icon: Icon(Icons.comment), onPressed: () {})],
                    title: (widget.templateCode != null &&
                            widget.templateCode.isNotEmpty)
                        ? "Create Task"// + widget.templateCode
                        // : widget.title != null
                        //     ? "Edit $widget.title"
                            : "Edit Task",
                  ),
                  body: FormBlocListener<CreateServiceFormBloc, String, String>(
                    onSuccess: (context, state) {},
                    onFailure: (context, state) {},
                    child: taskModel.id != null
                        ? setTaskView(
                            context,
                            createServiceFormBloc,
                         
                          )
                        : SizedBox(),
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
    );
  }

  parseJsonToUDFModel(
    CreateServiceFormBloc createServiceFormBloc,
    udfJsonString,
  ) {
    columnComponent = [];
    componentComList = [];
    udfJsonComponent = [];
    if(udfJsonString!=null)
    {
    udfJsonString = UdfJson.fromJson(jsonDecode(udfJsonString));
    for (UdfJsonComponent component in udfJsonString.components) {
      if (component.columns != null && component.columns.isNotEmpty) {
        for (Columns column in component.columns) {
          for (ColumnComponent columnCom in column.components) {
            columnComponent.add(columnCom);
          }
        }
      }
      if (component.components != null && component.components.isNotEmpty) {
        for (ComponentComponent componentComponent in component.components) {
          componentComList.add(componentComponent);
        }
      }
    }

    for (UdfJsonComponent component in udfJsonString.components) {
      if (component.columns == null &&
          (component.components == null || component.components.length == 0)) {
        udfJsonComponent.add(component);
      } else if (component.components == null &&
          component.columns.length == 0) {
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

  Widget setTaskView(
    BuildContext context,
    CreateServiceFormBloc createServiceFormBloc,
  ) {
    _fromddController.text=taskModel.ownerUserName;
    return Stack(
      children: [
        SingleChildScrollView(
          physics: ClampingScrollPhysics(),
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
              color: Colors.grey[100],
              child: displayFooterWidget(
                taskModel,
                createServiceFormBloc,
              ),
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

  List<Widget> formFieldsWidgets(
      context, createServiceFormBloc, TaskModel taskModel) {
    List<Widget> widgets = [];
   

    widgets.add(Container(
      padding: EdgeInsets.all(8.0),
      height: 12.h,
      color: Colors.blue[100],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          rowChild(taskModel.taskNo, 'Task No', 3),
          rowChild(taskModel.taskStatusName, 'Status', 2),
          rowChild(taskModel.versionNo.toString(), 'Version No', 2),
        ],
      ),
    ));
    if (!taskModel.hideSubject) {
      createServiceFormBloc.subject
          .updateInitialValue(subjectValue ?? taskModel.taskSubject);
      widgets.add(BlocTextBoxWidget(
        fieldName: 'Subject',
        readonly: false,
        maxLines: 1,
        labelName: 'Subject',
        textFieldBloc: createServiceFormBloc.subject,
        prefixIcon: Icon(Icons.note),
        onChanged: (value) {
          subjectValue = value.toString();
        },
      ));
    }

    // if (!taskModel.hideStartDate)
      widgets.add(
        Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: DynamicDateTimeBox(
                code: taskModel.startDate,
                name: 'Start Date',
                key: new Key('Start Date'),
                selectDate: (DateTime date) {
                  if (date != null) {
                    setState(() async {
                      startDate = date;
                      if (dueDate != null && dueDate.toString().isNotEmpty)
                        compareStartEndDate(
                            startDate: startDate,
                            enddate: dueDate,
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
                key: new Key('Due Date'),
                selectDate: (DateTime date) {
                  if (date != null) {
                    setState(() async {
                      dueDate = date;
                      if (startDate != null && startDate.toString().isNotEmpty)
                        compareStartEndDate(
                            startDate: startDate,
                            enddate: dueDate,
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
      );

    if (!taskModel.hideSla) {
      createServiceFormBloc.sla
          .updateInitialValue(slaValue ?? taskModel.taskSla);
      widgets.add(BlocTextBoxWidget(
        fieldName: 'SLA',
        readonly: false,
        maxLines: 1,
        labelName: 'SLA',
        textFieldBloc: createServiceFormBloc.sla,
        prefixIcon: Icon(Icons.note),
        onChanged: (value) {
          slaValue = value.toString();
        },
      ));
    }

    // if (!taskModel.hideRe)
    //   widgets.add(BlocDatePickerWidget(
    //     labelName: 'Reminder Date',
    //     canSelectTime: false,
    //     inputFieldBloc: createServiceFormBloc.expiryDate,
    //     height: 75.0,
    //     width: MediaQuery.of(context).size.width,
    //   ));

    if (!taskModel.hideDescription) {
      createServiceFormBloc.description
          .updateInitialValue(descriptionValue ?? taskModel.taskDescription);
      widgets.add(BlocTextBoxWidget(
        fieldName: 'Description',
        readonly: false,
        maxLines: 3,
        labelName: 'Description',
        textFieldBloc: createServiceFormBloc.description,
        prefixIcon: Icon(Icons.note),
        onChanged: (value) {
          descriptionValue = value.toString();
        },
      ));
    }

    widgets.add(
      NTSDropDownSelect(
        isUserList: true,
        title: 'From',
        controller: _fromddController,
        hint: 'From',
        isShowArrow: true,
        onListTap: (dynamic value) {
          userBLoc.subjectUserDataList.sink.add(null);
          User _user = value;
          _fromddController.text = _user.name;
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
      // print(model[i].type);
      // print(model[i].udfValue);
      if (model[i].type == 'textfield') {
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null || widget.taskId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId == null || widget.taskId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        final textField$i =
            new TextFieldBloc(initialValue: udfJson[model[i].key]);
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
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null || widget.taskId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId == null || widget.taskId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        // final textArea$i = new TextFieldBloc();
        final textArea$i =
            new TextFieldBloc(initialValue: udfJson[model[i].key]);
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
        String initialValue;
        // if (model[i].key == 'LeaveDurationCalendarDays' &&
        //     (leaveDurationControllerCalendarDays.text != null &&
        //         leaveDurationControllerCalendarDays.text.isNotEmpty)) {
        //   initialValue = leaveDurationControllerCalendarDays.text;
        // udfJson[model[i].key] = initialValue;
        // }
        // final number$i = new TextFieldBloc(initialValue: initialValue);
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId == null || widget.taskId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null || widget.taskId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        if (model[i].key == 'LeaveDurationCalendarDays' &&
            (leaveDurationControllerCalendarDays.text != null &&
                leaveDurationControllerCalendarDays.text.isNotEmpty)) {
          initialValue = leaveDurationControllerCalendarDays.text;
          udfJson[model[i].key] = initialValue;
          initialValue = udfJson[model[i].key];
        }
        final number$i = new TextFieldBloc(initialValue: udfJson[model[i].key]);
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
            (widget.taskId != null || widget.taskId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId == null || widget.taskId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        final password$i =
            new TextFieldBloc(initialValue: udfJson[model[i].key]);
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
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null || widget.taskId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId == null || widget.taskId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
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
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null || widget.taskId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId == null || widget.taskId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
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
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null || widget.taskId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId == null || widget.taskId.isEmpty)) {
          udfJson[model[i].key] = '';
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
        // if (!udfJson.containsKey(model[i].key) &&
        //     (widget.taskId != null || widget.taskId.isNotEmpty)) {
        //   udfJson[model[i].key] = model[i].udfValue ?? '';
        //   _ddController.text = udfJson[model[i].key];
        // }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId == null || widget.taskId.isEmpty)) {
          udfJson[model[i].key] = '';
          if (selectValue.length < model.length) {
            for (var j = selectValue.length; j < model.length; j++) {
              selectValue.add(null);
            }
          }
         } if ((selectValue != null && selectValue.isNotEmpty) &&
            (selectValue[i] != null && selectValue[i].isNotEmpty)) {
          _ddController.text = selectValue[i];
        }
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
            ntsDdBloc.subject.sink.add(null);
            NTSDropdownModel _selectedIdNameViewModel = value;
            _ddController.text = _selectedIdNameViewModel.name;
            selectValue[i] = _selectedIdNameViewModel.name;
            udfJson[model[i].key] = _selectedIdNameViewModel.id;
          },
        ));
      } else if (model[i].type == 'datetime') {
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId == null || widget.taskId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null || widget.taskId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        listDynamic.add(new DynamicDateTimeBox(
          code: udfJson[model[i].key].isNotEmpty
              ? DateFormat("yyyy-MM-dd").parse(udfJson[model[i].key]).toString()
              : null,

          // code: model[i].inputFormat != null || model[i].inputFormat != ''
          //     ? model[i].inputFormat
          //     : null,
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
                    startDate: leaveStartDate,
                    enddate: leaveEnddate,
                    context: context,
                    updateDuration: true);
              }
            }
          },
        ));
      } else if (model[i].type == 'time') {
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null || widget.taskId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId == null || widget.taskId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        listDynamic.add(
          new DynamicTimeBox(
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
            (widget.taskId != null || widget.taskId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId == null || widget.taskId.isEmpty)) {
          udfJson[model[i].key] = '';
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
            (widget.taskId != null || widget.taskId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId == null || widget.taskId.isEmpty)) {
          udfJson[model[i].key] = '';
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
            (widget.taskId != null || widget.taskId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId == null || widget.taskId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        final email$i = new TextFieldBloc(
            validators: [FieldBlocValidators.email],
            initialValue: udfJson[model[i].key]);
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
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId != null || widget.taskId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.taskId == null || widget.taskId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        final textField$i =
            new TextFieldBloc(initialValue: udfJson[model[i].key]);
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
    for (var row in tableWidgets) {
      table.add(TableRow(children: [row]));
    }
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

  displayFooterWidget(
    TaskModel taskModel,
    CreateServiceFormBloc createServiceFormBloc,
  ) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Visibility(
            visible: taskModel.isAcceptButtonVisible,
            child: PrimaryButton(
              buttonText: 'Accept',
              handleOnPressed: () {},
              width: 100,
            ),
          ),
          // Visibility(
          //   visible: taskModel.isAddCommentEnabled &&
          //       widget.taskId != null &&
          //       widget.taskId.isNotEmpty,
          //   child: PrimaryButton(
          //     buttonText: 'Add comment',
          //     handleOnPressed: () {
          //       Navigator.pushNamed(context, COMMENT_ROUTE,
          //           arguments: ScreenArguments(
          //             ntstype: NTSType.task,
          //             arg1: taskModel.taskId,
          //           ));
          //     },
          //     width: 100,
          //   ),
          // ),
          // Visibility(
          //   visible: taskModel.enableCancelButton,
          //   child: PrimaryButton(
          //     buttonText: 'Cancel',
          //     handleOnPressed: () {
          //       if (taskModel.isCancelReasonRequired)
          //         enterReasonAlertDialog(context);
          //     },
          //     width: 100,
          //   ),
          // ),
          Visibility(
            visible: taskModel.isCloseButtonVisible,
            child: PrimaryButton(
              buttonText: 'Close',
              handleOnPressed: () => Navigator.pop(context),
              width: 100,
            ),
          ),
          Visibility(
            visible: taskModel.isCompleteButtonVisible,
            child: PrimaryButton(
              buttonText: 'Complete',
              handleOnPressed: () {
                taskViewModelPostRequest(
                  1,
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
            visible: taskModel.isDraftButtonVisible,
            child: PrimaryButton(
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
            visible: taskModel.isRejectButtonVisible,
            child: PrimaryButton(
              buttonText: 'Reject',
              handleOnPressed: () {
                if (taskModel.isRejectReasonRequired)
                  enterReasonAlertDialog(
                      context, 'Enter Reason', 'Please enter reason');
                taskViewModelPostRequest(
                  1,
                  'TASK_STATUS_REJECT',
                  createServiceFormBloc,
                );
              },
              width: 100,
            ),
          ),
          Visibility(
            visible: taskModel.isReplyButtonVisible,
            child: PrimaryButton(
              buttonText: 'Reply',
              handleOnPressed: () {},
              width: 100,
            ),
          ),
          Visibility(
            visible: taskModel.isSubmitButtonVisible,
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
                for (var i = 0; i < componentComList.length; i++) {
                  if (componentComList[i]?.validate?.required != null &&
                      componentComList[i].validate.required == true &&
                      udfJson.containsKey(componentComList[i].key) &&
                      (udfJson[componentComList[i].key] == null ||
                          udfJson[componentComList[i].key].isEmpty)) {
                    displaySnackBar(
                        text: 'Please enter ${componentComList[i].label}',
                        context: context);
                    return;
                  }
                }
                for (var i = 0; i < udfJsonComponent.length; i++) {
                  if (udfJsonComponent[i]?.validate?.required != null &&
                      udfJsonComponent[i].validate.required == true &&
                      udfJson.containsKey(udfJsonComponent[i].key) &&
                      (udfJson[udfJsonComponent[i].key] == null ||
                          udfJson[udfJsonComponent[i].key].isEmpty)) {
                    displaySnackBar(
                        text: 'Please enter ${udfJsonComponent[i].label}',
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

  requiredFieldValidations() {
    for (var i = 0; i < columnComponent.length; i++) {
      if (columnComponent[i]?.validate?.required != null &&
          columnComponent[i].validate.required == true &&
          udfJson.containsKey(columnComponent[i].key) &&
          (udfJson[columnComponent[i].key] == null ||
              udfJson[columnComponent[i].key].isEmpty)) {
        displaySnackBar(
            text: 'Please enter ${columnComponent[i].label}', context: context);
        return;
      }
    }
    for (var i = 0; i < componentComList.length; i++) {
      if (componentComList[i]?.validate?.required != null &&
          componentComList[i].validate.required == true &&
          udfJson.containsKey(componentComList[i].key) &&
          (udfJson[componentComList[i].key] == null ||
              udfJson[componentComList[i].key].isEmpty)) {
        displaySnackBar(
            text: 'Please enter ${componentComList[i].label}',
            context: context);
        return;
      }
    }
    for (var i = 0; i < udfJsonComponent.length; i++) {
      if (udfJsonComponent[i]?.validate?.required != null &&
          udfJsonComponent[i].validate.required == true &&
          udfJson.containsKey(udfJsonComponent[i].key) &&
          (udfJson[udfJsonComponent[i].key] == null ||
              udfJson[udfJsonComponent[i].key].isEmpty)) {
        displaySnackBar(
            text: 'Please enter ${udfJsonComponent[i].label}',
            context: context);
        return;
      }
    }
  }

  enterReasonAlertDialog(BuildContext context, String title, String label) {
    return showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
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
                  border: OutlineInputBorder(), labelText: label),
              validator: (value) {
                return ((value == null || value.isEmpty) ? label : null);
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
      {DateTime startDate,
      DateTime enddate,
      BuildContext context,
      bool updateDuration}) {
    if (enddate.isBefore(startDate))
      _showMyDialog();
    else if (updateDuration) updateLeaveDuration();
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

  String resultMsg = '';
  taskViewModelPostRequest(int postDataAction, String taskStatusCode,
      CreateServiceFormBloc createServiceFormBloc) async {
    String userId = await getUserId();
    String stringModel = jsonEncode(taskModel);
    var jsonModel = jsonDecode(stringModel);
    postTaskModel = TaskModel.fromJson(jsonModel);

    postTaskModel.ownerUserId = ownerUserId;
    postTaskModel.requestedByUserId = userId;
    postTaskModel.assignedToUserId =
        userId; //TODO: set appropriate "assignedToUserId"
    postTaskModel.taskSubject = createServiceFormBloc.subject.value;
    postTaskModel.taskDescription = createServiceFormBloc.description.value;
    postTaskModel.dataAction = postDataAction;
    postTaskModel.taskStatusCode = taskStatusCode;
    postTaskModel.json = jsonEncode(udfJson);
    print(udfJson);

    setState(() {
      isVisible = true;
    });

    PostResponse result = await taskBloc.postData(
      taskModel: postTaskModel,
    );
    print(result);
    if (result.isSuccess) {
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
    displaySnackBar(text: resultMsg, context: context);
  }

  SpeedDial buildSpeedDial() {
    return SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 28.0),
        backgroundColor: Colors.blue[900],
        visible: true,
        curve: Curves.bounceInOut,
        children: [
          SpeedDialChild(
              visible: taskModel.isAddCommentEnabled &&
                widget.taskId != null &&
                widget.taskId.isNotEmpty,
              child: Icon(Icons.comment, color: Colors.white),
              backgroundColor: Colors.blue,
              onTap: (){ Navigator.pushNamed(context, COMMENT_ROUTE,
                    arguments: ScreenArguments(
                      ntstype: NTSType.task,
                      arg1: taskModel.taskId,
                    ));},
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
          //   SpeedDialChild(
          //     child:
          //         Icon(Icons.notifications_active_outlined, color: Colors.white),
          //     backgroundColor: Colors.blue,
          //     onTap: () => print('Pressed Read Later'),
          //     label: 'Notification',
          //     labelStyle:
          //         TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          //     labelBackgroundColor: Colors.black,
          //   ),
            
          //   SpeedDialChild(
          //     child: Icon(Icons.share, color: Colors.white),
          //     backgroundColor: Colors.blue,
          //     onTap: () => print('Pressed Code'),
          //     label: 'Share',
          //     labelStyle:
          //         TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          //     labelBackgroundColor: Colors.black,
          //   ),
          //   SpeedDialChild(
          //     child: Icon(Icons.timeline_outlined, color: Colors.white),
          //     backgroundColor: Colors.blue,
          //     onTap: () => print('Pressed Code'),
          //     label: 'Time Entries',
          //     labelStyle:
          //         TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          //     labelBackgroundColor: Colors.black,
          //   ),
          //   SpeedDialChild(
          //     child: Icon(Icons.email, color: Colors.white),
          //     backgroundColor: Colors.blue,
          //     onTap: () => print('Pressed Code'),
          //     label: 'Email',
          //     labelStyle:
          //         TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          //     labelBackgroundColor: Colors.black,
          //   ),
          //   SpeedDialChild(
          //     child: Icon(Icons.tag, color: Colors.white),
          //     backgroundColor: Colors.blue,
          //     onTap: () => print('Pressed Code'),
          //     label: 'Tags',
          //     labelStyle:
          //         TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          //     labelBackgroundColor: Colors.black,
          //   ),
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
        ntstype: NTSType.task,
        arg1: taskModel.id,
      ),
    );
  }
}
