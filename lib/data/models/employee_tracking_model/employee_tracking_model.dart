class EmployeeTrackingViewModel {
  String? userId;
  double? latitude;
  double? longitude;
  String? trackingTime;

  EmployeeTrackingViewModel({
    this.userId,
    this.latitude,
    this.longitude,
    this.trackingTime,
  });

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "latitude": latitude,
        "longitude": longitude,
        "trackingTime": trackingTime,
      };
}

// class EmployeeTrackingListModel {
//   List<EmployeeTrackingViewModel>? list;

//   EmployeeTrackingListModel({
//     required this.list,
//   });

//   Map<String, dynamic> toJson() => {
//         "list": List<dynamic>.from(list!.map((x) => x.toJson())),
//       };
// }
