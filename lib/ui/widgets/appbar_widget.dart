import 'package:flutter/material.dart';
import 'package:hr_management/themes/light_theme.dart';

class AppbarWidget extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const AppbarWidget({
    required this.title,
    this.actions,
    this.bottom,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  _AppbarWidgetState createState() => _AppbarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(bottom != null ? 84.0 : 56.0);
}

class _AppbarWidgetState extends State<AppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: widget.foregroundColor,
      ),
      foregroundColor: widget.foregroundColor,
      backgroundColor: widget.backgroundColor,
      elevation: 0,
      bottom: widget.bottom,
      title: Text(widget.title!,
          style: TextStyle(color: LightTheme().lightThemeData().primaryColor)),
      actions: []..addAll(widget.actions ?? []),
    );
  }
}
