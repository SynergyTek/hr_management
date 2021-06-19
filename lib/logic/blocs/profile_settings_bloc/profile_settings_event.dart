part of 'profile_settings_bloc.dart';

abstract class ProfileSettingsEvent extends Equatable {
  const ProfileSettingsEvent();

  @override
  List<Object> get props => [];
}

class ProfileSettingsChangeEvent extends ProfileSettingsEvent {
  final ProfileSettingsModel profileSettingsModel;

  ProfileSettingsChangeEvent({
    @required this.profileSettingsModel,
  });
}
