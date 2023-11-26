import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inthon_frontend/components/image_data.dart';
import 'package:inthon_frontend/repository/profile_repository.dart';
import 'package:inthon_frontend/pages/story.dart';

class Profile extends StatefulWidget {
  final String userId;
  final String nickName;
  final String statusText;
  final String imagePath;

  Profile(
      {required this.userId,
      required this.nickName,
      required this.statusText,
      required this.imagePath});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isEditing = false;
  late TextEditingController textController;
  bool isSis = false;

  @override
  void initState() {
    super.initState();
    if (widget.userId == 'sister0121') {
      isSis = true;
    }

    textController = TextEditingController(text: widget.statusText);

    textController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              width: 139,
              height: 76,
            ),
            /*GestureDetector(
              onTap: () async {
                // fetchMyProfile에서 받아온 데이터에서 userId를 가져오기
                var data = await fetchMyProfile();

                print(data.runtimeType);
                if (data['id'] == widget.userId) {
                  print("프로필 수정 가능");
                  setState(() {
                    isEditing = true;
                  });
                } else {
                  print("다른 사용자의 프로필은 수정할 수 없습니다.");
                  // TODO: 다른 사용자의 프로필은 수정할 수 없다는 알림창 띄우기
                }
              },*/
            Container(
              width: 139,
              height: 66,
              decoration: BoxDecoration(
                color: Color(0xfff3f3f3),
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Container(
                //padding: EdgeInsets.only(top: 17, left: 7.0),
                child: isEditing ? buildTextField() : buildText(),
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
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 4),
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
              decoration: isSis
                  ? BoxDecoration(
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
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(248, 232, 83, 0.95),
                          Color.fromRGBO(255, 0, 0, 0.38),
                        ],
                      ),
                    )
                  : BoxDecoration(
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
              top: 8,
              left: 8,
              child: GestureDetector(
                onTap: isSis
                    ? () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  Story()), // 여기서 AnotherPage는 이동하고자 하는 페이지입니다.
                        );
                      }
                    : null, // isSis가 false일 때는 아무 동작도 하지 않음

                child: ClipOval(
                  child: Container(
                    width: 136,
                    height: 136,
                    child: Image.network(
                      widget.imagePath,
                      fit: BoxFit.cover, // 이미지가 컨테이너를 완전히 채우도록 조정
                    ),
                  ),
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
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Expanded(
          child: Text(
            widget.nickName,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Color(0xff000000),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7),
      child: TextField(
        controller: textController,
        onEditingComplete: () {
          setState(() {
            isEditing = false;
          });
        },
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xff000000),
        ),
        maxLength: 30,
        decoration: InputDecoration(
          counterText: "",
          suffix: Text(
            "${textController.text.length}/30",
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Color(0xff8d8d8d),
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffe1e1e1), width: 2),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffe1e1e1), width: 2),
          ),
        ),
      ),
    );
  }

  Widget buildText() {
    return Container(
      padding: EdgeInsets.only(top: 17, left: 7.0),
      child: Text(
        textController.text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xff000000),
        ),
      ),
    );
  }
}
