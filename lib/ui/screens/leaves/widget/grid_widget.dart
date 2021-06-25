import 'package:flutter/material.dart';

Widget buildFront(String templateName) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListTile(
      title: Container(
        decoration: BoxDecoration(
            color: Colors.white, border: Border.all(color: Colors.black)),
        child: Center(
          child: Icon(
            Icons.access_alarms_rounded,
            size: 50,
          ),
        ),
      ),
      subtitle: Container(
          height: 30,
          decoration: BoxDecoration(
              color: Colors.blue, border: Border.all(color: Colors.black)),
          child: Center(child: Text(templateName))),
    ),
  );
}

Widget buildRear(String templateName) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListTile(
      title: Container(
        decoration: BoxDecoration(
            color: Colors.white, border: Border.all(color: Colors.black)),
        child: Center(
          child: Text(templateName),
        ),
      ),
      subtitle: Container(
        height: 30,
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Create'),
        ),
      ),
    ),
  );
}
