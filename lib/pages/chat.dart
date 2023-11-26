import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Chat extends StatelessWidget {
  //const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Center(
          child: Text("chat"),
        ));
  }
}
