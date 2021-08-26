import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';

import '../../../data/models/profile_settings_model.dart';
import '../../../logic/blocs/profile_settings_bloc/profile_settings_bloc.dart';
import '../../../themes/theme_config.dart';
import 'widgets/profile_settings_list_tile.dart';

class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            16.0,
          ),
          topRight: Radius.circular(
            16.0,
          ),
        ),
      ),
      padding: DEFAULT_LARGE_PADDING,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _profileSettingsTitle(context),
          _generateProfileSettingsListItems(),
        ],
      ),
    );
  }

  Widget _profileSettingsTitle(BuildContext context) => Center(
        child: Text(
          "Profile Settings",
          style: TextStyle(
            color: Theme.of(context).textHeadingColor,
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
          ),
        ),
      );

  Widget _generateProfileSettingsListItems() {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        BlocBuilder<UserModelBloc, UserModelState>(
          builder: (context, state) {
            print(state.userModel.toString());

            return Container(
              padding: DEFAULT_LARGE_VERTICAL_PADDING,
              child: Card(
                child: ListTile(
                  tileColor: Theme.of(context).textHeadingColor,
                  title: Text(
                    state?.userModel?.jobTitle ?? '-',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    state?.userModel?.email ?? '-',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 24,
                    child: Icon(
                      Icons.person,
                      color: Theme.of(context).textHeadingColor,
                    ),
                  ),
                ),
              ),
            );
          },
        ),

        // For the Dark Mode List Tile.
        // BlocBuilder<ProfileSettingsBloc, ProfileSettingsState>(
        //   builder: (context, state) {
        //     return ProfileSettingsListTile(
        //       title: "Dark Mode",
        //       isCheckBoxSelected:
        //           state?.profileSettingsModel?.isDarkModeEnabled ?? false,
        //       profileSettingsModel: ProfileSettingsModel(
        //         isDarkModeEnabled: !state.profileSettingsModel.isDarkModeEnabled,
        //       ),
        //     );
        //   },
        // ),
      ],
    );
  }
}
