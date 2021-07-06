import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  final String loadingText;

  CustomProgressIndicator({
    this.loadingText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
          elevation: 20,
          child: Padding(
            padding: const EdgeInsets.all(26),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                    // color: Theme.of(context).primaryColor,
                    ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  loadingText ?? "Please Wait...",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          )),
    );
  }
}
