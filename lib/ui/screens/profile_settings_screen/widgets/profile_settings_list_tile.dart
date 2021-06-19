import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/profile_settings_model.dart';
import '../../../../logic/blocs/profile_settings_bloc/profile_settings_bloc.dart';

class ProfileSettingsListTile extends StatelessWidget {
  final String title;
  final bool isCheckBoxSelected;
  final ProfileSettingsModel profileSettingsModel;

  const ProfileSettingsListTile({
    @required this.title,
    @required this.isCheckBoxSelected,
    @required this.profileSettingsModel,
  }) : assert(isCheckBoxSelected != null && profileSettingsModel != null);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        title ?? "",
      ),
      value: isCheckBoxSelected,
      onChanged: (bool newValue) =>
          BlocProvider.of<ProfileSettingsBloc>(context).add(
        ProfileSettingsChangeEvent(
          profileSettingsModel: profileSettingsModel,
        ),
      ),
    );
  }
}
