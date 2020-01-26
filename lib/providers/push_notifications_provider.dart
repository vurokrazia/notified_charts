import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsProvider {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final _messagesStreamController = StreamController<String>.broadcast();
  Stream<String> get messages => _messagesStreamController.stream;
  initNotifications() {
    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.getToken().then((token) {
      print("=====");
      print(token);
      print("=====");
      //fjX2u240Tz0:APA91bFeCOdgrDTzHy1We2EbB_fsErjcuam7QQhRvcK4vVA2g57OHd_K9wQLpdT6hll6fIEsDYxnjrC683HpvUREF5X5FQLa3yJyexV9t3jLfsWYTjwL5Qf19vufVBiKALCUzouf8Yr3
    });

    _firebaseMessaging.configure(onMessage: (info) async {
      print("== onMessage ==");
      print(info);
      String arg = 'no-data';
      if (Platform.isAndroid) {
        arg = info['data'] ?? arg;
      }
      _messagesStreamController.sink.add(arg);
    }, onLaunch: (info) async {
      print("== onLaunch ==");
      print(info);
    }, onResume: (info) async {
      print("== onResume ==");
      print(info);
      _messagesStreamController.sink.add(info['data']);
    });
  }

  dispose() {}
}
