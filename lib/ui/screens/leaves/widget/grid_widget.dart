import 'package:flutter/material.dart';
import 'package:hr_management/constants/api_endpoints.dart';
import 'package:hr_management/routes/route_constants.dart';
import 'package:hr_management/routes/screen_arguments.dart';

Widget buildFront(
    {String templateName,
    String templateImageCode,
    String colorCode,
    context}) {
  return Card(
    elevation: 5.0,
    child: Column(
      children: [
        Expanded(
          flex: 8,
          child: Container(
            color: hexToColor(colorCode),
            child: Center(
              child: templateImageCode != null
                  ? Image.network(
                      APIEndpointConstants.BASE_URL +
                          '/common/query/GetFile?fileId=' +
                          templateImageCode,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace stackTrace) {
                        return Icon(
                          Icons.image,
                          size: MediaQuery.of(context).size.width * 0.28,
                          color: Colors.grey[400],
                        );
                      },
                    )
                  : Icon(
                      Icons.image,
                      size: MediaQuery.of(context).size.width * 0.28,
                      color: Colors.grey[400],
                    ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
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

Widget buildRear(
    {String templateCode,
    String templateName,
    String colorCode,
    BuildContext context}) {
  Color cardBackground = hexToColor(colorCode);
  Color textColor = cardBackground != null
      ? cardBackground.computeLuminance() > 0.5
          ? Colors.black
          : Colors.white
      : Colors.black;
  return Card(
    elevation: 5.0,
    color: hexToColor(colorCode),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
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
        Container(
          margin: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {
                // Navigator.pushReplacementNamed(
                Navigator.pushNamed(
                  context,
                  // HOME_ROUTE,
                  CREATE_SERVICE_ROUTE,
                  arguments: ScreenArguments(
                    arg1: templateCode,
                  ),
                );
              },
              child: Text(
                "Create",
                textAlign: TextAlign.center,
                maxLines: 1,
              )),
        ),
      ],
    ),
  );
}

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
