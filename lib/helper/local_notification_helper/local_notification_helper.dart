import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'local_notification_model.dart';

part 'local_notification_helper_implementation.dart';

/* Setup/Initialisation steps:
  * 1. Add the dependency to pubspec.yaml: flutter_local_notifications: ^4.0.1
  * 2. Setup the native resources such as icons etc.
  * 3. Enable WidgetsFlutterBinding.ensureInitialised() is enbaled in main.dart. As this is a requirement for the plugin.
  * 4. Ask for the required permissions
  * 5. @Kanishk TODO: Do the iOS Settings (ios >> runner >> appdelegate.swift...)
  * 6. Call the initialiseLocalNotifications at the main method of dart code.
  * 7. Define the constants
  * 8. Call the trigger notifications method to trigger notifications.
  */

/// A helper class to trigger local notifications
abstract class AbstractLocalNotificationHelper {
  /// Initialise the flutter local notifications and
  /// asking for all the required permissions.
  initialiseLocalNotifications({
    String iconPathForNotification,
    Function handleLocalNotificationOnTap,
    // GlobalKey<NavigatorState> navigatorKey,
  });

  /// Helper function to trigger notifications
  triggerLocalNotification(LocalNotificationModel localNotificationModel);

  /// Helper function to cancel/remove existing notifications from the stack.
  cancelAllNotifications();
}
