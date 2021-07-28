import 'package:flutter/material.dart';
import '../../../data/enums/enums.dart';
import '../../../routes/route_constants.dart';
import '../../../routes/screen_arguments.dart';
import 'widget/service_home_body.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';

class ServiceHomeScreen extends StatelessWidget {
  final String mode;
  final String serviceStatus;
  final String moduleId;
  final bool showBack;
  const ServiceHomeScreen(
      {Key key, this.serviceStatus, this.moduleId, this.mode, this.showBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: showBack ? null : drawerWidget(context),
      appBar: AppbarWidget(
        title: "Service Home",
      ),
      body: SafeArea(
        child: ServiceHomeBody(
          serviceStatus: serviceStatus,
          moduleId: moduleId,
          mode: mode,
        ),
      ),
      // ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.add,
          size: 32,
        ),
        onPressed: () {
          Navigator.pushNamed(
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
