// import 'package:geolocator/geolocator.dart';
// import 'package:latlong2/latlong.dart';

// import '../capture_user_location.dart';

// class WorkmanagerLocationDataHelper {
//   static Future<void> getLocationData() async {
//     print("[${DateTime.now()}] Executing getLocationData background task.");

//     Position position = await Geolocator.getCurrentPosition();
//     await CaptureUserLocation()
//         .captureLocationFn(LatLng(position.latitude, position.longitude));
//     print(
//       "[${DateTime.now()}] LocationData: (${position.latitude}, ${position.longitude})",
//     );
//   }
// }
