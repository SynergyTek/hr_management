import 'package:flutter/material.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';
import '../../widgets/internet_connectivity_widget.dart';

import 'widget/payslip_body.dart';

class PayslipScreen extends StatelessWidget {
  const PayslipScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Payslip",
      ),
      drawer: drawerWidget(context),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: PayslipBody(),
        ),
      ),
    );
  }
}
