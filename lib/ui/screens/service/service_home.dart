import 'package:flutter/material.dart';
// import '../../../data/enums/enums.dart';
import '../../../routes/route_constants.dart';
import '../../../routes/screen_arguments.dart';
import '../../../themes/light_theme.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';
import 'widget/service_home_body.dart';
import 'package:synergy_nts/synergy_nts.dart';

class ServiceHomeScreen extends StatelessWidget {
  final String? mode;
  final String? serviceStatus;
  final String? moduleId;
  final bool? showBack;
  final String? templateCode;
  final bool isDelete;
  const ServiceHomeScreen(
      {Key? key,
      this.serviceStatus,
      this.moduleId,
      this.mode,
      this.showBack,
      this.templateCode,
      this.isDelete = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: showBack! ? DrawerWidget() : null,
      appBar: AppbarWidget(
        title: "Service Home",
      ),
      body: SafeArea(
        child: ServiceHomeBody(
          serviceStatus: serviceStatus,
          moduleId: moduleId,
          mode: mode,
          isDelete: isDelete,
        ),
      ),
      // ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: LightTheme().lightThemeData().primaryColor,
        child: Icon(
          Icons.add,
          size: 32,
        ),
        onPressed: () {
          (templateCode != null && templateCode!.isNotEmpty)
              ? Navigator.pushNamed(
                  context,
                  CREATE_SERVICE_ROUTE,
                  arguments: ScreenArguments(
                    arg1: templateCode,
                    arg2: '',
                    arg3: '',
                    val1: false,
                    val2: isDelete,
                  ),
                )
              : Navigator.pushNamed(
                  context,
                  NTS_TEMPLATE_REQUEST,
                  arguments: ScreenArguments(
                    ntstype: NTSType.service,
                    arg4: '',
                  ),
                );
        },
      ),
    );
  }
}
