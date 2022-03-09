import 'package:flutter/material.dart';

displaySnackBar({
  required BuildContext context,
  required String text,
  Color? snackBarcolor,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
    duration: Duration(seconds: 3),
    backgroundColor: snackBarcolor,
  ));
}

timeOutSnackbar({required BuildContext context}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content:
        Text('The Network connection is lost or weak. Please try again Later.'),
    duration: Duration(seconds: 3),
    backgroundColor: Colors.red,
  ));
}

networkSnackbar({required BuildContext context}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text("No Internet Connection.Try Again Later."),
    duration: Duration(seconds: 3),
    backgroundColor: Colors.red,
  ));
}

errorSnackbar({required BuildContext context}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text("Something went Wrong. Please try again Later."),
    duration: Duration(seconds: 3),
    backgroundColor: Colors.red,
  ));
}
