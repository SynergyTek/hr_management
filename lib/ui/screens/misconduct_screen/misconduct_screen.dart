import 'package:flutter/material.dart';
import 'package:hr_management/ui/screens/misconduct_screen/widgets/misconduct_body_widget.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/drawer/nav_drawer_widget.dart';

import 'package:hr_management/logic/blocs/internet_bloc/widget/internet_connectivity_widget.dart';

class MisconductScreen extends StatelessWidget {
  const MisconductScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Misconduct",
      ),
      drawer: DrawerWidget(),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: MisconductBodyWidget(),
        ),
      ),
    );
  }
}
