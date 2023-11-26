import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inthon_frontend/components/image_data.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xffffffff),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                //padding: EdgeInsets.symmetric(vertical: 8),
                width: size.width,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xfff3f3f3),
                  borderRadius: BorderRadius.circular(5.0), // 경계선을 둥글게 설정
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "ID 혹은 휴대폰 번호로 가족 구성원 추가",
                    border: InputBorder.none, // 테두리 없앰
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10), // 내부 패딩 조정
                  ),
                  // 필요한 기타 TextField 설정
                ),
              ),
              SizedBox(height: 22),
              Container(
                width: size.width,
                height: 422,
                child: ImageData(IconsPath.myPage),
              )
            ],
          ),
        ));
  }
}
