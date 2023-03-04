// To parse this JSON data, do
//
//     final userGeolocationModel = userGeolocationModelFromJson(jsonString);

import 'dart:convert';

List<UserGeolocationModel> userGeolocationModelFromJson(String str) =>
    List<UserGeolocationModel>.from(
        json.decode(str).map((x) => UserGeolocationModel.fromJson(x)));

String userGeolocationModelToJson(List<UserGeolocationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserGeolocationModel {
  UserGeolocationModel({
    this.name,
    this.latitude,
    this.longtitude,
    this.meter,
  });

  String? name;
  double? latitude;
  double? longtitude;
  int? meter;

  factory UserGeolocationModel.fromJson(Map<String, dynamic> json) =>
      UserGeolocationModel(
        name: json["Name"],
        latitude: json["Latitude"]?.toDouble(),
        longtitude: json["Longtitude"]?.toDouble(),
        meter: json["Meter"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Latitude": latitude,
        "Longtitude": longtitude,
        "Meter": meter,
      };
}
