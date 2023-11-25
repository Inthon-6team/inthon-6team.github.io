import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './image_data.dart';
import 'package:inthon_frontend/repository/profile_repository.dart';

class EditDialog extends StatefulWidget {
  @override
  _EditDialogState createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  Map<String, dynamic> userProfile = {}; // 사용자 프로필 데이터를 저장할 변수

  @override
  void initState() {
    super.initState();
    _fetchProfile();
  }

  Future<void> _fetchProfile() async {
    try {
      userProfile = await fetchMyProfile(); // 서버에서 사용자 프로필 데이터를 가져옵니다.
      setState(() {}); // 상태 업데이트
    } catch (e) {
      print('Error fetching profile: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: 339,
        height: 507,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            SizedBox(height: 16),
            Text(
              "My Profile",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 27.75),
            Stack(
              children: <Widget>[
                Container(
                  //alignment: Alignment.center,
                  width: 185.255,
                  height: 180.249,
                  decoration: BoxDecoration(
                    color: Color(0xfff3f3f3),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 10.25,
                  left: 10,
                  child: ClipOval(
                    child: Container(
                      width: 136,
                      height: 136,
                      /*child: Image.network(
                        //userProfile['imagePath'] ?? '',
                        fit: BoxFit.cover, // 이미지가 컨테이너를 완전히 채우도록 조정
                      ),*/
                    ),
                  ),
                ),
                Positioned(
                  top: 120,
                  left: 120,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    width: 56.909,
                    height: 55.37,
                    decoration: BoxDecoration(
                      color: Color(0xfff3f3f3),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xffffffff), // 테두리 색상
                        width: 1.0, // 테두리 두께
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: Offset(0, 4),
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
              ],
            ),
            SizedBox(
              height: 27.0,
            ),
            Container(
              width: 280,
              height: 39.902,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Color(0xff9f9f9f),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  Text(
                    "ID",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text("|"),
                  Text(
                    "userId",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 7.1),
            Container(
              width: 280,
              height: 39.902,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Color(0xff9f9f9f),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  Text(
                    "이름",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text("|"),
                  Text(
                    "이름",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 7.1),
            Container(
              width: 280,
              height: 76,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Color(0xff9f9f9f),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  Text(
                    "상태메시지",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text("|"),
                  Text(
                    "abc",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
