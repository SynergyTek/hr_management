import 'package:flutter/material.dart';
import 'package:hr_management/routes/screen_arguments.dart';
import 'package:hr_management/ui/screens/dms/dms_workspace_screen/widgets/dms_workspace_body.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/drawer/nav_drawer_widget.dart';
import 'package:hr_management/ui/widgets/internet_connectivity_widget.dart';

import '../../../../routes/route_constants.dart';
import '../../../../themes/light_theme.dart';

class DMSWorkspaceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppbarWidget(
        title: 'Workspace',
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: DMSWorkspaceBody(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: LightTheme().lightThemeData().primaryColor,
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(
          context,
          DMS_MANAGE_WORKSPACE_ROUTE,
          arguments: ScreenArguments(
            val1: true,
          ),
        ),
      ),
    );
  }
}
