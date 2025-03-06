import 'package:flutter/material.dart';
import 'package:notifications_test_app/notifications/local_notifications.dart';
import 'package:notifications_test_app/screens/home_page.dart';

//navigator key
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize the local notificatin services
  await LocalNotificationsService.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: "Instant notifications",
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => HomePage(),
      },
    );
  }
}
