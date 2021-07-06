import 'package:flutter/material.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/internet_connectivity_widget.dart';

import 'widget/create_service_body.dart';

class CreateServiceScreen extends StatelessWidget {
  final String templateCode;
  const CreateServiceScreen({Key key, this.templateCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Create " + templateCode,
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: CreateServiceScreenBody(
            templateCode: templateCode,
          ),
        ),
      ),
    );
  }
}
