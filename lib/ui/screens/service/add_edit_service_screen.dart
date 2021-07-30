import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../../../data/enums/enums.dart';
import '../../../data/models/service_models/service.dart';
import '../../../data/models/service_models/service_response.dart';
import '../../../logic/blocs/service_bloc/service_bloc.dart';
import '../../../routes/route_constants.dart';
import '../../../routes/screen_arguments.dart';
import 'create_service_form_bloc.dart';
import '../../widgets/progress_indicator.dart';

import '../../widgets/appbar_widget.dart';
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
