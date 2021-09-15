import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:hr_management/ui/screens/dms/dms_view_permission_screen/widgets/dms_view_permission_body.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/internet_connectivity_widget.dart';

class DMSViewPermissionScreen extends StatelessWidget {
  final String noteId;
  final String parentId;
  final String workspaceId;
  final bool isManagePermission;

  const DMSViewPermissionScreen({
    @required this.noteId,
    this.parentId,
    this.workspaceId,
    @required this.isManagePermission,
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
          onTap: () {},
          label: 'Disable Inheritance',
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
          onTap: () {},
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
