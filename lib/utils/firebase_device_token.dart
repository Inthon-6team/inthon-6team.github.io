import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void getDeviceToken() async {
    try {
      final token = await FirebaseMessaging.instance.getToken();
      if (token != null) {
        print("내 디바이스 토큰: $token");
      } else {
        print("토큰이 null입니다.");
      }
    } catch (e) {
      print("토큰을 가져오는 도중 오류 발생: $e");
      print("error");
    }
  }
