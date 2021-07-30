import 'package:flutter/material.dart';
import '../../widgets/internet_connectivity_widget.dart';
import 'widget/add_edit_service_body.dart';

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
    return Material(
      child: InternetConnectivityWidget(
          child: CreateServiceScreenBody(
        isLeave: isLeave,
        serviceId: serviceId,
        templateCode: templateCode,
        title: title,
      )),
    );
  }
}
