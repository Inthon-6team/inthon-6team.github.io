import 'package:flutter/material.dart';
import 'package:inthon_frontend/app.dart';
import 'package:inthon_frontend/pages/intro.dart';
import 'package:inthon_frontend/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InHome',
      theme: ThemeData(
        fontFamily: 'NanumSquareRound',
      ),
      home: Intro(),
    );
  }
}
