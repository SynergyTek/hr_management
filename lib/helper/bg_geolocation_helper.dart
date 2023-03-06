import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
    as bg;

import '../data/models/user_location_model.dart';
import '../data/repositories/attendance_view_repository/attendance_view_repository.dart';

class BgGeolocationHelper {
  final String? userId;
  BgGeolocationHelper({this.userId});

  // Initialize Bg Geolocator
  initializeBgGeolocation() {
    bg.BackgroundGeolocation.onLocation(_onLocation);
    bg.BackgroundGeolocation.onMotionChange(_onMotionChange);
    bg.BackgroundGeolocation.onActivityChange(_onActivityChange);
    bg.BackgroundGeolocation.onProviderChange(_onProviderChange);
    bg.BackgroundGeolocation.onConnectivityChange(_onConnectivityChange);
    bg.BackgroundGeolocation.onGeofence(_onGeofence);
    bg.BackgroundGeolocation.onHttp(_onHttp);

    // 2.  Configure the plugin
    bg.BackgroundGeolocation.ready(bg.Config(
            desiredAccuracy: bg.Config.DESIRED_ACCURACY_NAVIGATION,
            autoSync: true,
            distanceFilter: 10.0,
            stopOnTerminate: false,
            stopTimeout: 5,
            startOnBoot: true,
            debug: true,
            logLevel: bg.Config.LOG_LEVEL_VERBOSE,
            heartbeatInterval: 60,
            backgroundPermissionRationale: bg.PermissionRationale(
                title:
                    "Allow {applicationName} to access this device's location even when the app is closed or not in use.",
                message:
                    "This app collects location data to enable recording your trips to work and calculate distance-travelled.",
                positiveAction: 'Change to "{backgroundPermissionOptionLabel}"',
                negativeAction: 'Cancel'),
            url:
                'https://webapidev.aitalkx.com/taa/attendance/InsertEmployeeTrackingBG',
            params: {
              "userId": '1721be46-402a-412a-b3c9-e176f32e3536',
            },
            reset: true))
        .then((bg.State state) {
      if (state.schedule!.isNotEmpty) {
        bg.BackgroundGeolocation.startSchedule();
      }
    });
  }

  // background location flutter changes

  void _onLocation(bg.Location location) {
    print('[location] - $location');
    apicall(lat: location.coords.latitude, long: location.coords.longitude);
  }

  void _onMotionChange(bg.Location location) {
    print('[motionchange] - $location');
    apicall(lat: location.coords.latitude, long: location.coords.longitude);
  }

  void _onActivityChange(bg.ActivityChangeEvent event) {
    print('[activitychange] - $event');
  }

  void _onProviderChange(bg.ProviderChangeEvent event) {
    print('$event');
  }

  void _onConnectivityChange(bg.ConnectivityChangeEvent event) {
    print('$event.');
  }

  void _onHttp(bg.HttpEvent event) async {
    print('[${bg.Event.HTTP}] - $event');
  }

  void _onGeofence(bg.GeofenceEvent event) async {
    apicall(
        lat: event.location.coords.latitude,
        long: event.location.coords.longitude);
  }

  // Start Background Geolocator----------------------------------------------------------------------
  startBgGeoLocator() {
    bg.BackgroundGeolocation.start();
    bg.BackgroundGeolocation.changePace(true);
  }

  // Stop Background Geolocator
  stopBgGeolocator() {
    bg.BackgroundGeolocation.changePace(false);
    bg.BackgroundGeolocation.stop();
  }

  Future<void> apicall({required double lat, required long}) async {
    // AttendanceViewRepository repo = AttendanceViewRepository();
    // List<UserLocation> list = [
    //   UserLocation(
    //       userId: this.userId,
    //       trackingDate: DateTime.now().toIso8601String(),
    //       latitude: lat,
    //       longitude: long)
    // ];
    // repo.postInsertEmployeeTracking(data: list);
  }
}
