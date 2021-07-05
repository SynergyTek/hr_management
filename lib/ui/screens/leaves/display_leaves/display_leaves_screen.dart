import 'package:flutter/material.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/drawer/nav_drawer_widget.dart';
import 'package:hr_management/ui/widgets/internet_connectivity_widget.dart';

import 'display_leave_body.dart';


class DisplayLeaves extends StatelessWidget {
  const DisplayLeaves({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
       drawer: drawerWidget(context),
      appBar: AppbarWidget(
        title: "Leaves",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: DisplayLeavesBody(),
        ),
      ),
    );
  }
}