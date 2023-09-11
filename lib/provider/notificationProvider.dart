import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationProvider with ChangeNotifier {
  BuildContext context;


  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Initialize notifications in the constructor
  NotificationProvider(this.context) {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('launch_background');
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
      print("notification clicked");
      final payload = notificationResponse.payload;

      // Handle the payload or perform any necessary actions here.
    }
  }

  Future<void> showCongratulatoryNotification() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      // 'ic_launcher',
      'your_channel_id',
      'your_channel_name',
      // icon: 'ic_launcher',
      //  'your_channel_description',

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
