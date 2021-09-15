import 'package:flutter/material.dart';
import 'package:hr_management/data/enums/enums.dart';

import 'package:hr_management/data/models/dms/dms_legal_entity_model/dms_legal_entity_model.dart';
import 'package:hr_management/data/models/dms/permission/permission_model.dart';
import 'package:hr_management/data/models/user/user.dart';
import 'package:hr_management/logic/blocs/common_bloc/common_bloc.dart';
import 'package:hr_management/logic/blocs/dms_bloc/permission_bloc/permission_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/screens/dms/dms_legal_entity_screen/widgets/dms_legal_entity_body_widget.dart';
import 'package:hr_management/ui/widgets/internet_connectivity_widget.dart';
import 'package:hr_management/ui/widgets/nts_dropdown_select.dart';
import 'package:hr_management/ui/widgets/primary_button.dart';

enum PermissionType { User, WorkspaceUserGroup }

class DmsAddEditPermissionBody extends StatefulWidget {
  final bool isCreatePermission;
  DmsAddEditPermissionBody({
    @required this.isCreatePermission,
  });

  @override
  _DmsAddEditPermissionBodyState createState() =>
      _DmsAddEditPermissionBodyState();
}

class _DmsAddEditPermissionBodyState extends State<DmsAddEditPermissionBody> {
  PermissionType _permissionType = PermissionType.User;
  DMSLegalEntityModel _selectedLegalEntityData;
  TextEditingController _userddController = new TextEditingController();
  User user = User();
  String enumType;
  Permission _permission = Permission();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: DEFAULT_PADDING,
      child: Column(
        children: <Widget>[
          RadioListTile<PermissionType>(
            title: const Text('Select User'),
            value: PermissionType.User,
            groupValue: _permissionType,
            onChanged: (PermissionType value) {
              setState(() {
                _permissionType = value;
              });
            },
          ),
          RadioListTile<PermissionType>(
            title: const Text('Select Workspace User Group'),
            value: PermissionType.WorkspaceUserGroup,
            groupValue: _permissionType,
            onChanged: (PermissionType value) {
              setState(() {
                _permissionType = value;
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
            applied: false,
            onTap: () {
              enumType = 'DmsPermissionTypeEnum';
              apiCallEnumId();
            },
          ),
          SizedBox(
            height: 20,
          ),
          optionsRow(
            text: 'Access',
            applied: false,
            onTap: () {
              enumType = 'DmsAccessEnum';
              apiCallEnumId();
            },
          ),
          SizedBox(
            height: 20,
          ),
          optionsRow(
            text: 'Applies To',
            applied: false,
            onTap: () {
              enumType = 'DmsAppliesToEnum';
              apiCallEnumId();
            },
          ),
          Expanded(child: SizedBox()),
          _buttonsRow(),
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
          handleOnPressed: () {
            // _permission.dataAction = widget.isCreatePermission ? 0 : 1;
            // ? PermissionDataAction.Create
            // : PermissionDataAction.Edit;
            // permissionBloc..savePermission(permissionModel: _permission);
          },
          width: 100,
        ),
      ],
    );
  }

  Widget _legalEntityWidget() {
    return Visibility(
      visible: _permissionType == PermissionType.User,
      child: ListTile(
        minVerticalPadding: 8.0,
        title: Text("Legal Entity"),
        trailing: Text(
          _selectedLegalEntityData?.name ?? "Select",
          style: Theme.of(context).textTheme.headline6.copyWith(
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
              _userddController.text = user.name;
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
            isUserList: true,
            isTeamList: false,
            title: 'Workspace User Group',
            controller: _userddController,
            hint: 'Workspace User Group',
            isShowArrow: true,
            onListTap: (dynamic value) {
              user = value;
              _userddController.text = user.name;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  optionsRow({String text, Function onTap, bool applied}) {
    return InkWell(
      child: Container(
        alignment: Alignment.topLeft,
        color: applied ? Colors.blue[300] : null,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
              ),
            ),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
      onTap: onTap,
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
