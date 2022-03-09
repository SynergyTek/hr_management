import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:location/location.dart' as loc;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'ui/screens/init_screen/init_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialising the Hydrated Bloc storage.
  HydratedBloc.storage = await HydratedStorage.build(
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

  runApp(InitScreen());
}
