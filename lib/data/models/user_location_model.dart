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


//     class UserLocation {
//   int? id;
//   String? time;
//   double? latitude;
//   double? longitude;

//   UserLocation({this.id, this.time, this.latitude, this.longitude});

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'time': time,
//       'latitude': latitude,
//       'longitude': longitude
//     };
//   }

//   factory UserLocation.fromMap(Map<String, dynamic> map) {
//     return UserLocation(
//       id: map['id']?.toInt() ?? 0,
//       time: map['time'] ?? '',
//       latitude: map['latitude'] ?? '',
//       longitude: map['longitude'] ?? '',
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory UserLocation.fromJson(String source) =>
//       UserLocation.fromMap(json.decode(source));

//   // Implement toString to make it easier to see information about
//   // each breed when using the print statement.
//   @override
//   String toString() =>
//       'locations(id: $id, time: $time, latitude: $latitude, longitude: $longitude)';
// }
