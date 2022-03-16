// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const _paddingValue = 8.0;
const EdgeInsets DEFAULT_PADDING = EdgeInsets.all(_paddingValue);
const EdgeInsets DEFAULT_LARGE_PADDING = EdgeInsets.all(_paddingValue * 2);
const EdgeInsets DEFAULT_SMALL_PADDING = EdgeInsets.all(_paddingValue / 2);
const EdgeInsets DEFAULT_HORIZONTAL_PADDING =
    EdgeInsets.symmetric(horizontal: _paddingValue);
const EdgeInsets DEFAULT_LARGE_HORIZONTAL_PADDING =
    EdgeInsets.symmetric(horizontal: _paddingValue * 2);
const EdgeInsets DEFAULT_VERTICAL_PADDING =
    EdgeInsets.symmetric(vertical: _paddingValue);
const EdgeInsets DEFAULT_LARGE_VERTICAL_PADDING =
    EdgeInsets.symmetric(vertical: _paddingValue * 2);

extension ThemeExtras on ThemeData {
  Color get textHeadingColor => const Color(0xFFFF7643);
  Color get invertedColor =>
      brightness == Brightness.light ? const Color(0xFF757575) : Colors.white;
}

Map<String, Color> colorMap = {};
