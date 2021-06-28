import 'package:flutter/material.dart';

class DarkTheme {
  static const Color _PRIMARY_COLOR = Color(0xFF1A2127);
  static const Color _PRIMARY_LIGHT_COLOR = Color(0xFFFFECDF);
  static const Color _SECONDARY_COLOR = Color(0xFFFF7643);
  static const Color _TEXT_COLOR = Colors.white;

  // static const _PRIMARY_GRADIENT_COLOR = LinearGradient(
  //   begin: Alignment.topLeft,
  //   end: Alignment.bottomRight,
  //   colors: [
  //     Color(0xFFFFA53E),
  //     Color(0xFFFF7643),
  //   ],
  // );

  ThemeData darkThemeData() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: _darkAppbarTheme(),
      fontFamily: "Muli",
      textTheme: _darkTextTheme(),
      // inputDecorationTheme: _inputDecorationTheme(),

      // theme colors:
      scaffoldBackgroundColor: _PRIMARY_COLOR,
      backgroundColor: _PRIMARY_COLOR,
      brightness: Brightness.dark,
      primaryColor: _PRIMARY_COLOR,
      primaryColorLight: _PRIMARY_LIGHT_COLOR,
      accentColor: _SECONDARY_COLOR,

      // checkbox color theme:
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(Colors.white),
        fillColor: MaterialStateProperty.all(_SECONDARY_COLOR),
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

  TextTheme _darkTextTheme() {
    return TextTheme(
      bodyText1: TextStyle(
        color: _TEXT_COLOR,
      ),
      bodyText2: TextStyle(
        color: _TEXT_COLOR,
      ),
    );
  }

  AppBarTheme _darkAppbarTheme() {
    return AppBarTheme(
      foregroundColor: _TEXT_COLOR,
      elevation: 0,
      backgroundColor: _PRIMARY_COLOR,
      brightness: Brightness.dark,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: _SECONDARY_COLOR,
          fontSize: 18.0,
        ),
      ),
    );
  }
}
