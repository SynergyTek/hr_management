import 'package:flutter/material.dart';
import 'package:hr_management/themes/theme_config.dart';

import '../../themes/light_theme.dart';

class CustomProgressIndicator extends StatelessWidget {
  final String? loadingText;

  CustomProgressIndicator({
    this.loadingText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
          elevation: 8,
          child: Padding(
            padding: DEFAULT_LARGE_PADDING,
            child: Wrap(
              // mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                  backgroundColor: LightTheme().lightThemeData().primaryColor,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  loadingText ?? "Please Wait...",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Theme.of(context).textHeadingColor,
                        fontSize: 16.0,
                      ),
                )
              ],
            ),
          )),
    );
  }
}
