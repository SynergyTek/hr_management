import 'package:flutter/material.dart';
import 'package:hr_management/data/helpers/hex_colot_convert.dart';

class FlipCardWidget extends StatelessWidget {
  final String? colorCode;
  final List<Widget>? widgets;

  const FlipCardWidget({
    this.colorCode,
    this.widgets,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      color: colorCode != null ? hexToColor(colorCode!) : null,
      child: Column(
        children: widgets!,
      ),
    );
  }
}
