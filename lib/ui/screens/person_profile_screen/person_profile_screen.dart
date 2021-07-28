import 'package:flutter/material.dart';

import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';
import '../../widgets/internet_connectivity_widget.dart';
import 'widgets/person_profile_body_widget.dart';

class PersonProfileScreen extends StatelessWidget {
  const PersonProfileScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerWidget(context),
      appBar: AppbarWidget(
        title: "Manage Documents",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: PersonProfileBodyWidget(),
        ),
      ),
    );
  }
}
