import 'package:flutter/material.dart';
import 'package:hr_management/ui/screens/dms/dms_workspace_screen/widgets/dms_workspace_body.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/drawer/nav_drawer_widget.dart';
import 'package:hr_management/ui/widgets/internet_connectivity_widget.dart';

class DMSWorkspaceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerWidget(context),
      appBar: AppbarWidget(
        title: 'Workspace',
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: DMSWorkspaceBody(),
        ),
      ),
    );
  }
}
