// // ignore: import_of_legacy_library_into_null_safe
// import 'package:hr_management/data/models/user_location_model.dart';
// import 'package:hr_management/helper/location_database_provider.dart';
// import 'package:latlong2/latlong.dart';

// import 'package:location/location.dart';

// class CaptureUserLocation {
//   Location location = new Location();
//   bool notificationSend = false;
//   final LocationDatabaseProvider _databaseService = LocationDatabaseProvider();

//   captureLocationFn(LatLng _currentLocation) async {
//     await _databaseService.addLocationToDatabase(UserLocation(
//         time: DateTime.now().toIso8601String(),
//         latitude: _currentLocation.latitude,
//         longitude: _currentLocation.longitude));
//   }
// }
