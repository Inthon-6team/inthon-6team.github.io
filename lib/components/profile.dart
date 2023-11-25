import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inthon_frontend/components/image_data.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 139,
                height: 76,
              ),
              Container(
                width: 139,
                height: 66,
                decoration: BoxDecoration(
                  color: Color(0xfff3f3f3),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25), // 그림자 색상과 투명도
                      spreadRadius: 0, // 그림자의 확산 정도
                      blurRadius: 4, // 흐림 정도
                      offset: Offset(0, 4), // 그림자의 위치
                    ),
                  ],
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 17, left: 7.0),
                  child: Text(
                    "<시험기간> 바빠서 연락 잘 못 받음.",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 56,
                left: 100,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Color(0xfff3f3f3),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25), // 그림자 색상과 투명도
                        spreadRadius: 0, // 그림자의 확산 정도
                        blurRadius: 4, // 흐림 정도
                        offset: Offset(0, 4), // 그림자의 위치
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          //SizedBox(height: 10),
          Stack(
            children: <Widget>[
              Container(
                //alignment: Alignment.center,
                width: 153,
                height: 153,
                decoration: BoxDecoration(
                  color: Color(0xfff3f3f3),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25), // 그림자 색상과 투명도
                      spreadRadius: 0, // 그림자의 확산 정도
                      blurRadius: 4, // 흐림 정도
                      offset: Offset(0, 4), // 그림자의 위치
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  width: 136,
                  height: 136,
                  child: ImageData(
                    IconsPath.family1,
                  ),
                ),
              ),
              Positioned(
                top: 105,
                left: 100,
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  width: 47,
                  height: 47,
                  decoration: BoxDecoration(
                    color: Color(0xfff3f3f3),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color(0xffffffff), // 테두리 색상
                      width: 1.0, // 테두리 두께
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25), // 그림자 색상과 투명도
                        spreadRadius: 0, // 그림자의 확산 정도
                        blurRadius: 4, // 흐림 정도
                        offset: Offset(0, 4), // 그림자의 위치
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: ImageData(IconsPath.click,
                        isSvg: true, width: 23.745, height: 33.204),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                left: 98,
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color: Color(0xfff3f3f3),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25), // 그림자 색상과 투명도
                        spreadRadius: 0, // 그림자의 확산 정도
                        blurRadius: 4, // 흐림 정도
                        offset: Offset(0, 4), // 그림자의 위치
                      ),
                    ],
                  ),
                ),
              ),

              /*child: ClipOval(
                  child: Container(
                    width: 148.47,
                    height: 148.47,
                    decoration: BoxDecoration(
                      color: Color(0xffe2eee0),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 24,
                          child: Container(
                              width: 136,
                              height: 136,
                              child: ImageData(
                                IconsPath.family1,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),*/
            ],
          ),
        ],
      ),
    );
  }
}
