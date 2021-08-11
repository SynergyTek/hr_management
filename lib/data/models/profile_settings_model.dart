import 'dart:convert';

class ProfileSettingsModel {
  final bool isDarkModeEnabled;

  const ProfileSettingsModel({
    this.isDarkModeEnabled,
  });

  ProfileSettingsModel copyWith({
    bool isDarkModeEnabled,
  }) {
    return ProfileSettingsModel(
      isDarkModeEnabled: isDarkModeEnabled ?? this.isDarkModeEnabled,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isDarkModeEnabled': isDarkModeEnabled,
    };
  }

  factory ProfileSettingsModel.fromMap(Map<String, dynamic> map) {
    return ProfileSettingsModel(
      isDarkModeEnabled: map['isDarkModeEnabled'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileSettingsModel.fromJson(String source) =>
      ProfileSettingsModel.fromMap(
        json.decode(source),
      );
}
