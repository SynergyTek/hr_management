import 'package:flutter/material.dart';

class FlipCardWidget extends StatelessWidget {
  final String colorCode;
  final List<Widget> widgets;

  const FlipCardWidget({
    this.colorCode,
    this.widgets,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      color: colorCode != null ? hexToColor(colorCode) : null,
      child: Column(
        children: widgets,
      ),
    );
  }
}

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
