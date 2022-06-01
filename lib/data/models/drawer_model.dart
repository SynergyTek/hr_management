import 'package:flutter/material.dart';

class NavDrawerModel {
  NavDrawerModel(
      {required this.title,
      this.icon,
      required this.route,
      required this.pageName,
      this.isExpanded});

  String title;
  IconData? icon;
  String route;
  String pageName;
  bool? isExpanded;
}

class ExapnsionTileModel {
  ExapnsionTileModel(
      {required this.title, required this.childList, required this.isExpanded});

  String title;
  bool isExpanded;
  List<NavDrawerModel> childList;
}
