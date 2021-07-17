import 'package:flutter/material.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/ui/widgets/drawer/nav_drawer_widget.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/internet_connectivity_widget.dart';
import 'widget/nts_dashboard_body.dart';

class ServiceDashboard extends StatelessWidget {
  const ServiceDashboard({
    Key key,
    @required this.ntsType,
  }) : super(key: key);

  final NTSType ntsType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: 'Service Dashboard'),
      drawer: drawerWidget(context),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: ServiceDashboardBody(ntsType: ntsType,),
        ),
      ),
    );
  }
}
