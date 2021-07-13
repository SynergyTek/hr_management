import 'package:flutter/material.dart';
import 'package:hr_management/ui/screens/login/widget/login_body.dart';
import 'package:hr_management/ui/widgets/internet_connectivity_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: InternetConnectivityWidget(child: LoginBody())));
  }
}
