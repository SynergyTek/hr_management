import 'package:flutter/material.dart';

import '../../../widgets/appbar_widget.dart';
import '../../../widgets/drawer/nav_drawer_widget.dart';
import '../../../widgets/internet_connectivity_widget.dart';
import 'widgets/dms_new_folder_body_widget.dart';

class DMSNewFolderScreen extends StatelessWidget {
  const DMSNewFolderScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerWidget(context),
      appBar: AppbarWidget(
        title: "Create new folder",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: DMSNewFolderBodyWidget(),
        ),
      ),
    );
  }
}
