import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Color(0xff000000)),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Center(
          child: Text("chat"),
        ));
  }
}
