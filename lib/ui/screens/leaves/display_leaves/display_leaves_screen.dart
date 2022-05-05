import 'package:flutter/material.dart';
import '../../../../data/enums/enums.dart';
import '../../../../routes/route_constants.dart';
import '../../../../routes/screen_arguments.dart';
import '../../../../themes/light_theme.dart';
import '../../../widgets/appbar_widget.dart';
import '../../../widgets/drawer/nav_drawer_widget.dart';
import '../../../widgets/internet_connectivity_widget.dart';

import 'display_leave_body.dart';

class DisplayLeaves extends StatelessWidget {
  const DisplayLeaves({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppbarWidget(
        title: "Leaves",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: DisplayLeavesBody(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: LightTheme().lightThemeData().primaryColor,
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(
          context,
          NTS_TEMPLATE_REQUEST,
          arguments: ScreenArguments(
            ntstype: NTSType.service,
            arg4: 'Leave',
          ),
        ),
      ),
    );
  }
}
