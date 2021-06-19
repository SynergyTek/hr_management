import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../data/models/profile_settings_model.dart';

part 'profile_settings_event.dart';
part 'profile_settings_state.dart';

class ProfileSettingsBloc
    extends Bloc<ProfileSettingsEvent, ProfileSettingsState>
    with HydratedMixin {
  ProfileSettingsBloc()
      : super(
          ProfileSettingsUserDefinedState(
            profileSettingsModel: ProfileSettingsModel(
              isDarkModeEnabled: false,
            ),
          ),
        ) {
    hydrate();
  }

  @override
  Stream<ProfileSettingsState> mapEventToState(
    ProfileSettingsEvent event,
  ) async* {
    if (event is ProfileSettingsChangeEvent) {
      yield ProfileSettingsUserDefinedState(
        profileSettingsModel: state.profileSettingsModel.copyWith(
          isDarkModeEnabled:
              event?.profileSettingsModel?.isDarkModeEnabled ?? false,
        ),
      );
    }
    // TODO: Need to implement Reset Profile Settings event.
    // Reset Settings to default event.
    // else {
    //   yield ProfileSettingsUserDefinedState(
    //     profileSettingsModel: state.profileSettingsModel.copyWith(
    //       emailNotifications: false,
    //       pushNotifications: false,
    //     ),
    //   );
    // }
  }

  @override
  ProfileSettingsState fromJson(Map<String, dynamic> json) {
    return ProfileSettingsUserDefinedState(
      profileSettingsModel: ProfileSettingsModel.fromMap(json),
    );
  }

  @override
  Map<String, dynamic> toJson(ProfileSettingsState state) {
    return state.profileSettingsModel.toMap();
  }
}
