import 'package:flutter/material.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/data/models/api_models/post_response_model.dart';
import 'package:hr_management/data/models/share_post_model/note_share_post_model/note_share_post_model.dart';
import 'package:hr_management/data/models/share_post_model/service_share_post_model/service_share_post_model.dart';
import 'package:hr_management/data/models/share_post_model/task_share_post_model/task_share_post_model.dart';
import 'package:hr_management/data/models/user/team_model.dart';
import 'package:hr_management/data/models/user/user.dart';
import 'package:hr_management/logic/blocs/share_bloc/share_bloc.dart';
import 'package:hr_management/ui/widgets/nts_dropdown_select.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import 'package:hr_management/ui/widgets/snack_bar.dart';

class ShareScreenBody extends StatefulWidget {
  final NTSType ntsType;
  final String ntsId;

  const ShareScreenBody({Key key, this.ntsType, this.ntsId}) : super(key: key);
  @override
  _ShareScreenBodyState createState() => _ShareScreenBodyState();
}

class _ShareScreenBodyState extends State<ShareScreenBody> {
  int selectedRadio;
  bool selectUser = false;
  bool selectTeam = false;
  User user = User();
  ReadTeamDataModel team = ReadTeamDataModel();
  bool isVisible = false;
  TextEditingController _userddController = new TextEditingController();
  TextEditingController _teamddController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Card(
              elevation: 4,
              color: Colors.blue[200],
              child: Column(
                children: [
                  _listTile(value: 1, title: 'Share with User'),
                  _listTile(value: 2, title: 'Share with Team'),
                ],
              ),
            ),
            Visibility(
              visible: selectUser,
              child: _userDropDown(),
            ),
            Visibility(
              visible: selectTeam,
              child: _teamDropDown(),
            ),
            Visibility(
              visible: (_userddController.text != null &&
                      _userddController.text.isNotEmpty) ||
                  (_teamddController.text != null &&
                      _teamddController.text.isNotEmpty),
              child: Center(
                child: ElevatedButton(
                  onPressed: () => shareNTSPostRequest(),
                  child: Text('Share'),
                ),
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

  String resultMsg = '';
  shareNTSPostRequest() async {
    PostResponse response = PostResponse();
    setState(() {
      isVisible = true;
    });

    if (widget.ntsType == NTSType.service) {
      ServiceSharePostModel data = ServiceSharePostModel();
      data.ntsServiceId = widget.ntsId;
      data.serviceSharedWithTypeId = selectedRadio;
      if (selectedRadio == 1) {
        data.sharedWithUserId = user.id;
        data.sharedWithTeamId = '';
      } else {
        data.sharedWithUserId = '';
        data.sharedWithTeamId = team.id;
      }
      response = await shareBloc.postNTSSharedData(
        serviceData: data,
        ntsType: widget.ntsType,
      );
    } else if (widget.ntsType == NTSType.task) {
      TaskSharePostModel data = TaskSharePostModel();
      data.ntsTaskId = widget.ntsId;
      data.serviceSharedWithTypeId = selectedRadio;
      if (selectedRadio == 1) {
        data.sharedWithUserId = user.id;
        data.sharedWithTeamId = '';
      } else {
        data.sharedWithUserId = '';
        data.sharedWithTeamId = team.id;
      }
      response = await shareBloc.postNTSSharedData(
        taskData: data,
        ntsType: widget.ntsType,
      );
    } else if (widget.ntsType == NTSType.note) {
      NoteSharePostModel data = NoteSharePostModel();
      data.ntsNoteId = widget.ntsId;
      data.serviceSharedWithTypeId = selectedRadio;
      if (selectedRadio == 1) {
        data.sharedWithUserId = user.id;
        data.sharedWithTeamId = '';
      } else {
        data.sharedWithUserId = '';
        data.sharedWithTeamId = team.id;
      }
      response = await shareBloc.postNTSSharedData(
        noteData: data,
        ntsType: widget.ntsType,
      );
    }
    if (response.isSuccess) {
      setState(() {
        isVisible = false;
      });
      resultMsg = response.messages;
      Navigator.pop(context);
    } else {
      setState(() {
        isVisible = false;
      });
      resultMsg = response.messages;
    }
    displaySnackBar(text: resultMsg, context: context);
  }

  _userDropDown() {
    return Column(
      children: [
        NTSDropDownSelect(
          isUserList: true,
          isTeamList: false,
          title: 'User',
          controller: _userddController,
          hint: 'User',
          isShowArrow: true,
          onListTap: (dynamic value) {
            user = value;
            _userddController.text = user.name;
            setState(() {});
          },
        ),
      ],
    );
  }

  _teamDropDown() {
    return Column(
      children: [
        NTSDropDownSelect(
          isUserList: false,
          isTeamList: true,
          title: 'Team',
          controller: _teamddController,
          hint: 'Team',
          isShowArrow: true,
          onListTap: (dynamic value) {
            team = value;
            _teamddController.text = team.name;
            setState(() {});
          },
        ),
      ],
    );
  }

  _listTile({int value, String title}) {
    return ListTile(
      leading: Radio(
        value: value,
        groupValue: selectedRadio,
        activeColor: Colors.blue[600],
        onChanged: (val) {
          setState(() {
            selectedRadio = val;
            if (val == 1) {
              selectUser = true;
              selectTeam = false;
            } else if (val == 2) {
              selectUser = false;
              selectTeam = true;
            }
            _userddController.text = '';
            _teamddController.text = '';
          });
        },
      ),
      title: Text(title),
    );
  }
}
