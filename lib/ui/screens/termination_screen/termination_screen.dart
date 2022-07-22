import 'package:flutter/material.dart';
import 'package:hr_management/ui/screens/termination_screen/widgets/termination_body_widget.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/drawer/nav_drawer_widget.dart';

import 'package:hr_management/logic/blocs/internet_bloc/widget/internet_connectivity_widget.dart';

class TerminationScreen extends StatelessWidget {
  const TerminationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Termination",
      ),
      drawer: DrawerWidget(),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: TerminationBodyWidget(),
        ),
      ),
    );
  }
}
