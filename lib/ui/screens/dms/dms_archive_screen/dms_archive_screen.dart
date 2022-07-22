import 'package:flutter/material.dart';
import 'package:hr_management/ui/screens/dms/dms_archive_screen/widgets/dms_archive_body.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/drawer/nav_drawer_widget.dart';
import 'package:hr_management/logic/blocs/internet_bloc/widget/internet_connectivity_widget.dart';

class DMSArchiveScreen extends StatelessWidget {
  const DMSArchiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppbarWidget(title: "Archive"),
      body: SafeArea(
          child: InternetConnectivityWidget(
        child: DMSArchiveBody(),
      )),
    );
  }
}
