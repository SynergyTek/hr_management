import 'package:flutter/material.dart';

class NavDrawerModel {
  NavDrawerModel(
      {required this.title,
      this.leadingIcon,
      this.trailingIcon,
      //required this.route,
      this.pageName,
      this.isExpanded});

  String title;
  IconData? leadingIcon;
  IconData? trailingIcon;
  //String route;
  final String? pageName;
  bool? isExpanded;
}

class ExapnsionTileModel {
  ExapnsionTileModel(
      {required this.title, required this.childList, required this.isExpanded});

  String title;
  bool isExpanded;
  List<NavDrawerModel> childList;
}
