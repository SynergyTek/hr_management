import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import '../../../../data/helpers/showup.dart';

Widget buildTile(
    {String title,
    Color bgColor,
    BuildContext context,
    String moduleName,
    String tabName,
    int value,
    bool isTile}) {
  return Material(
      elevation: 14.0,
      borderRadius: BorderRadius.circular(12.0),
      shadowColor: Color(0x802196F3),
      child: InkWell(
          child: isTile
              ? worklistTileWidget(bgColor: bgColor, value: value, title: title)
              : worklistHeading(title: title)));
}

Widget worklistTileWidget({
  Color bgColor,
  int value,
  String title,
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
                      value.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                    delay: 100,
                  ))),
          Padding(padding: EdgeInsets.only(bottom: 7.0)),
          Text(title,
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0)),
        ]),
  );
}

Widget worklistHeading({String title}) {
 
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: InkWell(
                  child: Text(title,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20
                          // decoration: TextDecoration.underline
                          )),
                  onTap: () {}),
            ),
            // ShowUp(
            //   child: Text('10',
            //       style: TextStyle(
            //           color: Colors.black87,
            //           fontWeight: FontWeight.w700,
            //           fontSize: 30.0)),
            //   delay: 100,
            // ),
          ],
        ),
        // Material(
        //     color: Colors.blue,
        //     borderRadius: BorderRadius.circular(24.0),
        //     child: Center(
        //         child: Padding(
        //       padding: const EdgeInsets.all(16.0),
        //       child: Icon(Icons.person, color: Colors.white, size: 30.0),
        //     )))
      ]);

}