import 'package:flutter/material.dart';

import '../../../../themes/theme_config.dart';

class SplashScreenBodyWidget extends StatelessWidget {
  /// Text to be displayed below the Circular ProgressIndicator.
  /// Default text is "Loading".
  final String titleText;
  final String subtitleText;
  final String loadingText;

  const SplashScreenBodyWidget({
    @required this.titleText,
    this.subtitleText,
    this.loadingText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: DEFAULT_LARGE_PADDING,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              titleText ?? "",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5.copyWith(
                    color: Theme.of(context).textHeadingColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              subtitleText ?? "",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Theme.of(context).accentColor,
                  ),
            ),
            SizedBox(
              height: 64.0,
            ),
            _cirlularProgressIndicator(),
            SizedBox(
              height: 32.0,
            ),
            Text(loadingText ?? "Loading..."),
          ],
        ),
      ),
    );
  }

  Widget _cirlularProgressIndicator() => CircularProgressIndicator();
}
