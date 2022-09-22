import 'package:flutter/material.dart';
import 'package:hr_management/routes/route_constants.dart';
import 'package:hr_management/routes/screen_arguments.dart';
import 'package:hr_management/themes/light_theme.dart';
import 'package:hr_management/ui/screens/business_trip/widget/business_trip_widget.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/logic/blocs/internet_bloc/widget/internet_connectivity_widget.dart';

// import '../../../data/enums/enums.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';

class BusinessTripScreen extends StatelessWidget {
  const BusinessTripScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: LightTheme().lightThemeData().primaryColor,
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(
          context,
          CREATE_SERVICE_ROUTE,
          arguments: ScreenArguments(
            arg1: "BuisnessTrip",
            // arg2: "",
            // arg3: "",
            val1: false,
            // portalType: PortalType.hr,
          ),
        ),
      ),
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
