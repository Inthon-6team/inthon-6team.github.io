import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inthon_frontend/app.dart';
import 'package:inthon_frontend/components/image_data.dart';
import 'package:inthon_frontend/pages/home.dart';
import 'package:inthon_frontend/pages/login.dart';
import 'package:inthon_frontend/repository/auth_header.dart';
import 'package:inthon_frontend/repository/profile_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView(
                children: [
                  buildPageView(
                    "멀리서도\n가족과 함께",
                    IconsPath.intro3,
                    IconsPath.index1,
                  ),
                  buildPageView(
                    "어디서나\n집처럼 소통하기",
                    IconsPath.intro4,
                    IconsPath.index2,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                final preferences = await SharedPreferences.getInstance();
                final token = (await getAuthHeader())['Authorization'];
                try {
                  await fetchMyProfile();
                } catch (e) {
                  preferences.remove('access_token');
                }
                if ((preferences.getString('access_token')) == null) {
                  print("로그인 안되어있음");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                } else {
                  print("이미 로그인 되어있음");
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => App()));
                }
              },
              child: Container(
                margin: EdgeInsets.only(
                    left: (size.width - 283.238) / 2, bottom: size.height / 5),
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
                    fontWeight: FontWeight.w500,
                    color: Color(0xffffffff),
                  ),
                )),
              ),
            ),
          ],
        ));
  }
}

Widget buildPageView(String text, String imagePath, String imagePath2) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    //mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: EdgeInsets.only(left: 40, top: 40),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w800,
            color: Color(0xff000000),
          ),
        ),
      ),
      Container(
        width: 393,
        height: 351,
        child: ImageData(imagePath),
      ),
      Center(
        child: Container(
          width: 38,
          height: 14,
          child: ImageData(imagePath2),
        ),
      ),
    ],
  );
}
