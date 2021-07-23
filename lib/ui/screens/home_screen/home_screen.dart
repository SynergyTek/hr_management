import 'package:flutter/material.dart';

import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';
import '../../widgets/internet_connectivity_widget.dart';
import 'widgets/home_screen_body_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerWidget(context),
      appBar: AppbarWidget(
        title: "Welcome Zlatan",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: HomeScreenBodyWidget(),
        ),
      ),
    );
  }
}
