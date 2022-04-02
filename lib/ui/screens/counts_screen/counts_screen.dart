import 'package:flutter/material.dart';

import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';
import '../../widgets/internet_connectivity_widget.dart';
import 'widgets/counts_screen_body_widget.dart';

class CountsScreen extends StatelessWidget {
  const CountsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppbarWidget(
        title: "Home",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: CountsScreenBodyWidget(),
        ),
      ),
    );
  }
}
