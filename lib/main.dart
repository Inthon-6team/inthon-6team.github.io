import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:inthon_frontend/app.dart';
import 'package:inthon_frontend/pages/intro.dart';
import 'package:inthon_frontend/pages/login.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
    apiKey: "AIzaSyAPiMqhWGgZASXVKXX2MgodC82bFe7REiI",
    authDomain: "inthon.firebaseapp.com",
    projectId: "inthon",
    storageBucket: "inthon.appspot.com",
    messagingSenderId: "384729510885",
    appId: "1:384729510885:web:2ff3a9d2b270980603f50c",
    measurementId: "G-7BTM48LX4C",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          //useMaterial3: true,
          ),
      home: Intro(),
    );
  }
}
