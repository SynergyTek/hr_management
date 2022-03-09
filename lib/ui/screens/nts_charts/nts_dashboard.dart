import 'package:flutter/material.dart';

import '../../../data/enums/enums.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';
import '../../widgets/internet_connectivity_widget.dart';
import 'widget/nts_dashboard_body.dart';

class ServiceDashboard extends StatelessWidget {
  const ServiceDashboard({
    Key? key,
    required this.ntsType,
  }) : super(key: key);

  final NTSType ntsType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: _ntsTitle()),
      drawer: drawerWidget(context),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: NTSDashboardBody(
            ntsType: ntsType,
          ),
        ),
      ),
    );
  }

  String? _ntsTitle() {
    String? title;
    if (ntsType == NTSType.service)
      title = 'Service Home Dashboard';
    else if (ntsType == NTSType.task)
      title = 'Task Home Dashboard';
    else if (ntsType == NTSType.note) title = 'Note Home Dashboard';

    return title;
  }
}
