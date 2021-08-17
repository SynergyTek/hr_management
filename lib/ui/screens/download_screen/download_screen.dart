import 'package:flutter/material.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/drawer/nav_drawer_widget.dart';
import 'widgets/download_screen_body_widget.dart';

import '../../widgets/internet_connectivity_widget.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerWidget(context),
      appBar: AppbarWidget(
        title: "Download Screen",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: DownloadScreenBodyWidget(),
        ),
      ),
    );
  }
}
