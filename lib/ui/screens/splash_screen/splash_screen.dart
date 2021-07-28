import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/route_constants.dart';
import 'widgets/splash_screen_body_widget.dart';

class SplashScreen extends StatelessWidget {
  /// Text to be displayed below the Circular ProgressIndicator.
  final String titleText;
  final String subtitleText;

  /// Default text is "Loading".
  final String loadingText;

  const SplashScreen({
    @required this.titleText,
    this.subtitleText,
    this.loadingText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: FutureBuilder<Object>(
          future: Future.delayed(
            const Duration(
              seconds: 2,
            ),
            () {
              return checkLoggedIn(context);
            },
          ),
          builder: (context, snapshot) {
            return SplashScreenBodyWidget(
              titleText: titleText,
              subtitleText: subtitleText,
              loadingText: loadingText,
            );
          },
        ),
      ),
    );
  }

  checkLoggedIn(
    BuildContext context,
  ) async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var username = prefs.getString('username');
    var id = prefs.getString('id');
    print(id);
    if (username == null) {
      Navigator.pushReplacementNamed(
        context, LOGIN_ROUTE,
        // WORKLIST_DASHBOARD,
      );
    } else {
      // user is already logged in, use this function to send device token to the backend.
      Navigator.pushReplacementNamed(
        context,
        WORKLIST_DASHBOARD,
      );
    }
  }
}
