import 'package:flutter/material.dart';
import 'package:notifications_test_app/notifications/local_notifications.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Notifications"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                LocalNotificationsService.showInstacnceNotification(
                    title: "Vocablo App",
                    body: "Translate ,Practice and Learn.....");
              },
              child: Text("Instance Notification"),
            )
          ],
        ),
      ),
    );
  }
}
