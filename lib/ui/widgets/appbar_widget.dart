import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/data/models/login_models/login_request_model.dart';
import 'package:hr_management/data/models/login_models/login_response_model.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:hr_management/routes/route_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'profile_settings_icon_button.dart';

// TODO: Implement drawer and other stuff also here.

class AppbarWidget extends StatefulWidget with PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final PreferredSizeWidget bottom;
  final Color backgroundColor;
  final Color foregroundColor;

  const AppbarWidget({
    @required this.title,
    this.actions,
    this.bottom,
    this.backgroundColor,
    this.foregroundColor,
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
      iconTheme: IconThemeData(
        color: widget.foregroundColor,
      ),
      foregroundColor: widget.foregroundColor,
      backgroundColor: widget.backgroundColor,
      elevation: 0,
      bottom: widget.bottom,
      actions: []
        ..addAll(widget?.actions ?? [])
        ..add(ProfileSettingsIconButton())
        ..add(
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              // SharedPreferences prefs = await SharedPreferences.getInstance();
              // prefs.clear();

              BlocProvider.of<UserModelBloc>(context).add(
                UserModelChangeEvent(
                  userModel: null,
                ),
              );

              Navigator.pushNamedAndRemoveUntil(
                context,
                LOGIN_ROUTE,
                ModalRoute.withName('/login'),
              );
            },
          ),
        ),
      // actions: [
      //   ProfileSettingsIconButton(),
      // ]..addAll(widget?.actions ?? []),
      title: Text(widget.title),
    );
  }
}
