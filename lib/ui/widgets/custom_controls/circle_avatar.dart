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
