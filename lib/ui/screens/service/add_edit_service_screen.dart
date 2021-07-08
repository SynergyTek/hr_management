import 'package:flutter/material.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/internet_connectivity_widget.dart';

import 'widget/service_body.dart';

class CreateServiceScreen extends StatelessWidget {
  final String templateCode;
  final String serviceId;
  const CreateServiceScreen({Key key, this.templateCode, this.serviceId})
      : super(key: key);

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
            serviceId: serviceId,
          ),
        ),
      ),
    );
  }
}
