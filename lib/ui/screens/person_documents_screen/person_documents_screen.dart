import 'package:flutter/material.dart';

import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';
import '../../widgets/internet_connectivity_widget.dart';
import 'widgets/person_documents_body_widget.dart';

class PersonDocumentsScreen extends StatelessWidget {
  const PersonDocumentsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerWidget(context),
      appBar: AppbarWidget(
        title: "Documents Requested by HR",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: PersonDocumentsBodyWidget(),
        ),
      ),
    );
  }
}
