import 'package:flutter/material.dart';
import '../../routes/route_constants.dart';

import 'profile_settings_icon_button.dart';

// TODO: Implement drawer and other stuff also here.

class AppbarWidget extends StatefulWidget with PreferredSizeWidget {
  final String title;
  final PreferredSizeWidget bottom;
  final List<Widget> actions;

  const AppbarWidget({
    @required this.title,
    this.actions,
    this.bottom,
  });

  @override
  _AppbarWidgetState createState() => _AppbarWidgetState();

  // TODO: need to use Sizer for this.
  @override
  Size get preferredSize => Size.fromHeight(bottom != null ? 84.0 : 56.0);
}

class _AppbarWidgetState extends State<AppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      bottom: widget.bottom,
      actions: [
        ProfileSettingsIconButton(),
      ]..addAll(widget?.actions ?? []),
      title: Text(widget.title),
    );
  }
}
