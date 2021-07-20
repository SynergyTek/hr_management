import 'package:flutter/material.dart';
import '../../../data/enums/enums.dart';
import '../../../routes/screen_arguments.dart';

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
            () => Navigator.pushReplacementNamed(
              context, NTS_TEMPLATE_REQUEST,
              arguments: ScreenArguments(
                ntstype: NTSType.service,
                arg4: 'Leave',
              ),
              // LOGIN_ROUTE,
            ),
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
}
