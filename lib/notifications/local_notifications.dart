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
}
