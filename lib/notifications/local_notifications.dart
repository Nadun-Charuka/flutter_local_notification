import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationsService {
  static Future<void> onDidReceiveNotificationResponse(
      NotificationResponse notificationResponce) async {
    //implement your code
  }
  static Future<void> onDidReceiveBackgroundNotificationResponse(
      NotificationResponse notificationResponce) async {
    //implement your code
  }

//*********************************************************
  //create instance of local notification
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  //initialize method
  static Future<void> init() async {
    //initialize the android setting
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");
    //initialize the ios setting
    DarwinInitializationSettings iosInitializationSettings =
        DarwinInitializationSettings();

    //combined android and ios
    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    //initialize the pluging
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse:
          onDidReceiveBackgroundNotificationResponse,
    );

    //request permission
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  //show a notification(instant notification)
  static Future<void> showInstacnceNotification({
    required String title,
    required String body,
  }) async {
    //define the notification details
    const NotificationDetails platformChannelSpecification =
        NotificationDetails(
      android: AndroidNotificationDetails(
        "Channel Id",
        "Channel name",
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );
    await _flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecification,
    );
  }
}
