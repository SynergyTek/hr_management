import 'package:flutter/material.dart';

import '../../../widgets/appbar_widget.dart';
import '../../../widgets/drawer/nav_drawer_widget.dart';
import '../../../widgets/internet_connectivity_widget.dart';
import 'widgets/document_body_widget.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerWidget(context),
      appBar: AppbarWidget(
        title: "Manage Documents",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: DocumentBodyWidget(),
        ),
      ),
    );
  }
}