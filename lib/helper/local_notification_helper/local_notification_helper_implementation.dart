part of 'local_notification_helper.dart';

/// Implementation of the Helper class.
class LocalNotificationHelper extends AbstractLocalNotificationHelper {
  // Global Variables:
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final StreamController<LocalNotificationModel>
      didReceiveLocalNotificationStream =
      StreamController<LocalNotificationModel>.broadcast();

  /// Android: android >> app >> src >> main >> res >> drawable >> logo.png
  /// @TODO: set the default app logo.
  // final defaultAppLogoIconPath = NOTIFICATION_ICON;

  @override
  initialiseLocalNotifications({
    String? iconPathForNotification,
    Function? handleLocalNotificationOnTap,
    // GlobalKey<NavigatorState> navigatorKey,
  }) async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification:
          (int id, String? title, String? body, String? payload) async {
        didReceiveLocalNotificationStream.add(
          LocalNotificationModel(
            notificationChannel: id,
            notificationTitle: title ?? '',
            notificationDescription: body ?? '',
            notificationPayload: payload,
          ),
        );
      },
    );

    final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  @override
  triggerLocalNotification(
      LocalNotificationModel localNotificationModel) async {
    const androidNotificationDetails = AndroidNotificationDetails(
      'notification_channel',
      'notification_channel',
      importance: Importance.max,
      priority: Priority.high,
      ongoing: false,
      autoCancel: false,
      styleInformation: BigTextStyleInformation(''),
      // sound:
      // largeIcon:
    );

    const notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      localNotificationModel.notificationChannel,
      localNotificationModel.notificationTitle,
      localNotificationModel.notificationDescription,
      notificationDetails,
      // Optional param payload.
      // This is used to redirect to some specific screen when onPressed is triggered.
      payload: localNotificationModel.notificationPayload ?? '',
    );
  }

  @override
  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
