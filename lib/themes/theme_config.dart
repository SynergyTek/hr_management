import 'package:flutter/material.dart';

const _paddingValue = 8.0;
const EdgeInsets DEFAULT_PADDING = EdgeInsets.all(_paddingValue);
const EdgeInsets DEFAULT_LARGE_PADDING = EdgeInsets.all(_paddingValue * 2);
const EdgeInsets DEFAULT_HORIZONTAL_PADDING =
    EdgeInsets.symmetric(horizontal: _paddingValue);
const EdgeInsets DEFAULT_LARGE_HORIZONTAL_PADDING =
    EdgeInsets.symmetric(horizontal: _paddingValue * 2);
const EdgeInsets DEFAULT_VERTICAL_PADDING =
    EdgeInsets.symmetric(vertical: _paddingValue);
const EdgeInsets DEFAULT_LARGE_VERTICAL_PADDING =
    EdgeInsets.symmetric(vertical: _paddingValue * 2);

const ANIMATION_DURATION = Duration(
  milliseconds: 200,
);

extension ThemeExtras on ThemeData {
  Color get textHeadingColor => Color.fromRGBO(0, 51, 102, 1);
  // Color get textHeadingColor => Color(0xFFFF7643);
  Color get invertedColor => this.brightness == Brightness.light
      ? Color.fromARGB(255, 88, 82, 82)
      : Colors.white;

  Color get notInvertedColor => this.brightness == Brightness.light
      ? Colors.white
      : Color(0xFF1A2127); // 0xFF757575 ???
}
