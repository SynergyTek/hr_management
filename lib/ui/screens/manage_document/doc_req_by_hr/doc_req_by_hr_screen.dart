import 'package:flutter/material.dart';
import 'package:hr_management/logic/blocs/internet_bloc/widget/internet_connectivity_widget.dart';

import '../../../widgets/appbar_widget.dart';
import '../../../widgets/drawer/nav_drawer_widget.dart';
import 'widgets/doc_req_by_hr_body_widget.dart';

class DocReqByHrScreen extends StatelessWidget {
  const DocReqByHrScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppbarWidget(
        title: "Documents Requested by HR",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: DocReqByHrBodyWidget(),
        ),
      ),
    );
  }
}
