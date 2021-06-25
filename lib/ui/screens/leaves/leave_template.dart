import 'package:flutter/material.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/drawer/nav_drawer_widget.dart';
import 'package:hr_management/ui/widgets/internet_connectivity_widget.dart';

import 'widget/leave_template_body_widget.dart';

class LeaveTemplate extends StatelessWidget {
  const LeaveTemplate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerWidget(context),
      appBar: AppbarWidget(
        title: "Leave Template",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: LeaveTemplateBody(),
        ),
      ),
    );
  }
}
