import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String? text;
  final double? fontSize;

  const Label({this.text, this.fontSize, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      style: TextStyle(color: Colors.white, fontSize: fontSize ?? 14),
    );
  }
}
