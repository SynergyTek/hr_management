import 'package:geolocator/geolocator.dart';

class WorkmanagerLocationDataHelper {
  static Future<void> getLocationData() async {
    print("[${DateTime.now()}] Executing getLocationData background task.");

    Position position = await Geolocator.getCurrentPosition();
    print(
      "[${DateTime.now()}] LocationData: (${position.latitude}, ${position.longitude})",
    );
  }
}
