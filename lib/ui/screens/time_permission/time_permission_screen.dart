import 'package:flutter/material.dart';

// import '../../../data/enums/enums.dart';
import '../../../routes/route_constants.dart';
import '../../../routes/screen_arguments.dart';
import '../../../themes/light_theme.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';
import 'package:hr_management/logic/blocs/internet_bloc/widget/internet_connectivity_widget.dart';
import 'widget/time_permission_body.dart';
import 'package:synergy_nts/synergy_nts.dart';

class TimePermissionScreen extends StatelessWidget {
  const TimePermissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppbarWidget(title: 'Time Permission List'),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: TimePermissionListViewWidget(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: LightTheme().lightThemeData().primaryColor,
          child: Icon(Icons.add),
          onPressed: () => Navigator.pushNamed(context, CREATE_SERVICE_ROUTE,
              arguments: ScreenArguments(
                  arg1: "TimePermissionBusiness",
                  arg4: "TimePermissionBusiness",
                  val1: false,
                  portalType: PortalType.hr))),
    );
  }
}
