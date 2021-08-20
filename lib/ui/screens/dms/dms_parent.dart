import 'package:flutter/material.dart';
import 'package:hr_management/ui/screens/dms/widget/dms_parent_body.dart';

import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';
import '../../widgets/internet_connectivity_widget.dart';

class DMSParent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerWidget(context),
      appBar: AppbarWidget(
        title: "DMS",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: DMSParentBody(),
        ),
      ),
    );
  }
}
