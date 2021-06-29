import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hr_management/constants/api_endpoints.dart';
import 'package:hr_management/routes/route_constants.dart';

final _random = Random();
Widget buildFront(String templateName, String templateImageCode, context) {
  return Card(
    elevation: 5.0,
    child: Column(
      children: [
        Expanded(
          flex: 8,
          child: Container(
            // color: Color(0xFFE5083F),
            color: Colors.primaries[_random.nextInt(Colors.primaries.length)]
                [_random.nextInt(9) * 100],
            child: Center(
              child: templateImageCode == null
                  ? Icon(
                      Icons.image,
                      size: MediaQuery.of(context).size.width * 0.28,
                      color: Colors.grey[400],
                    )
                  : Image.network(
                      APIEndpointConstants.BASE_URL +
                          '/Document/GetImageMongo?id=' +
                          templateImageCode,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace stackTrace) {
                        return Icon(
                          Icons.image,
                          size: MediaQuery.of(context).size.width * 0.28,
                          color: Colors.grey[400],
                        );
                      },
                    ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Center(
            child: Text(
              templateName,
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildRear(String templateName, BuildContext context) {
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
    color: cardBackground,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(8),
            alignment: Alignment.center,
            child: Text(
              templateName,
              style: TextStyle(color: textColor),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            margin: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  // Navigator.pushReplacementNamed(
                  Navigator.pushNamed(
                    context,
                    // HOME_ROUTE,
                    CREATE_SERVICE_ROUTE,
                  );
                },
                child: Text(
                  "Create",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                )),
          ),
        ),
      ],
    ),
  );
}
