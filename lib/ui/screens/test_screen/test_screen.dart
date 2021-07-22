import 'package:flutter/material.dart';
import 'package:hr_management/data/enums/enums.dart';

import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';
import '../../widgets/internet_connectivity_widget.dart';
import 'widgets/test_screen_body_widget.dart';

class TestScreen extends StatelessWidget {
  final NTSType ntsType;

  const TestScreen({
    @required this.ntsType,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerWidget(context),
      appBar: AppbarWidget(
        title: "Test Screen",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: TestScreenBodyWidget(
            ntsType: ntsType,
          ),
        ),
      ),
    );
  }
}
