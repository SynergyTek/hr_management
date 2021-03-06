import 'package:flutter/material.dart';

import '../../../themes/theme_config.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';
import 'package:hr_management/logic/blocs/internet_bloc/widget/internet_connectivity_widget.dart';
import 'widget/my_profile_body_widget.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppbarWidget(
        backgroundColor: Theme.of(context).textHeadingColor,
        foregroundColor: Colors.white,
        title: "",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: MyProfileBodyWidget(),
        ),
      ),
    );
  }
}
