import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hr_management/constants/api_endpoints.dart';

final _random = Random();
Widget buildFront(String templateName, String templateImageCode) {
  return Card(
    elevation: 5.0,
    child: Container(
      child: Column(
        children: [
          Container(
            color: Colors.primaries[_random.nextInt(Colors.primaries.length)]
                [_random.nextInt(9) * 100],
            child: Container(
              margin: EdgeInsets.all(8),
              child: Center(
                child: Image.network(APIEndpointConstants.BASE_URL +
                    '/Document/GetImageMongo?id=' +
                    templateImageCode),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            templateName,
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
        ],
      ),
    ),
  );
}

Widget buildRear(String templateName) {
  Color cardBackground =
      Colors.primaries[_random.nextInt(Colors.primaries.length)]
          [_random.nextInt(7) * 100];
  Color textColor = cardBackground != null
      ? cardBackground.computeLuminance() > 0.5
          ? Colors.black
          : Colors.white
      : Colors.black;
  return Card(
    elevation: 5.0,
    child: Container(
      color: cardBackground,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: Container(
                margin: EdgeInsets.all(8),
                alignment: Alignment.center,
                child: Text(
                  templateName,
                  style: TextStyle(color: textColor),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Create",
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  )),
            ),
          ],
        ),
      ),
    ),
  );
}
