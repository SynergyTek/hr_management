import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/data/models/note/note_model.dart';

import 'package:hr_management/ui/widgets/nts_dropdown_select.dart';

import '../../../../../constants/api_endpoints.dart';
import '../../../../../data/models/api_models/post_response_model.dart';
import '../../../../../data/models/nts_dropdown/nts_dropdown_model.dart';
import '../../../../../data/models/work_book_models/get_note_book_report_model.dart';
import '../../../../../data/models/work_book_models/work_book_response_model.dart';
import '../../../../../logic/blocs/note_bloc/note_bloc.dart';
import '../../../../../logic/blocs/nts_dropdown_bloc/nts_dropdown_api_bloc.dart';
import '../../../../../logic/blocs/user_model_bloc/user_model_bloc.dart';
import '../../../../../logic/blocs/work_book_bloc/work_book_bloc.dart';
import '../../../../widgets/primary_button.dart';
import '../../../../widgets/progress_indicator.dart';

class DMSMoveWorkbookBodyWidget extends StatefulWidget {
  final String noteId;

  DMSMoveWorkbookBodyWidget({
    required this.noteId,
  });

  @override
  State<DMSMoveWorkbookBodyWidget> createState() =>
      _DMSMoveWorkbookBodyWidgetState();
}

class _DMSMoveWorkbookBodyWidgetState extends State<DMSMoveWorkbookBodyWidget> {
  TextEditingController _referenceController = TextEditingController();
  TextEditingController _typeController = TextEditingController();
  TextEditingController _beforeAfterController = TextEditingController();
  NoteModel noteModel = NoteModel();
  String userId = '';
  bool isVisible = false;

  @override
  void initState() {
    getNoteDetailsAPICall();

    workBookBloc.getNoteBookReport(queryparams: {
      "noteId": widget.noteId,
    });
    super.initState();
  }

  getNoteDetailsAPICall() async {
    userId = BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '';
    noteModel = await noteBloc.getNoteDetails(
      queryparams: _handleNoteDetailsQueryparams(
        userid: userId,
        noteId: widget.noteId,
        templatecode: '',
      ),
    );
    print(noteModel.noteId);
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
      child: StreamBuilder(
        stream: workBookBloc.subjectNoteBookReport.stream,
        builder: (BuildContext context,
            AsyncSnapshot<GetNoteBookReportResponseModel?> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data?.mapdata?.ntsItems == null) {
              return Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('No Data'),
              ));
            }
            List<NtsItem>? list = snapshot.data?.mapdata?.ntsItems;
            return _dropDownFields(workbookReferenceList: list);
          } else {
            return Center(child: CustomProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _dropDownFields({List<NtsItem>? workbookReferenceList}) {
    List<NtsItem> _workbookReferenceList = [];

    workbookReferenceList!.forEach((element) {
      if (element.level != 0 && element.id != widget.noteId)
        _workbookReferenceList.add(element);
    });

    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                children: [
                  NTSDropDownSelect(
                    isUserList: false,
                    isTeamList: false,
                    title: 'Reference',
                    controller: _referenceController,
                    hint: 'Reference',
                    isShowArrow: true,
                    workbookReferenceList: _workbookReferenceList,
                    onListTap: (dynamic value) {
                      NtsItem _model = value;
                      _referenceController.text = _model.subject ?? '';
                    },
                  ),
                  NTSDropDownSelect(
                    url: APIEndpointConstants
                        .GET_ENUM_ID_NAME_LIST_MOVE_TYPE_ENDPOINT,
                    idKey: 'Id',
                    nameKey: 'Name',
                    isInitial: false,
                    isUserList: false,
                    isTeamList: false,
                    title: 'Type',
                    controller: _typeController,
                    hint: 'Type',
                    isShowArrow: true,
                    workbookReferenceList: [],
                    onListTap: (dynamic value) {
                      ntsDdBloc.subject.sink.add(null);
                      NTSDropdownModel _model = value;
                      _typeController.text = _model.name!;
                      setState(() {});
                    },
                  ),
                  Visibility(
                    visible: (_typeController.text.isNotEmpty &&
                        _typeController.text == 'SameAsLevel'),
                    child: NTSDropDownSelect(
                      url: APIEndpointConstants
                          .GET_ENUM_ID_NAME_LIST_MOVE_POSITION_ENDPOINT,
                      idKey: 'Id',
                      nameKey: 'Name',
                      isInitial: false,
                      isUserList: false,
                      isTeamList: false,
                      title: 'Before/After',
                      controller: _beforeAfterController,
                      hint: 'Before/After',
                      isShowArrow: true,
                      workbookReferenceList: [],
                      onListTap: (dynamic value) {
                        ntsDdBloc.subject.sink.add(null);
                        NTSDropdownModel _model = value;
                        _beforeAfterController.text = _model.name!;
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: PrimaryButton(
                      backgroundColor: Colors.white10,
                      foregroundColor: Colors.black87,
                      buttonText: "Cancel",
                      handleOnPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Expanded(
                    child: PrimaryButton(
                      buttonText: "Save",
                      handleOnPressed: () {},
                      // handleOnPressed: () => _handleOnPressedSaveButton(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Visibility(
          visible: isVisible,
          child: Center(
            child: CustomProgressIndicator(),
          ),
        )
      ],
    );
  }

  _handleOnPressedSaveButton() async {
    NoteModel postNoteModel = NoteModel();
    String stringModel = jsonEncode(noteModel);
    var jsonModel = jsonDecode(stringModel);
    postNoteModel = NoteModel.fromJson(jsonModel);

    // postNoteModel.ownerUserId = userId;
    postNoteModel.parentNoteId = 'hjfghf'; //move
    // postNoteModel.requestedByUserId = userId;
    postNoteModel.dataAction = widget.noteId.isEmpty ? 1 : 2;

    setState(() {
      isVisible = true;
    });

    PostResponse result = await workBookBloc.postManageMoveToParent(
      noteModel: postNoteModel,
      // noteModel: postNoteModel,
      // queryparams: _handleNoteDetailsQueryparams(
      //   noteId: widget.noteId,
      //   templatecode: widget.templateCode ?? '',
      //   userid: widget.userID,
      // ),
    );
    // print(result);
    if (result.isSuccess!) {
      setState(() {
        isVisible = false;
      });
      // resultMsg = result.messages;
      Navigator.pop(context);
    } else {
      setState(() {
        isVisible = false;
      });
      // resultMsg = result.messages;
    }
    // displaySnackBar(text: resultMsg!, context: context);
  }
}
