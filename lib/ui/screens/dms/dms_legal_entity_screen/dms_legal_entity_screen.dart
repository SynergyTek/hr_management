import 'package:flutter/material.dart';
import 'package:hr_management/ui/screens/dms/dms_legal_entity_screen/widgets/dms_legal_entity_body_widget.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/drawer/nav_drawer_widget.dart';
import 'package:hr_management/ui/widgets/internet_connectivity_widget.dart';

class DMSLegalEntityScreen extends StatelessWidget {
  const DMSLegalEntityScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerWidget(context),
      appBar: AppbarWidget(
        title: "Legal Entity",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: DMSLegalEntityBodyWidget(),
        ),
      ),
    );
  }
}
