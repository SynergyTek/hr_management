import 'package:flutter/material.dart';

import '../screens/profile_settings_screen/profile_settings_screen.dart';

class ProfileSettingsIconButton extends StatelessWidget {
  const ProfileSettingsIconButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.settings),
      onPressed: () => _handleOnPressedForIconButton(context),
    );
  }

  _handleOnPressedForIconButton(BuildContext context) {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return ProfileSettingsScreen();
      },
    );
  }
}
