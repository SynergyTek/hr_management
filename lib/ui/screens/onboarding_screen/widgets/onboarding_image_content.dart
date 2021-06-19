import 'package:flutter/material.dart';

import '../../../../themes/theme_config.dart';

class SplashImageContent extends StatelessWidget {
  final String titleText;
  final String subtitleText;
  final String imagePath;

  const SplashImageContent({
    this.titleText,
    this.subtitleText,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    if (imagePath == null || imagePath.isEmpty)
      throw ("Image Path cannot be null or empty");

    return Padding(
      padding: DEFAULT_LARGE_PADDING,
      child: Column(
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
          SizedBox(height: 64.0),
          Image.asset(
            imagePath,
            height: 240,
            width: 240,
          ),
        ],
      ),
    );
  }
}
