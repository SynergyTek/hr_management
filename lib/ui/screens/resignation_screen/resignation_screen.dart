import 'package:flutter/material.dart';
import 'package:hr_management/ui/screens/resignation_screen/widgets/resignation_body_widget.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/drawer/nav_drawer_widget.dart';

import '../../widgets/internet_connectivity_widget.dart';

class ResignationScreen extends StatelessWidget {
  const ResignationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Resignation",
      ),
      drawer: DrawerWidget(),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: ResignationBodyWidget(),
        ),
      ),
    );
  }
}
