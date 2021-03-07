import 'package:flutter/cupertino.dart';

class AppNotification {
  String title;
  String body;
  String dataTitle;
  String dataBody;

  AppNotification({
    this.title,
    this.body,
    this.dataTitle,
    this.dataBody,
  });

  factory AppNotification.fromJson(Map<String, dynamic> message) {
    return AppNotification(
      title: message['notification']['title'],
      body: message['notification']['body'],
      dataTitle: message['data']['title'],
      dataBody: message['data']['body'],
    );
  }
}
