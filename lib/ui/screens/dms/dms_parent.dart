import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:hr_management/routes/route_constants.dart';
import 'package:hr_management/ui/screens/dms/widget/dms_parent_body.dart';

import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';
import '../../widgets/internet_connectivity_widget.dart';

class DMSParent extends StatelessWidget {
  final String? sourceId;
  final bool? isCopy;
  final bool? isCut;

  const DMSParent({Key? key, this.sourceId, this.isCopy, this.isCut})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerWidget(context),
      appBar: AppbarWidget(
        title: "DMS",
      ),
      floatingActionButton: buildSpeedDial(context),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: DMSParentBody(
            sourceId: sourceId,
            isCopy: isCopy,
            isCut: isCut,
          ),
        ),
      ),
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
        // SpeedDialChild(
        //   child: Icon(
        //     Icons.folder_open,
        //     color: Colors.white,
        //   ),
        //   backgroundColor: Colors.blue,
        //   onTap: () {
        //     Navigator.pushNamed(
        //       context,
        //       DMS_NEW_FOLDER_ROUTE,
        //     );
        //   },
        //   label: 'Create New Folder',
        //   labelStyle: TextStyle(
        //     fontWeight: FontWeight.w500,
        //     color: Colors.white,
        //   ),
        //   labelBackgroundColor: Colors.black,
        // ),
        SpeedDialChild(
          child: Icon(
            Icons.workspaces_outline,
            color: Colors.white,
          ),
          backgroundColor: Colors.blue,
          onTap: () {
            Navigator.pushNamed(
              context,
              DMS_MANAGE_WORKSPACE_ROUTE,
            );
          },
          label: 'Create Workspace',
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
