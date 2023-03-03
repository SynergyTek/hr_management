class UserLocation {
  int? id;
  String? time;
  double? latitude;
  double? longitude;

  UserLocation({this.id, this.time, this.latitude, this.longitude});

  factory UserLocation.fromJson(Map<String, dynamic> json) =>
      _$UserLocationFromJson(json);
  Map<String, dynamic> toJson() => _$UserLocationToJson(this);
}

UserLocation _$UserLocationFromJson(Map<String, dynamic> json) {
  return UserLocation(
    id: json['id'],
    time: json['time'],
    latitude: json["latitude"],
    longitude: json["longitude"],
  );
}

Map<String, dynamic> _$UserLocationToJson(UserLocation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'time': instance.time,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
