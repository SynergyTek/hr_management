import 'package:flutter/material.dart';
import 'package:hr_management/data/models/dms/dms_manage_workspace_input_model/dms_manage_workspace_input_model.dart';

import '../../../widgets/appbar_widget.dart';
import '../../../widgets/drawer/nav_drawer_widget.dart';
import '../../../widgets/internet_connectivity_widget.dart';
import 'widgets/dms_manage_workspace_body_widget.dart';

class DMSManageWorkspaceScreen extends StatelessWidget {
  final DMSManageWorkspaceInputModel dmsManageWorkspaceInputModel;

  DMSManageWorkspaceScreen({
    this.dmsManageWorkspaceInputModel,
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
            dmsManageWorkspaceInputModel: dmsManageWorkspaceInputModel,
          ),
        ),
      ),
    );
  }
}
