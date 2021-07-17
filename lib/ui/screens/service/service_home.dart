import 'package:flutter/material.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/routes/route_constants.dart';
import 'package:hr_management/routes/screen_arguments.dart';
import 'package:hr_management/ui/screens/service/widget/service_home_body.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';

class ServiceHomeScreen extends StatelessWidget {
  const ServiceHomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerWidget(context),
      appBar: AppbarWidget(
        title: "Service Home",
      ),
      body: SafeArea(
        // child: InternetConnectivityWidget(
        child: ServiceHomeBody(),
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
