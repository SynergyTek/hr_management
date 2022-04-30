// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../../theme/light_theme.dart';

class CustomProgressIndicator extends StatelessWidget {
  final String? loadingText;

  const CustomProgressIndicator({
    this.loadingText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Wrap(
              // mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                  backgroundColor: LightTheme().lightThemeData().primaryColor,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  loadingText ?? "Please Wait...",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.blue,
                        fontSize: 16.0,
                      ),
                )
              ],
            ),
          )),
    );
  }
}
