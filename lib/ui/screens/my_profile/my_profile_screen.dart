import 'package:flutter/material.dart';
import 'package:hr_management/ui/screens/my_profile/widget/my_profile_body.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/drawer/nav_drawer_widget.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key key}) : super(key: key);

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerWidget(context),
      appBar: AppbarWidget(
        title: "My Profile",
      ),
      body: SafeArea(
        child: MyProfileBody()),
      // ),
    );
  }
}
