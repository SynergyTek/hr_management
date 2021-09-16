import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:hr_management/logic/blocs/dms_bloc/permission_bloc/permission_bloc.dart';
import 'package:hr_management/routes/route_constants.dart';
import 'package:hr_management/routes/screen_arguments.dart';

import 'package:hr_management/ui/screens/dms/dms_view_permission_screen/widgets/dms_view_permission_body.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/internet_connectivity_widget.dart';
import 'package:hr_management/ui/widgets/snack_bar.dart';

class DMSViewPermissionScreen extends StatelessWidget {
  final String noteId;
  final String parentId;
  final String workspaceId;
  final bool isManagePermission;
  final List<String> path;
  final String inheritanceType;

  const DMSViewPermissionScreen({
    @required this.noteId,
    @required this.isManagePermission,
    this.parentId,
    this.workspaceId,
    this.path,
    this.inheritanceType,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: isManagePermission ? 'Manage Permission' : 'View Permission',
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: DMSViewPermissionBody(
            noteId: noteId,
            parentId: parentId,
            workspaceId: workspaceId,
            isManagePermission: isManagePermission,
            path: path,
          ),
        ),
      ),
      floatingActionButton:
          isManagePermission ? buildSpeedDial(context) : Container(),
    );
  }

  SpeedDial buildSpeedDial(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 28.0),
      backgroundColor: Colors.blue[900],
      visible: true,
      curve: Curves.bounceInOut,
      children: [
        SpeedDialChild(
          child: Icon(
            Icons.disabled_by_default_rounded,
            color: Colors.white,
          ),
          backgroundColor: Colors.blue,
          onTap: () async {
            String inheritanceStatus =
                inheritanceType == 'true' ? 'false' : 'true';
            String error =
                await permissionBloc.disableParentPermission(queryparams: {
              "id": "$noteId",
              "InheritanceStatus": "$inheritanceStatus",
            });
            if (error.toString() == 'null') {
              Navigator.pop(context);
              Navigator.of(context).pushNamed(
                DMS_VIEW_PERMISSION_ROUTE,
                arguments: ScreenArguments(
                  arg1: noteId,
                  arg2: parentId,
                  arg3: workspaceId,
                  arg4: inheritanceType == 'true' ? 'false' : 'true',
                  val1: isManagePermission,
                  list1: path,
                ),
              );
              displaySnackBar(
                  text: inheritanceType == 'true'
                      ? 'Inheritance Enabled successfully.'
                      : 'Inheritance Disabled successfully.',
                  context: context);
            } else {}
          },
          label: inheritanceType == 'true'
              ? 'Enable Inheritance'
              : 'Disable Inheritance',
          labelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          labelBackgroundColor: Colors.black,
        ),
        SpeedDialChild(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.blue,
          onTap: () =>
              Navigator.pushNamed(context, DMS_ADD_EDIT_PERMISSION_ROUTE,
                  arguments: ScreenArguments(
                    arg1: noteId,
                  )),
          label: 'Add Permission',
          labelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          labelBackgroundColor: Colors.black,
        ),
      ],
    );
  }
}
