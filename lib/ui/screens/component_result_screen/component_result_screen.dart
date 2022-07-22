import 'package:flutter/material.dart';

import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';
import 'package:hr_management/logic/blocs/internet_bloc/widget/internet_connectivity_widget.dart';
import 'widgets/component_result_body_widget.dart';

class ComponentResultScreen extends StatelessWidget {
  final String? serviceId;

  const ComponentResultScreen({
    required this.serviceId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppbarWidget(
        title: "Component Result",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: ComponentResultBodyWidget(
            serviceId: 'af9a75da-ae2e-4d8a-86a0-d55c08a2a2b8',
          ),
        ),
      ),
    );
  }
}
