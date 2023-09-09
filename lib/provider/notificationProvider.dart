import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationProvider with ChangeNotifier {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> sendTestNotification() async {
    try {
      await _firebaseMessaging.subscribeToTopic('test_topic');
      await _firebaseMessaging.subscribeToTopic('test_topic2');
      await _firebaseMessaging.subscribeToTopic('test_topic3');
    } catch (e) {
      print('Error subscribing to topic: $e');
    }

    Map<String, String> notification = {
      'title': 'Test Notification', // Ensure title is not null
      'body': 'This is a test notification.', // Ensure body is not null
    };
    // 'data': {
    //   'example_data_key': 'example_data_value',
    // },
    // 'to': '/topics/test_topic',
    // };

    try {
      print(notification.runtimeType);
      await _firebaseMessaging.sendMessage(
        to: "myself",
        data: notification,
      );
    } catch (e) {
      print('Error sending notification: $e');
    }

    print('Test notification sent.');
  }
}
