class EmployeeTrackingViewModel {
  String? userId;
  double? latitude;
  double? longitude;
  String? trackingDate;

  EmployeeTrackingViewModel({
    this.userId,
    this.latitude,
    this.longitude,
    this.trackingDate,
  });

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "latitude": latitude,
        "longitude": longitude,
        "trackingDate": trackingDate,
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
