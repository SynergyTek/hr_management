import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String text;
  final double fontSize;

  const Label({this.text, this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(color:Colors.white ,fontSize: fontSize==null?14:fontSize),);
  }
}