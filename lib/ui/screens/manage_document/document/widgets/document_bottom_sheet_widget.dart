import 'package:flutter/material.dart';

import '../../../../../themes/theme_config.dart';

class DocumentBottomSheetWidget extends StatelessWidget {
  final List<Widget> bottomSheetDataList;

  const DocumentBottomSheetWidget({
    @required this.bottomSheetDataList,
  });

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
        children: bottomSheetDataList ?? [],
      ),
    );
  }
}
