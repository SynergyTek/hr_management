class LocalNotificationModel {
  final int notificationChannel;
  final String notificationTitle;
  final String notificationDescription;
  final String? notificationPayload;

  LocalNotificationModel({
    required this.notificationChannel,
    required this.notificationTitle,
    required this.notificationDescription,
    this.notificationPayload,
  });
}
