import 'package:flutter/material.dart';

import '../../widgets/appbar_widget.dart';
import '../../widgets/internet_connectivity_widget.dart';
import 'widget/service_body.dart';

class CreateServiceScreen extends StatelessWidget {
  final bool isLeave;
  final String templateCode;
  final String serviceId;
  final String title;
  const CreateServiceScreen(
      {Key key, this.templateCode, this.serviceId, this.title, this.isLeave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
          title: serviceId == null || serviceId.isEmpty
              ? "Create " + templateCode
              // : "Edit " + title == null
              //     ? '-'
              //     : title),
              : "Edit " + title ?? '-'),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: CreateServiceScreenBody(
            isLeave: isLeave,
            templateCode: templateCode,
            serviceId: serviceId,
          ),
        ),
      ),
    );
  }
}
