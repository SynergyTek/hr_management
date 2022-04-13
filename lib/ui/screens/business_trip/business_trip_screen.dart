import 'package:flutter/material.dart';
import 'package:hr_management/ui/screens/business_trip/widget/business_trip_widget.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/internet_connectivity_widget.dart';

import '../../widgets/drawer/nav_drawer_widget.dart';

class BusinessTripScreen extends StatelessWidget {
  const BusinessTripScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppbarWidget(
        title: "Business Trip",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: BusinessTripBody(),
        ),
      ),
    );
  }
}
