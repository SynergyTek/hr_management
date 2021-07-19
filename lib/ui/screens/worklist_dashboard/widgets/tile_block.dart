import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:hr_management/data/helpers/showup.dart';

Widget worklistTileWidget({
  Color bgColor,
  String value,
  String heading,
}) {
  return Padding(
    padding: const EdgeInsets.all(24.0),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Material(
              color: bgColor,
              shape: CircleBorder(),
              child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ShowUp(
                    child: Text(
                      value,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                    delay: 100,
                  ))),
          Padding(padding: EdgeInsets.only(bottom: 7.0)),
          Text(heading,
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0)),
        ]),
  );
}


Widget buildTile({
  Widget child,
  String heading,
  BuildContext context,
  String moduleName,
  String tabName,}
) {
  return Material(
      elevation: 14.0,
      borderRadius: BorderRadius.circular(12.0),
      shadowColor: Color(0x802196F3),
      child: InkWell(child: child));
}
