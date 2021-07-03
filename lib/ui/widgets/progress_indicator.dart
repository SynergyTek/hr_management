import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({Key key}) : super(key: key);

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
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  "Please Wait...",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          )),
    );
  }
}
