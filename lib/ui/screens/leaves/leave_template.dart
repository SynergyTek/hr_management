import 'package:flutter/material.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/internet_connectivity_widget.dart';

import 'widget/leave_template_body_widget.dart';

class LeaveTemplate extends StatelessWidget {
  const LeaveTemplate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
