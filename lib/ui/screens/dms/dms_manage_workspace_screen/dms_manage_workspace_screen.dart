import 'package:flutter/material.dart';

import '../../../widgets/appbar_widget.dart';
import '../../../widgets/drawer/nav_drawer_widget.dart';
import '../../../widgets/internet_connectivity_widget.dart';
import 'widgets/dms_manage_workspace_body_widget.dart';

class DMSManageWorkspaceScreen extends StatelessWidget {
  final String? parentWorkspaceId;

  DMSManageWorkspaceScreen({
    this.parentWorkspaceId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerWidget(context),
      appBar: AppbarWidget(
        title: "Manage Workspace",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: DMSManageWorkspaceBodyWidget(
            parentWorkspaceId: parentWorkspaceId,
          ),
        ),
      ),
    );
  }
}
