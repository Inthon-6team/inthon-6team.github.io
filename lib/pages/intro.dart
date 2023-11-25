import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inthon_frontend/components/image_data.dart';
import 'package:inthon_frontend/pages/home.dart';
import 'package:inthon_frontend/pages/login.dart';
import 'package:inthon_frontend/repository/auth_header.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 40),
              child: Text(
                "멀리서도\n가족과 함께",
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w800,
                  color: Color(0xff000000),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: 430,
                child: Column(mainAxisSize: MainAxisSize.max, children: [
                  /*Container(
                    width: 393,
                    height: 175,
                    child: ImageData(IconsPath.intro2),
                  ),*/
                  Container(
                    width: 393,
                    height: 421,
                    child: ImageData(IconsPath.intro1),
                  ),
                ]),
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () async {
                final token = (await getAuthHeader())['Authorization'];
                if (token == "Bearer null" || token == null || token == "") {
                  print("로그인 안되어있음");
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
                } else {
                  print("이미 로그인 되어있음");
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
                }
              },
              child: Container(
                margin: EdgeInsets.only(left: (size.width - 283.238) / 2),
                width: 283.238,
                height: 36.813,
                decoration: BoxDecoration(
                  color: Color(0xffd9ae89),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                    child: Text(
                  "Click to Start",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: Color(0xffffffff),
                  ),
                )),
              ),
            ),
          ],
        ));
  }
}
