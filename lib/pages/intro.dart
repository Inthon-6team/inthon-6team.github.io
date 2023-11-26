import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inthon_frontend/app.dart';
import 'package:inthon_frontend/components/image_data.dart';
import 'package:inthon_frontend/pages/home.dart';
import 'package:inthon_frontend/pages/login.dart';
import 'package:inthon_frontend/repository/auth_header.dart';
import 'package:inthon_frontend/repository/device_token.dart';
import 'package:inthon_frontend/repository/profile_repository.dart';
import 'package:inthon_frontend/utils/firebase_device_token.dart';
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
            Container(
              margin:
                  EdgeInsets.only(left: (size.width - 284) / 2, bottom: 150),
              width: 284,
              child: TextButton(
                onPressed: () async {
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => App()));
                  }
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size(283.238, 36.813),
                  backgroundColor: Color(0xffd9ae89),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  shadowColor: Colors.black.withOpacity(0.25),
                  elevation: 4, // 그림자 강도
                ),
                child: Center(
                  child: Text(
                    "Click to Start",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
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
