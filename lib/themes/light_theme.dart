import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LightTheme {
  // static const Color _PRIMARY_COLOR = Colors.blue;
  static const Color _PRIMARY_COLOR = Color.fromRGBO(0, 51, 102, 1);

  static const Color _PRIMARY_LIGHT_COLOR = Colors.lightBlueAccent;
  static const Color _SECONDARY_LIGHT_COLOR = Color(0xFFFFECDF);

  static const Color _SECONDARY_COLOR = Color(0xFF979797);

  static const Color _TEXT_COLOR = Color(0xFF757575);

  // static const _PRIMARY_GRADIENT_COLOR = LinearGradient(
  //   begin: Alignment.topLeft,
  //   end: Alignment.bottomRight,
  //   colors: [
  //     Color(0xFFFFA53E),
  //     Color(0xFFFF7643),
  //   ],
  // );

  ThemeData lightThemeData() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: _lightAppbarTheme(),
      fontFamily: "Muli",
      textTheme: _lightTextTheme(),
      // inputDecorationTheme: _inputDecorationTheme(),

      // theme colors:
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      primaryColor: _PRIMARY_COLOR,
      primaryColorLight: _PRIMARY_LIGHT_COLOR,
      // accentColor: _SECONDARY_COLOR,
      canvasColor: _SECONDARY_COLOR,

      // checkbox color theme:
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(Colors.white),
        fillColor: MaterialStateProperty.all(_PRIMARY_COLOR),
      ),

      // dialog color theme:
      dialogTheme: DialogTheme(
        backgroundColor: _SECONDARY_LIGHT_COLOR,
        // elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        titleTextStyle: TextStyle(
            fontSize: 16.sp, fontWeight: FontWeight.w400, color: _TEXT_COLOR),
        contentTextStyle: TextStyle(
            fontSize: 12.sp, fontWeight: FontWeight.w400, color: _TEXT_COLOR),
      ),
    );
  }

  InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 48.0,
        vertical: 16.0,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.0),
        borderSide: BorderSide(
          color: _TEXT_COLOR,
        ),
        gapPadding: 16,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.0),
        borderSide: BorderSide(
          color: _PRIMARY_COLOR,
        ),
        gapPadding: 16,
      ),
    );
  }

  TextTheme _lightTextTheme() {
    return TextTheme(
      bodyText1: TextStyle(
        color: _TEXT_COLOR,
      ),
      bodyText2: TextStyle(
        color: _TEXT_COLOR,
      ),
    );
  }

  AppBarTheme _lightAppbarTheme() {
    return AppBarTheme(
      foregroundColor: _TEXT_COLOR,
      elevation: 0,
      backgroundColor: Colors.transparent,
      // brightness: Brightness.light,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      // textTheme: TextTheme(
      //   headline6: TextStyle(
      //     color: _PRIMARY_COLOR,
      //     fontSize: 18.0,
      //   ),
      // ),
    );
  }
}
