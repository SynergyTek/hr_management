// import 'package:flutter/material.dart';
// import 'package:workmanager/workmanager.dart';

// import 'workmanager_location_data_helper.dart';

// callbackDispatcher() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   Workmanager().executeTask((taskName, inputData) async {
//     switch (taskName) {
//       case Workmanager.iOSBackgroundTask:
//       case "getLocationDataBackgroundTask":
//         await WorkmanagerLocationDataHelper.getLocationData();
//         break;
//     }
//     return true;
//   });
// }

// class WorkmanagerHelper {
//   void registerGetLocationDataBackgroundPeriodicTask() {
//     print(
//         "[${DateTime.now()}] Scheduling task: Get Location Data in Background");

//     Workmanager().registerPeriodicTask(
//       "getLocationDataBackgroundTask",
//       "getLocationDataBackgroundTask",
//       tag: 'locationTask',
//       frequency: Duration(
//         minutes: 15,
//       ),
//       // TODO: Need to figure out the exact policy for this.
//       existingWorkPolicy: ExistingWorkPolicy.replace,
//     );
//   }

//   void cancelWorkManager() {
//     Workmanager().cancelByTag('locationTask');
//   }
// }
