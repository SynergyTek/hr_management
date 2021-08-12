import 'package:flutter/material.dart';

import '../../widgets/internet_connectivity_widget.dart';
import 'widget/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: LoginBody(),
        ),
      ),
    );
  }
}
