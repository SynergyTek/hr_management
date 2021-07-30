import 'package:flutter/material.dart';

import '../../../../../themes/theme_config.dart';

class LeaveDetailsBottomSheetWidget extends StatelessWidget {
  final String duration;

  const LeaveDetailsBottomSheetWidget({Key key, this.duration})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            16.0,
          ),
          topRight: Radius.circular(
            16.0,
          ),
        ),
      ),
      padding: DEFAULT_LARGE_PADDING,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(
              'Duration',
              style: TextStyle(
                color: Theme.of(context).textHeadingColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(duration ?? 'NA'),
          ),
          ListTile(
            title: Text(
              'Working Duration',
              style: TextStyle(
                color: Theme.of(context).textHeadingColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(duration ?? 'NA'),
          ),
        ],
      ),
    );
  }
}
