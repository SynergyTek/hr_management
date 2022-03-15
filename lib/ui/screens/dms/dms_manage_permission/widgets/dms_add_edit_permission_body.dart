import 'package:flutter/material.dart';
import 'package:hr_management/data/lists/lists.dart';

import 'package:hr_management/data/models/dms/dms_legal_entity_model/dms_legal_entity_model.dart';
import 'package:hr_management/data/models/dms/permission/permission_model.dart';
import 'package:hr_management/data/models/dms/permission/permission_response_model.dart';
import 'package:hr_management/data/models/user/team_model.dart';
import 'package:hr_management/data/models/user/user.dart';
import 'package:hr_management/logic/blocs/common_bloc/common_bloc.dart';
import 'package:hr_management/logic/blocs/dms_bloc/permission_bloc/permission_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/screens/dms/dms_legal_entity_screen/widgets/dms_legal_entity_body_widget.dart';
import 'package:hr_management/ui/widgets/internet_connectivity_widget.dart';
import 'package:hr_management/ui/widgets/nts_dropdown_select.dart';
import 'package:hr_management/ui/widgets/primary_button.dart';
import 'package:hr_management/ui/widgets/snack_bar.dart';

enum PermissionType { User, WorkspaceUserGroup }

class DmsAddEditPermissionBody extends StatefulWidget {
  final bool isCreatePermission;
  final String? noteId;
  DmsAddEditPermissionBody({
    required this.isCreatePermission,
    required this.noteId,
  });

  @override
  _DmsAddEditPermissionBodyState createState() =>
      _DmsAddEditPermissionBodyState();
}

class _DmsAddEditPermissionBodyState extends State<DmsAddEditPermissionBody> {
  PermissionType? _permissionType = PermissionType.User;

  DMSLegalEntityModel? _selectedLegalEntityData;

  PermissionSubmitModel _permissionSubmitModel = PermissionSubmitModel();

  User user = User();
  ReadTeamDataModel team = ReadTeamDataModel();

  TextEditingController _userddController = new TextEditingController();
  TextEditingController _workspaceddController = new TextEditingController();

  String? enumType;

  String? permissionValue = dmsPermissionType[0];
  String? accessValue = dmsAccessType[0];
  String? appliesToValue = dmsAppliesToType[0];

  bool isUser = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: DEFAULT_PADDING,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                RadioListTile<PermissionType>(
                  title: const Text('Select User'),
                  value: PermissionType.User,
                  groupValue: _permissionType,
                  onChanged: (value) {
                    setState(() {
                      _permissionType = value;
                      isUser = true;
                    });
                  },
                ),
                RadioListTile<PermissionType>(
                  title: const Text('Select Workspace User Group'),
                  value: PermissionType.WorkspaceUserGroup,
                  groupValue: _permissionType,
                  onChanged: (PermissionType? value) {
                    setState(() {
                      _permissionType = value;
                      isUser = false;
                    });
                  },
                ),
                _legalEntityWidget(),
                _userDropDown(),
                _workspaceUserGroupDropDown(),
                SizedBox(
                  height: 20,
                ),
                optionsRow(
                  text: 'Permission Type',
                  hintText: 'Select Permission Type',
                  dropdownValue: permissionValue,
                  list: dmsPermissionType,
                ),
                optionsRow(
                  text: 'Access',
                  hintText: 'Select Access',
                  dropdownValue: accessValue,
                  list: dmsAccessType,
                ),
                optionsRow(
                  text: 'Applies To',
                  hintText: 'Select Applies To',
                  dropdownValue: appliesToValue,
                  list: dmsAppliesToType,
                ),
              ],
            ),
          ),
          Column(
            children: [
              Expanded(child: Container()),
              _buttonsRow(),
            ],
          ),
        ],
      ),
    );
  }

  _buttonsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PrimaryButton(
          backgroundColor: Colors.grey,
          buttonText: 'Cancel',
          handleOnPressed: () => Navigator.pop(context),
          width: 100,
        ),
        PrimaryButton(
          backgroundColor: Colors.green,
          buttonText: 'Submit',
          handleOnPressed: () async {
            _checkMandatoryFields();
            _permissionSubmitModel.legalEntityId =
                isUser ? _selectedLegalEntityData!.id : null;
            isUser
                ? _permissionSubmitModel.permittedUserId = user.id
                : _permissionSubmitModel.permittedUserGroupId = team.id;
            _permissionSubmitModel.permissionType =
                dmsPermissionType.indexOf(permissionValue);
            _permissionSubmitModel.access = dmsAccessType.indexOf(accessValue);
            _permissionSubmitModel.appliesTo =
                dmsAppliesToType.indexOf(appliesToValue);
            _permissionSubmitModel.noteId = widget.noteId;
            _permissionSubmitModel.dataAction =
                widget.isCreatePermission ? 'Create' : 'Edit';

            //
            SubmitPermissionResponse response =
                await permissionBloc.savePermission(
              permissionModel: _permissionSubmitModel,
            );

            // TODO: if success then navigator pop and a snackbar message.
          },
          width: 100,
        ),
      ],
    );
  }

  _checkMandatoryFields() {
    if (isUser &&
        (_selectedLegalEntityData!.id == null ||
            _selectedLegalEntityData!.id!.isEmpty)) {
      displaySnackBar(
        context: context,
        text: 'Please select Legal Entity',
      );
      return;
    }
    if (isUser && (user.id == null || user.id!.isEmpty)) {
      displaySnackBar(
        context: context,
        text: 'Please select User',
      );
      return;
    }
    if (!isUser && (team.id == null || team.id!.isEmpty)) {
      displaySnackBar(
        context: context,
        text: 'Please select User Group',
      );
      return;
    }
  }

  Widget _legalEntityWidget() {
    return Visibility(
      visible: _permissionType == PermissionType.User,
      child: ListTile(
        minVerticalPadding: 8.0,
        title: Text("Legal Entity"),
        trailing: Text(
          _selectedLegalEntityData?.name ?? "Select",
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
        ),
        onTap: () => _handleLegalEntityOnTap(),
      ),
    );
  }

  void _handleLegalEntityOnTap() async {
    _selectedLegalEntityData = await showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: false,
      isDismissible: false,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return SafeArea(
          child: InternetConnectivityWidget(
            child: DMSLegalEntityBodyWidget(
              modelId: _selectedLegalEntityData?.name ?? null,
            ),
          ),
        );
      },
    );

    setState(() {});
  }

  _userDropDown() {
    return Visibility(
      visible: _permissionType == PermissionType.User,
      child: Column(
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
              _userddController.text = user.name!;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  _workspaceUserGroupDropDown() {
    return Visibility(
      visible: _permissionType == PermissionType.WorkspaceUserGroup,
      child: Column(
        children: [
          NTSDropDownSelect(
            isUserList: false,
            isTeamList: true,
            title: 'Workspace User Group',
            controller: _workspaceddController,
            hint: 'Workspace User Group',
            isShowArrow: true,
            onListTap: (dynamic value) {
              team = value;
              _workspaceddController.text = team.name!;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  optionsRow({
    required String text,
    String? hintText,
    String? dropdownValue,
    required List<String?> list,
  }) {
    return InkWell(
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  text,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            DropdownButton<String>(
              isExpanded: true,
              // hint: Text(hintText),
              value: dropdownValue,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w600),
              underline: Container(
                height: 2,
                color: Colors.blue[700],
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue;
                  if (dmsPermissionType.contains(newValue))
                    permissionValue = newValue;
                  else if (dmsAccessType.contains(newValue))
                    accessValue = newValue;
                  else
                    appliesToValue = newValue;
                });
              },
              items: list.map<DropdownMenuItem<String>>((String? value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value!),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  apiCallEnumId() {
    commonBloc.subjectCommonList.sink.add(null);
    commonBloc.subjectOwnerNameList.sink.add(null);
    commonBloc.subjectEnumTreeList.sink.add(null);

    Map<String, dynamic> queryparams = Map();

    if (enumType != null) queryparams['enumType'] = enumType;

    commonBloc.getEnumIdNameList(queryparams: queryparams);
  }
}
