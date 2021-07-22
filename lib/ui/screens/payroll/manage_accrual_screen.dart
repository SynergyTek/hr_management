import 'package:flutter/material.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';
import '../../widgets/internet_connectivity_widget.dart';

import 'widget/manage_accrual_body.dart';

class ManageAccrualScreen extends StatelessWidget {
  const ManageAccrualScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Manage Accrual",
      ),
      drawer: drawerWidget(context),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: ManageAccrualBody(),
        ),
      ),
    );
  }
}
