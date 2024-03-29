import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:sizer/sizer.dart';
import 'package:synergy_nts/src/bloc/nts_dropdown_bloc/abstract_nts_dropdown_bloc.dart';
import 'package:synergy_nts/src/theme/theme_config.dart';

import '../../synergy_nts.dart';
import '../bloc/note_bloc/note_bloc.dart';
import '../bloc/user_bloc/abstract_user_bloc.dart';
import '../constants/api_endpoints.dart';
import '../helpers/download_helper/download.dart';
import '../helpers/parse_json_helper.dart';
import '../models/nts_dropdown_model/nts_dropdown_model.dart';
import '../models/udf_models/udf_json_model.dart';
import '../models/udf_models/udf_json_model_for_note.dart';
import 'attachment_nts_screen/attachment_nts_screen.dart';
import 'email_nts_screen/email_nts_screen.dart';
import 'nts_comments/nts_comments_screen.dart';
import 'share/share_screen.dart';
import 'tag_nts_screen/tag_nts_screen.dart';
import 'widgets/form_widgets.dart';
import 'widgets/form_widgets/attachment.dart';
import 'widgets/widgets.dart';
import 'package:intl/intl.dart';

class NoteWidget extends StatefulWidget {
  final String userID;
  final String noteId;

  final String? templateCode;
  final bool? isDependent;

  final bool isView;
  final Map<String, dynamic>? extraInformationMap;

  const NoteWidget({
    Key? key,

    //
    required this.userID,
    this.templateCode,
    this.noteId = "",
    this.isDependent = false,
    required this.isView,
    this.extraInformationMap,
  }) : super(key: key);

  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  late NoteModel? noteModel;

  late UdfJsonForNote? udfJsonString;

  NoteModel postNoteModel = NoteModel();
//TODO
  // List<ColumnComponentForNote> columnComponent = [];
  // List<ComponentComponentForNote> componentComList = [];
  // List<UdfJsonComponentForNote> udfJsonComponent = [];
  List<ColumnComponent> columnComponentList = [];
  Map<String, String> conditionalValues = {};

  List<Widget> columnComponentWidgets = [];
  List<Widget> componentComListWidgets = [];
  List<Widget> udfJsonCompWidgetList = [];
  List<String?> selectValue = [];

  final Map<String?, String?> udfJson = {};

  bool isVisible = false;
  bool isTileVisible = true;

  String? subjectValue;
  String? descriptionValue;
  String? slaValue;
  String? ownerUserId;

  DateTime? startDate;
  DateTime? dueDate;
  DateTime? leaveStartDate;
  DateTime? leaveEnddate;

  final TextEditingController _fromddController = TextEditingController();
  final TextEditingController leaveDurationControllerCalendarDays =
      TextEditingController();

  TextEditingController subject = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  void initState() {
    super.initState();

    noteBloc.getNoteDetails(
      queryparams: _handleNoteDetailsQueryparams(
        userid: widget.userID,
        noteId: widget.noteId,
        templatecode: widget.templateCode ?? '',
      ),
    );
  }

  _handleNoteDetailsQueryparams({
    required String userid,
    String? templatecode,
    String? noteId,
  }) {
    return {
      'templatecode': templatecode,
      'noteId': noteId,
      'userid': userid,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder<NoteResponse?>(
          stream: noteBloc.subjectNoteDetails.stream,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data?.error != null &&
                  snapshot.data.error.length > 0) {
                return Center(
                  child: Text(snapshot.data.error),
                );
              }
              // final createServiceFormBloc =
              //     context.read<CreateServiceFormBloc>();

              noteModel = snapshot.data?.data;

              parseJsonToUDFModel(
                //createServiceFormBloc,
                noteModel!.json,
              );

              return Scaffold(
                // body: FormBlocListener<
                //     //CreateServiceFormBloc,
                //     String,
                //     String>(
                //   onSubmitting: (context, state) {},
                //   onSuccess: (context, state) {},
                //   onFailure: (context, state) {},
                //   child: setServiceView(
                //     context,
                //     //createServiceFormBloc,
                //   ),
                // ),
                floatingActionButton: buildSpeedDial(),
              );
            } else {
              return const Center(
                child: CustomProgressIndicator(),
              );
            }
          }),
    );
  }

  SpeedDial buildSpeedDial() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: const IconThemeData(size: 28.0),
      backgroundColor: Colors.blue[900],
      visible: true,
      curve: Curves.bounceInOut,
      children: [
        //
        SpeedDialChild(
          child: const Icon(Icons.tag_sharp, color: Colors.white),
          backgroundColor: Colors.blue,
          onTap: () => _handleTagOnPressed(),
          label: 'Tags',
          labelStyle:
              const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          labelBackgroundColor: Colors.black,
        ),

        //
        SpeedDialChild(
          child: const Icon(Icons.info, color: Colors.white),
          backgroundColor: Colors.blue,
          onTap: () {},
          label: 'Logs',
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          labelBackgroundColor: Colors.black,
        ),

        //
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

        //
        SpeedDialChild(
          visible: noteModel!.isAddCommentEnabled! && widget.noteId.isNotEmpty,
          child: const Icon(Icons.comment, color: Colors.white),
          backgroundColor: Colors.blue,
          onTap: () => _handleCommentOnPressed(),
          label: 'Comment',
          labelStyle:
              const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          labelBackgroundColor: Colors.black,
        ),

        //
        SpeedDialChild(
          visible: widget.noteId.isNotEmpty,
          child: const Icon(Icons.share, color: Colors.white),
          backgroundColor: Colors.blue,
          onTap: () => _handleShareOnPressed(),
          label: 'Share',
          labelStyle:
              const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          labelBackgroundColor: Colors.black,
        ),

        //
        SpeedDialChild(
          visible: widget.noteId.isNotEmpty,
          child: const Icon(Icons.email, color: Colors.white),
          backgroundColor: Colors.blue,
          onTap: () => _handleEmailOnPressed(),
          label: 'Email',
          labelStyle:
              const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          labelBackgroundColor: Colors.black,
        ),
      ],
    );
  }

  _handleEmailOnPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return const EmailNtsScreen(
            // ntsId: widget.serviceId,
            // ntsType: NTSType.service,
            );
      }),
    );
  }

  _handleShareOnPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return ShareScreen(
          ntsId: widget.noteId,
          ntsType: NTSType.service,
        );
      }),
    );
  }

  _handleCommentOnPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return NTSCommentsScreen(
          userId: widget.userID,
          ntsId: widget.noteId,
        );
      }),
    );
  }

  _handleTagOnPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return TagNTSScreen(
          ntsId: widget.noteId,
          ntsType: NTSType.service,
        );
      }),
    );
  }

  _handleAttachmentOnPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return AttachmentNTSScreen(
          userId: widget.userID,
          ntsType: NTSType.task,
          ntsId: widget.noteId,
        );
      }),
    );
  }

  parseJsonToUDFModel(
    //CreateServiceFormBloc createServiceFormBloc,
    udfJsonString,
  ) {
    ParseJsonHelper _parseJsonHelper = ParseJsonHelper();
    columnComponentList = [];

    columnComponentList = _parseJsonHelper.parseGenericUDFs(
      udfJsonString,
      conditionalValues,
      widget.noteId,
    );
    if (columnComponentList.isNotEmpty) {
      columnComponentWidgets = addDynamic(
        columnComponentList,
        //createServiceFormBloc,
      );
    }
  }

  Widget setServiceView(
    BuildContext context,
    // CreateServiceFormBloc createServiceFormBloc,
  ) {
    _fromddController.text =
        noteModel!.ownerUserName != null ? noteModel!.ownerUserName! : "";
    return Stack(
      children: [
        ListView(
          shrinkWrap: true,
          children: formFieldsWidgets(
            context,
            //createServiceFormBloc,
            noteModel!,
          ),
        ),
        Column(
          children: <Widget>[
            Expanded(child: Container()),
            Container(
              height: 50,
              color: Colors.grey[100],
              child: displayFooterWidget(
                noteModel!,
                //createServiceFormBloc,
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

  List<Widget> formFieldsWidgets(
      context,
      //createServiceFormBloc,
      NoteModel noteModel) {
    List<Widget> widgets = [];

    widgets.add(Container(
      padding: const EdgeInsets.all(8.0),
      height: 12.h,
      color: Colors.blue[100],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          rowChild(noteModel.noteNo ?? "", 'Note No', 3),
          rowChild(noteModel.noteStatusName ?? "", 'Status', 2),
          rowChild(noteModel.versionNo.toString(), 'Version No', 2),
        ],
      ),
    ));
    if (!widget.isDependent!) {
      if (!noteModel.hideSubject!) {
        subject.text = subjectValue ?? noteModel.noteSubject!;

        description.text = descriptionValue ?? noteModel.noteDescription!;

        widgets.add(
          CustomTextFormFieldWidget(
            fieldName: 'Subject',
            readonly: false,
            maxLines: 1,
            labelName: 'Subject',
            textEditingController: subject,
            prefixIcon: const Icon(Icons.note),
            onChanged: (value) {
              subjectValue = value.toString();
            },
          ),
        );
      }
//TODO: Confirm if "Other Details" is required for note
      widgets.add(
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
              visible: !noteModel.hideStartDate!,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: DynamicDateTimeBox(
                      code: noteModel.startDate,
                      name: 'Start Date',
                      key: const Key('Start Date'),
                      selectDate: (DateTime date) {
                        setState(() async {
                          startDate = date;
                          if (dueDate != null &&
                              dueDate.toString().isNotEmpty) {
                            compareStartEndDate(
                              startDate: startDate!,
                              enddate: dueDate!,
                              context: context,
                              updateDuration: false,
                            );
                          }
                        });
                        // udfJson[model[i].key] = date.toString();
                      },
                    ),
                  ),
                  Expanded(
                    child: DynamicDateTimeBox(
                      code: noteModel.expiryDate,
                      name: 'Expiry Date',
                      key: const Key('Expiry Date'),
                      selectDate: (DateTime date) {
                        setState(() {
                          dueDate = date;
                          if (startDate != null &&
                              startDate.toString().isNotEmpty) {
                            compareStartEndDate(
                              startDate: startDate!,
                              enddate: dueDate!,
                              context: context,
                              updateDuration: false,
                            );
                          }
                        });
                        // udfJson[model[i].key] = date.toString();
                      },
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                // Expanded(
                //   child: Visibility(
                //     visible: !taskModel.hideSla,
                //     child: CustomTextFormFieldWidget(
                //       fieldName: 'SLA',
                //       readonly: false,
                //       maxLines: 1,
                //       labelName: 'SLA',
                //       textEditingController: createServiceFormBloc.sla,
                //       prefixIcon: const Icon(Icons.note),
                //       onChanged: (value) {
                //         slaValue = value.toString();
                //       },
                //     ),
                //   ),
                // ),
                Expanded(
                  child: DynamicDateTimeBox(
                    code: noteModel.reminderDate,
                    name: 'Reminder Date',
                    key: const Key('Reminder Date'),
                    selectDate: (DateTime date) {
                      setState(() {});
                      // udfJson[model[i].key] = date.toString();
                    },
                  ),
                )
              ],
            ),
            Visibility(
              visible: !noteModel.hideDescription!,
              child: CustomTextFormFieldWidget(
                fieldName: 'Description',
                readonly: false,
                maxLines: 3,
                labelName: 'Description',
                textEditingController: description,
                prefixIcon: const Icon(Icons.note),
                onChanged: (value) {
                  descriptionValue = value.toString();
                },
              ),
            ),
          ],
        ),
      );

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
          },
        ),
      );
    }

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

  rowChild(
    String data,
    String field,
    int? flex,
  ) {
    return Expanded(
      flex: flex ?? 1,
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

  displayFooterWidget(
    NoteModel noteModel,
    //CreateServiceFormBloc createServiceFormBloc,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Visibility(
              visible: noteModel.isCompleteButtonVisible!,
              child: PrimaryButton(
                backgroundColor: Colors.green,
                buttonText: 'Complete',
                handleOnPressed: () {
                  noteViewModelPostRequest(
                    2,
                    'NOTE_STATUS_COMPLETE',
                    //createServiceFormBloc,
                  );
                },
                width: 100,
              ),
            ),
            // Visibility(
            //   // visible: true,
            //   visible: noteModel.is,
            //   child: PrimaryButton(
            //     buttonText: 'Cancel',
            //     handleOnPressed: () {
            //       if (noteModel.isCancelReasonRequired)
            //         enterReasonAlertDialog(context);
            //     },
            //     width: 100,
            //   ),
            // ),
            Visibility(
              visible: noteModel.isCloseButtonVisible!,
              child: PrimaryButton(
                backgroundColor: Colors.grey,
                buttonText: 'Close',
                handleOnPressed: () => Navigator.pop(context),
                width: 80,
              ),
            ),
            Visibility(
              visible: noteModel.isDraftButtonVisible!,
              child: PrimaryButton(
                backgroundColor: Colors.greenAccent,
                buttonText: 'Draft',
                handleOnPressed: () {
                  noteViewModelPostRequest(
                    1,
                    'NOTE_STATUS_DRAFT',
                    //createServiceFormBloc,
                  );
                },
                width: 100,
              ),
            ),
            Visibility(
              visible: noteModel.isExpireButtonVisible!,
              child: PrimaryButton(
                backgroundColor: Colors.red,
                buttonText: 'Expire',
                handleOnPressed: () {
                  noteViewModelPostRequest(
                    2,
                    'NOTE_STATUS_EXPIRE',
                    //createServiceFormBloc,
                  );
                },
                width: 100,
              ),
            ),
            Visibility(
              visible: noteModel.isSubmitButtonVisible!,
              child: PrimaryButton(
                buttonText: 'Submit',
                handleOnPressed: () {
                  //   for (var i = 0; i < columnComponent.length; i++) {
                  //   if (columnComponent[i].validate?.required != null &&
                  //       columnComponent[i].validate!.required == true &&
                  //       udfJson.containsKey(columnComponent[i].key) &&
                  //       (udfJson[columnComponent[i].key] == null ||
                  //           udfJson[columnComponent[i].key]!.isEmpty)) {
                  //     displaySnackBar(
                  //         text: 'Please enter ${columnComponent[i].label}',
                  //         context: context);
                  //     return;
                  //   }
                  // }

                  // for (var i = 0; i < columnComponent.length; i++) {
                  //   if (columnComponent[i].validate?.required != null &&
                  //       columnComponent[i].validate!.required == true &&
                  //       udfJson.containsKey(columnComponent[i].key) &&
                  //       (udfJson[columnComponent[i].key] == null ||
                  //           udfJson[columnComponent[i].key]!.isEmpty)) {
                  //     displaySnackBar(
                  //         text: 'Please enter ${columnComponent[i].label}',
                  //         context: context);
                  //     return;
                  //   }
                  // }
                  // for (var i = 0; i < componentComList.length; i++) {
                  //   if (componentComList[i].validate?.required != null &&
                  //       componentComList[i].validate!.required == true &&
                  //       udfJson.containsKey(componentComList[i].key) &&
                  //       (udfJson[componentComList[i].key] == null ||
                  //           udfJson[componentComList[i].key]!.isEmpty)) {
                  //     displaySnackBar(
                  //         text: 'Please enter ${componentComList[i].label}',
                  //         context: context);
                  //     return;
                  //   }
                  // }
                  // for (var i = 0; i < udfJsonComponent.length; i++) {
                  //   if (udfJsonComponent[i].validate?.required != null &&
                  //       udfJsonComponent[i].validate!.required == true &&
                  //       udfJson.containsKey(udfJsonComponent[i].key) &&
                  //       (udfJson[udfJsonComponent[i].key] == null ||
                  //           udfJson[udfJsonComponent[i].key]!.isEmpty)) {
                  //     displaySnackBar(
                  //         text: 'Please enter ${udfJsonComponent[i].label}',
                  //         context: context);
                  //     return;
                  //   }
                  // }
                  noteViewModelPostRequest(
                    1,
                    'NOTE_STATUS_INPROGRESS',
                    //createServiceFormBloc,
                  );
                },
                width: 100,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void compareStartEndDate({
    required DateTime startDate,
    required DateTime enddate,
    BuildContext? context,
    bool? updateDuration,
  }) {
    if (enddate.isBefore(startDate)) {
      _showMyDialog();
    } else if (updateDuration!) {
      updateLeaveDuration();
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: ListBody(
            children: const <Widget>[
              Text('End Date Should be greater than Start Date.'),
            ],
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

  void updateLeaveDuration() {
    if (leaveStartDate != null && leaveEnddate != null) {
      var durationCalendarDays = leaveEnddate!.difference(leaveStartDate!);

      setState(() {
        leaveDurationControllerCalendarDays.text =
            (durationCalendarDays.inDays + 1).toString();
      });
    }
  }

  String? resultMsg = '';
  noteViewModelPostRequest(
    int postDataAction,
    String noteStatusCode,
    //CreateServiceFormBloc createServiceFormBloc,
  ) async {
    String? userId = widget.userID;
    String stringModel = jsonEncode(noteModel);
    var jsonModel = jsonDecode(stringModel);
    postNoteModel = NoteModel.fromJson(jsonModel);

    postNoteModel.ownerUserId = userId;
    postNoteModel.requestedByUserId = userId;
    postNoteModel.subject = subject.text;
    postNoteModel.noteDescription = description.text;
    postNoteModel.dataAction = widget.noteId.isEmpty ? 1 : 2;
    postNoteModel.portalId = APIEndpointConstants.HR_PORTAL_ID;
    postNoteModel.portalName = APIEndpointConstants.HR_PORTAL_NAME;
    // postDataAction;
    postNoteModel.noteStatusCode = noteStatusCode;
    postNoteModel.json = jsonEncode(udfJson);
    // print(udfJson);

    setState(() {
      isVisible = true;
    });

    PostResponse result = await noteBloc.postNoteData(
      noteModel: postNoteModel,
      queryparams: _handleNoteDetailsQueryparams(
        noteId: widget.noteId,
        templatecode: widget.templateCode ?? '',
        userid: widget.userID,
      ),
    );
    // print(result);
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

  List<Widget> addDynamic(
    model,
    //CreateServiceFormBloc createServiceFormBloc,
  ) {
    List<Widget> listDynamic = [];
    for (var i = 0; i < model.length; i++) {
      if (model[i].type == 'textfield' && model[i].hidden != true) {
        if (!udfJson.containsKey(model[i].key) && (widget.noteId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        if (!udfJson.containsKey(model[i].key) && (widget.noteId.isEmpty)) {
          udfJson[model[i].key] = '';
        }

        String initialValue;
        initialValue = model[i].defaultValue ?? udfJson[model[i].key];

        udfJson[model[i].key] = initialValue;

        final textField$i = TextEditingController(text: initialValue);
        listDynamic.add(
          CustomTextFormFieldWidget(
            isRequired: model[i].validate?.required,
            labelName: model[i].label,
            fieldName: model[i].label,
            readonly: (model[i].defaultValue != null &&
                        model[i].defaultValue.isNotEmpty) ||
                    model[i].disabled.toString() == 'true' ||
                    widget.noteId.isNotEmpty
                ? true
                : false,
            textEditingController: textField$i,
            prefixIcon: const Icon(
              Icons.note_outlined,
              color: AppThemeColor.iconColor,
            ),
            maxLines: 1,
            onChanged: (String value) {
              udfJson[model[i].key] = value;
            },
          ),
        );
        //createServiceFormBloc.addFieldBlocs(fieldBlocs: [textField$i]);

        // if (model[i].disabled != null && !model[i].disabled) {
        //   listDynamic.add(
        //     CustomTextFormFieldWidget(
        //       labelName: model[i].label,
        //       fieldName: model[i].label,
        //       readonly: model[i].disabled,
        //       textEditingController: textField$i,
        //       prefixIcon: const Icon(Icons.note),
        //       maxLines: 1,
        //       onChanged: (value) {
        //         udfJson[model[i].key] = value.toString();
        //       },
        //     ),
        //   );
        //   createServiceFormBloc.addFieldBlocs(fieldBlocs: [textField$i]);
        // } else {
        //   listDynamic.add(
        //     StaticField(
        //       // initialValue: difference.toString(),
        //       width: MediaQuery.of(context).size.width,
        //       hint: model[i].label,
        //       icon: const Icon(Icons.circle_outlined),
        //       style: TextStyle(color: Colors.grey[600]),
        //       // controller: _slaController,
        //       // isShowArrow: true,
        //     ),
        //   );
        //   // listDynamic.add(DynamicTextBoxWidget(
        //   //     model[i].label,
        //   //     model[i].label,
        //   //     TextEditingController(),
        //   //     true,
        //   //     (String val) {}));
        // }
      } else if (model[i].type == 'textarea' && model[i].hidden != true) {
        if (!udfJson.containsKey(model[i].key) && (widget.noteId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        if (!udfJson.containsKey(model[i].key) && (widget.noteId.isEmpty)) {
          udfJson[model[i].key] = '';
        }

        // final textArea$i = TextFieldBloc();
        // final textArea$i = TextEditingController(initialValue: udfJson[model[i].key]!);
        // listDynamic.add(
        //   CustomTextFormFieldWidget(
        //     labelName: model[i].label,
        //     fieldName: model[i].label,
        //     readonly: model[i].disabled,
        //     textEditingController: textArea$i,
        //     prefixIcon: const Icon(Icons.note),
        //     maxLines: 3,
        //     onChanged: (value) {
        //       udfJson[model[i].key] = value.toString();
        //     },
        //   ),
        // );
        // createServiceFormBloc.addFieldBlocs(fieldBlocs: [textArea$i]);
        //=====================
      } else if (model[i].type == 'number' && model[i].hidden != true) {
        String? initialValue;
        // final number$i = TextEditingController(initialValue: initialValue);
        if (!udfJson.containsKey(model[i].key) && (widget.noteId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) && (widget.noteId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
          leaveDurationControllerCalendarDays.text = model[i].udfValue ?? '';
          initialValue = leaveDurationControllerCalendarDays.text;
        }
        if (model[i].key == 'LeaveDurationCalendarDays') {
          initialValue = leaveDurationControllerCalendarDays.text;
          udfJson[model[i].key] = initialValue;
        } else {
          initialValue = udfJson[model[i].key];
        }
        final number$i = TextEditingController();
        listDynamic.add(
          CustomTextFormFieldWidget(
            labelName: model[i].label,
            fieldName: model[i].label,
            readonly: false,
            textEditingController: number$i,
            prefixIcon: const Icon(Icons.format_list_numbered),
            onChanged: (value) {
              udfJson[model[i].key] = value.toString();
            },
          ),
        );
        //createServiceFormBloc.addFieldBlocs(fieldBlocs: [number$i]);
      } else if (model[i].type == 'password' && model[i].hidden != true) {
        if (!udfJson.containsKey(model[i].key) && (widget.noteId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) && (widget.noteId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        final password$i = TextEditingController(text: udfJson[model[i].key]!);
        listDynamic.add(
          CustomTextFormFieldWidget(
            labelName: model[i].label,
            fieldName: model[i].label,
            readonly: model[i].disabled,
            textEditingController: password$i,
            prefixIcon: const Icon(Icons.visibility_off_rounded),
            obscureText: true,
            onChanged: (value) {
              udfJson[model[i].key] = value.toString();
            },
          ),
        );
        // createServiceFormBloc.addFieldBlocs(fieldBlocs: [password$i]);
      } else if (model[i].type == 'checkbox' && model[i].hidden != true) {
        if (!udfJson.containsKey(model[i].key) && (widget.noteId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) && (widget.noteId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }

        listDynamic.add(DynamicCheckBoxValue(
          readonly: model[i].disabled.toString() == 'true',
          code: udfJson[model[i].key],
          name: model[i].label,
          key: Key(model[i].type),
          checkUpdate: (bool? check) {
            udfJson[model[i].key] = check.toString();
            // model[i].value = check.toString();
          },
        ));
      } else if (model[i].type == 'selectboxes' && model[i].hidden != true) {
        TextEditingController _ddController = TextEditingController();
        if (!udfJson.containsKey(model[i].key) && (widget.noteId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) && (widget.noteId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
          _ddController.text = udfJson[model[i].key]!;
        }

        //   listDynamic.add(NTSDropDownSelect(
        //     title: model[i].label,
        //     controller: _ddController,
        //     hint: model[i].label,
        //     validationMessage: "Select " + model[i].label,
        //     isShowArrow: true,
        //     nameKey: model[i].template,
        //     idKey: model[i].idPath,
        //     url: model[i].data,
        //     onListTap: (dynamic value) {
        //       NTSDropdownModel _selectedIdNameViewModel = value;
        //       _ddController.text = _selectedIdNameViewModel.name!;
        //       udfJson[model[i].label] = _selectedIdNameViewModel.id;
        //       // udfJson[model[i].label] = value.toString();
        //     },
        //   ));
        // } else if (model[i].type == 'radio' && model[i].hidden != true) {
        //   if (!udfJson.containsKey(model[i].key) && widget.noteId.isEmpty) {
        //     udfJson[model[i].key] = '';
        //   }
        //   if (!udfJson.containsKey(model[i].key) && widget.noteId.isNotEmpty) {
        //     udfJson[model[i].key] = model[i].udfValue ?? '';
        //   }

        //   final radio$i = SelectFieldBloc(initialValue: udfJson[model[i].key]);
        //   listDynamic.add(
        //     BlocRadioButtonWidget(
        //       labelName: model[i].label,
        //       selectFieldBloc: radio$i,
        //     ),
        //   );
        //createServiceFormBloc.addFieldBlocs(fieldBlocs: [radio$i]);
      } else if (model[i].type == 'select' && model[i].hidden != true) {
        TextEditingController _ddController = TextEditingController();
        if (!udfJson.containsKey(model[i].key) && (widget.noteId.isEmpty)) {
          udfJson[model[i].key] = '';
          if (selectValue.length < model.length) {
            for (var j = selectValue.length; j < model.length; j++) {
              selectValue.add(null);
            }
          }
        }

        if (selectValue.isNotEmpty &&
            (selectValue[i] != null && selectValue[i]!.isNotEmpty)) {
          _ddController.text = selectValue[i]!;
        }
        if (!udfJson.containsKey(model[i].key) && widget.noteId.isNotEmpty) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
          editNoteDDValue(
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
            isReadonly: model[i].disabled.toString() == 'true',
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
              selectValue[i] = _selectedIdNameViewModel.name;
              udfJson[model[i].key] = _selectedIdNameViewModel.id;
            },
          ),
        );
      } else if (model[i].type == 'file' && model[i].hidden != true) {
        TextEditingController attachmentController = TextEditingController();
        if (!udfJson.containsKey(model[i].key) && widget.noteId.isEmpty) {
          udfJson[model[i].key] = '';
          if (selectValue.length < model.length) {
            for (var j = selectValue.length; j < model.length; j++) {
              selectValue.add(null);
            }
          }
        }
        if (!udfJson.containsKey(model[i].key) && widget.noteId.isNotEmpty) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
          // print(model[i].udfValue);
        }

        attachmentController.text =
            // (widget.noteId == null ||widget.noteId.isEmpty)
            (udfJson[model[i].key] == null || udfJson[model[i].key]!.isEmpty)
                ? " Select File to Attach "
                : selectValue.isNotEmpty
                    ? (selectValue[i] == null || selectValue[i]!.isEmpty)
                        ? " (1) File Attached: " + udfJson[model[i].key]!
                        : " (1) File Attached: " + selectValue[i]!
                    : "Select File to Attach";
        // : " (1) File Attached " + udfJson[model[i].key];

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
                    userId: widget.userID,
                    onListTap: (dynamic value, dynamic value2, dynamic value3) {
                      setState(() {
                        selectValue[i] = value2;
                        model[i].label = value2;
                        udfJson[model[i].key] = value;
                        attachmentController.text =
                            " (1) File Attached: " + selectValue[i]!;
                      });
                    },
                  );
                }),
              );
            },
            readOnly: widget.noteId.isNotEmpty ? true : false,
          ),
        );
      } else if (model[i].type == 'datetime' && model[i].hidden != true) {
        if (!udfJson.containsKey(model[i].key) && widget.noteId.isEmpty) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) && widget.noteId.isNotEmpty) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
          // print(model[i].udfValue);
        }
        listDynamic.add(
          DynamicDateTimeBox(
            code: udfJson[model[i].key]!.isNotEmpty
                ? model[i]
                        .udfValue
                        .toString()
                        .split(' ')[0]
                        .contains(RegExp(r'[a-z]'))
                    ? null
                    : udfJson[model[i].key]!.contains('/')
                        ? DateFormat("MM/dd/yyyy")
                            .parse(udfJson[model[i].key]!)
                            .toString()
                        : DateFormat("yyyy-MM-dd")
                            .parse(udfJson[model[i].key]!)
                            .toString()
                : null,
            name: model[i].label,
            key: Key(model[i].label),
            selectDate: (DateTime date) {
              model[i].inputFormat = date.toString();
              // print(model[i].inputFormat);
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
            },
          ),
        );
      } else if (model[i].type == 'time' && model[i].hidden != true) {
        if (!udfJson.containsKey(model[i].key) && widget.noteId.isEmpty) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) && widget.noteId.isNotEmpty) {
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
        if (!udfJson.containsKey(model[i].key) && widget.noteId.isEmpty) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) && widget.noteId.isNotEmpty) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        final hidden$i = TextEditingController(text: udfJson[model[i].key]!);
        listDynamic.add(
          CustomTextFormFieldWidget(
            obscureText: true,
            labelName: model[i].label,
            fieldName: model[i].label,
            readonly: true,
            textEditingController: hidden$i,
            prefixIcon: const Icon(Icons.visibility),
            maxLines: 1,
            onChanged: (value) {
              udfJson[model[i].key] = value.toString();
            },
          ),
        );
        // createServiceFormBloc.addFieldBlocs(fieldBlocs: [hidden$i]);
      } else if (model[i].type == 'phoneNumber' && model[i].hidden != true) {
        //Phone Number Field
        if (!udfJson.containsKey(model[i].key) && widget.noteId.isEmpty) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) && widget.noteId.isNotEmpty) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        final phoneNumber$i =
            TextEditingController(text: udfJson[model[i].key]!);
        listDynamic.add(
          CustomTextFormFieldWidget(
            labelName: model[i].label,
            fieldName: model[i].label,
            readonly: false,
            textEditingController: phoneNumber$i,
            prefixIcon: const Icon(Icons.phone_rounded),
            onChanged: (value) {
              udfJson[model[i].key] = value.toString();
            },
          ),
        );
        //createServiceFormBloc.addFieldBlocs(fieldBlocs: [phoneNumber$i]);
      } else if (model[i].type == 'email' && model[i].hidden != true) {
        //Email Field
        if (!udfJson.containsKey(model[i].key) && widget.noteId.isEmpty) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) && widget.noteId.isNotEmpty) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        final email$i = TextEditingController(
            // validators: [FieldBlocValidators.email],
            text: udfJson[model[i].key]!);
        listDynamic.add(
          CustomTextFormFieldWidget(
            labelName: model[i].label,
            fieldName: model[i].label,
            readonly: model[i].disabled,
            textEditingController: email$i,
            prefixIcon: const Icon(Icons.email),
            maxLines: 1,
            onChanged: (value) {
              udfJson[model[i].key] = value.toString();
            },
          ),
        );
        //createServiceFormBloc.addFieldBlocs(fieldBlocs: [email$i]);
      } else if (model[i].type == 'htmlelement' && model[i].hidden != true) {
        String? content = '';
        if (model[i]?.content != null && model[i]?.content.isNotEmpty) {
          if (model[i].content.contains('<h4>')) {
            content = model[i].content.split('<h4>')[1].split('</h4>')[0];
          }
          if (model[i].content.contains('<p>')) {
            content = model[i].content.split('<p>')[1].split('</p>')[0];
          }
        }

        // Guard clause.
        if (content == null || content.isEmpty) {
          continue;
        }

        listDynamic.add(
          DynamicTextDisplay(text: content),
        );
      } else {}
    }
    return listDynamic;
  }

  addDynamicComponentComponent(model, createServiceFormBloc) {
    List<TableRow> table = [];
    // var groupControls = model?.controls
    //     ?.where((x) => x.groupTemplateFieldId == element.templateFieldId);
    // groupControls?.forEach((group) {
    var tableWidgets = addDynamic(model);
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
      border: const TableBorder(
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

  editNoteDDValue({
    String? idKey,
    String? nameKey,
    required String url,
    String? code,
    required TextEditingController ddController,
  }) async {
    NTSDropdownRepository ntsDdRepository = NTSDropdownRepository();
    String completeUrl = url + "&filterKey=$idKey&filterValue=$code";
    NTSDropdownResponse ntsDdResponse = await ntsDdRepository.getFilteredDDData(
      idKey: idKey,
      nameKey: nameKey,
      url: completeUrl,
    );

    ddController.text = ntsDdResponse.data?.elementAt(0).name ?? '';
    // return ntsDdResponse?.data?.elementAt(0)?.name;
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
    // AttachmentNTSRepository _apiRepository = AttachmentNTSRepository();
    // _apiRepository.downloadAttachmentData(
    //     fileValue: data?.udfValue ?? '', context: context);
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
          // APIEndpointConstants.DOWNLOAD_ATTACHMENT +
          //     "?fileId=${data?.udfValue ?? ''}",
        );
      },
    );
  }
}
