import 'package:app_chat_firebase/shared/constants/ColorsConstants.dart';
import 'package:app_chat_firebase/shared/helpers/logger.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationFirebase {
  final _firebaseMessaging = FirebaseMessaging.instance;
  Future<String?> getToken() async {
    String? token = await _firebaseMessaging.getToken();
    logger.w(token);
    return token;
  }

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await FirebaseMessaging.instance.getToken();
    logger.w(fcmToken);
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    logger.w(initialMessage);
    FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
      logger.w('Title: ${message.notification?.title}');
      logger.w('Body: ${message.notification?.body}');
      logger.w('data: ${message.data}');
      Get.snackbar(
        'ở  message background',
        'Chúc mừng bạn đã là thành viên Young Team',
        backgroundColor: ColorsConstants.light200,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      logger.w('Got a message whilst in the foreground!');
      logger.w('Message data: ${message.data}');
      Get.snackbar(
        'ở  message listen',
        'Chúc mừng bạn đã là thành viên Young Team',
        backgroundColor: ColorsConstants.light200,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
      if (message.notification != null) {
        logger.w(
            'Message also contained a notification: ${message.notification}');
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      logger.w('Data: $message');
    });
  }
}
