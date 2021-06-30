import 'package:flutter/material.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/internet_connectivity_widget.dart';

import 'widget/create_service_body.dart';

class CreateServiceScreen extends StatelessWidget {
  const CreateServiceScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppbarWidget(
        title: "Create Service",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: CreateServiceScreenBody(),
        ),
      ),
    );
  }
}
