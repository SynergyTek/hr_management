import 'package:flutter/material.dart';

class TextCircleAvater extends StatelessWidget {
  final String text;
  final BuildContext context;
  final double radius;
  final double fontSize;
  final Color color;
  const TextCircleAvater(
      {Key key,
      this.text,
      this.context,
      this.radius,
      this.fontSize,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: color,
        radius: radius,
        child: CircleAvatar(
          backgroundColor: color,
          child: Text(
            avatarText(text),
            style: TextStyle(color: Colors.black, fontSize: fontSize),
          ),
        ));
  }

  String avatarText(String title) {
    String firstLetterString = "";
    try {
      if (title != null) {
        firstLetterString = title.substring(0, 1).toUpperCase();
      }
    } catch (e) {
      // print(e.toString());
    }
    return firstLetterString;
  }
}
