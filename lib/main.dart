import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:location/location.dart' as loc;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
    as bg;
import 'ui/screens/init_screen/init_screen.dart';

/// Receive events from BackgroundGeolocation in Headless state.
@pragma('vm:entry-point')
void backgroundGeolocationHeadlessTask(bg.HeadlessEvent headlessEvent) async {
  print('📬 --> $headlessEvent');

  switch (headlessEvent.name) {
    case bg.Event.BOOT:
      bg.State state = await bg.BackgroundGeolocation.state;
      print("📬 didDeviceReboot: ${state.didDeviceReboot}");
      break;
    case bg.Event.LOCATION:
      bg.Location location = headlessEvent.event;
      print(location);
      break;
    case bg.Event.MOTIONCHANGE:
      bg.Location location = headlessEvent.event;
      print(location);
      break;
    case bg.Event.GEOFENCE:
      bg.GeofenceEvent geofenceEvent = headlessEvent.event;
      print(geofenceEvent);
      break;
    case bg.Event.GEOFENCESCHANGE:
      bg.GeofencesChangeEvent event = headlessEvent.event;
      print(event);
      break;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialising the Hydrated Bloc storage.
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  // Status bar config
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  );

  loc.PermissionStatus _permissionGranted =
      await loc.Location().hasPermission();
  if (_permissionGranted == loc.PermissionStatus.denied) {
    _permissionGranted = await loc.Location().requestPermission();
  }

  await FlutterDownloader.initialize(debug: false);

  await Permission.camera.request();
  await Permission.microphone.request();

  HydratedBlocOverrides.runZoned(
    () => runApp(InitScreen()),
    storage: storage,
  );

  /// Register BackgroundGeolocation headless-task.
  bg.BackgroundGeolocation.registerHeadlessTask(
      backgroundGeolocationHeadlessTask);
}
