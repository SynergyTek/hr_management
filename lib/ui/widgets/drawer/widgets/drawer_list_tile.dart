import 'package:flutter/material.dart';

class DrawerListTileWidget extends StatelessWidget {
  final String title;
  final Function listTileOnTap;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;

  const DrawerListTileWidget({
    required this.title,
    required this.listTileOnTap,
    this.subtitle,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: trailing,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black87,
        ),
      ),
      onTap: () => listTileOnTap(),
    );
  }
}
