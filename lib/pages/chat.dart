import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inthon_frontend/components/image_data.dart';

class Chat extends StatelessWidget {
  //const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                width: size.width,
                height: 500,
                child: ImageData(IconsPath.chatBox),
              ),
              SizedBox(height: size.height - 750),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                height: 50,
                child: TextFormField(
                  //controller: textController,
                  enabled: true,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      letterSpacing: -0.50,
                      color: Color(0xff000000)),
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Type Message Here',
                    hintStyle: TextStyle(
                      color: Color(0xff4e4e4e),
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      letterSpacing: -0.50,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0), // 원하는 모양으로 조절
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0), // 원하는 모양으로 조절
                    ),
                    suffixIcon: Icon(
                      Icons.send_outlined, // 원하는 아이콘으로 바꾸세요.
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
