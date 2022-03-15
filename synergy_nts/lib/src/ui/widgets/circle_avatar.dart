import 'package:flutter/material.dart';

Widget circleAvatarLayout(String text, BuildContext context, double radius,
    double fontSize, Color color) {
  return CircleAvatar(
      radius: radius,
      child: CircleAvatar(
        child: Text(
          avatarText(text),
          style: TextStyle(color: Colors.white, fontSize: fontSize),
        ),
      ));
}

Widget circleImageUriAvatarLayout(String text) {
  return CircleAvatar(
    radius: 20,
    child: CircleAvatar(
      child: avatarImage(text),
    ),
  );
}

Widget circleAssetImageAvatarLayout(Image image) {
  return CircleAvatar(
    radius: 20,
    child: CircleAvatar(
      child: avatarAssetImage(image),
    ),
  );
}

Widget avatarImage(String url) {
  return ClipOval(
      child: Image.network(
    url,
    fit: BoxFit.fill,
  ));
}

Widget avatarAssetImage(Image image) {
  return ClipOval(child: image);
}

String avatarText(String title) {
  String firstLetterString = "";
  try {
    if (title != null) {
      firstLetterString = title.substring(0, 2).toUpperCase();
    }
  } catch (e) {
    print(e.toString());
  }
  return firstLetterString;
}

Widget circleAvatarImageLayout(double radius, Icon icon, BuildContext context) {
  return CircleAvatar(
      radius: radius,
      child: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor, child: icon));
}

class TextCircleAvater extends StatelessWidget {
  final String? text;
  final String? title;
  final BuildContext? context;
  final double? radius;
  final double? fontSize;
  final Color? color;
  final bool? isTick;

  const TextCircleAvater(
      {this.text,
      this.title,
      this.context,
      this.radius,
      this.fontSize,
      this.color,
      required this.isTick,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: color,
        radius: radius,
        child: CircleAvatar(
          backgroundColor: color,
          child: isTick!
              ? Icon(Icons.check)
              : Text(
                  avatarText(text!, title ?? ''),
                  style: TextStyle(color: Colors.black, fontSize: fontSize),
                ),
        ));
  }

  String avatarText(String text, String title) {
    String firstLetterString = "";
    try {
      if (text != null) {
        firstLetterString = title == 'Ward'
            ? text.split('-')[0].contains(' ')
                ? text.split('-')[0].split(' ')[0]
                : text.split('-')[0]
            : text.substring(0, 1).toUpperCase();
      }
    } catch (e) {
      // print(e.toString());
    }
    return firstLetterString;
  }
}
