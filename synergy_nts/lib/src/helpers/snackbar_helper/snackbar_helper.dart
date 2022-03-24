import 'package:flutter/material.dart';

displaySnackBar({
  String? text,
  Color? snackBarcolor,
  BuildContext? context,
  int? duration,
}) {
  return ScaffoldMessenger.of(context!).showSnackBar(
    SnackBar(
      content: Text(text!),
      duration: Duration(seconds: duration ?? 3),
      backgroundColor: snackBarcolor,
    ),
  );
}

timeOutSnackbar({
  BuildContext? context,
}) {
  return ScaffoldMessenger.of(context!).showSnackBar(
    const SnackBar(
      content: Text(
        'The Network connection is lost or weak. Please try again Later.',
      ),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.red,
    ),
  );
}

networkSnackbar({
  BuildContext? context,
}) {
  return ScaffoldMessenger.of(context!).showSnackBar(
    const SnackBar(
      content: Text(
        "No Internet Connection.Try Again Later.",
      ),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.red,
    ),
  );
}

errorSnackbar({
  BuildContext? context,
}) {
  return ScaffoldMessenger.of(context!).showSnackBar(
    const SnackBar(
      content: Text(
        "Something went Wrong. Please try again Later.",
      ),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.red,
    ),
  );
}
