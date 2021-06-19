import 'package:flutter/material.dart';

import 'dark_theme.dart';
import 'light_theme.dart';

class AppTheme {
  static ThemeData get lightTheme => LightTheme().lightThemeData();
  static ThemeData get darkTheme => DarkTheme().darkThemeData();
}

