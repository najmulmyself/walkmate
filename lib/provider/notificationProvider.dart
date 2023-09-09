import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationProvider with ChangeNotifier {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Initialize notifications in the constructor
  NotificationProvider() {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('app_icon');
    // var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: _onSelectNotification);
  }

  void _onSelectNotification(NotificationResponse? notificationResponse) async {
    // Handle the notification when the user taps on it.
    if (notificationResponse != null) {
      final payload = notificationResponse.payload;
      // Handle the payload or perform any necessary actions here.
    }
  }

  Future<void> showCongratulatoryNotification() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      // 'your_channel_description',
      importance: Importance.max,
      priority: Priority.high,
    );
    // var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      // iOS: iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      'Congratulations!', // Notification title
      "You've reached your daily step target!", // Notification body
      platformChannelSpecifics,
      payload: 'item x',
    );
  }
}
