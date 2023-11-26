import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './image_data.dart';
import 'package:inthon_frontend/repository/profile_repository.dart';
import '../app.dart';

class EditDialog extends StatefulWidget {
  @override
  _EditDialogState createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  Map<String, dynamic> userProfile = {}; // 사용자 프로필 데이터를 저장할 변수
  bool isEditingName = false;
  String _displayText = "";
  bool isEditingMessage = false;
  String _displayMessage = "";
  bool isLoading = true;

  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _statusEditingController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchProfile();
  }

  Future<void> _fetchProfile() async {
    try {
      userProfile = await fetchMyProfile();
      setState(() {
        isLoading = false;
        if (userProfile.containsKey("nickName")) {
          _displayText = userProfile["nickName"];
          _displayMessage = userProfile["statusText"];
        }
      });
    } catch (e) {
      print('Error fetching profile: $e');
      setState(() {
        isLoading = false; // 오류 발생시에도 로딩 상태 변경
      });
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
        height: 607,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(20),
        ),
        child: isLoading
            ? Center(child: CircularProgressIndicator()) // 로딩 인디케이터 표시
            : Column(
                children: [
                  SizedBox(height: 16.0),
                  Text(
                    "My Profile",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 22),
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
                            width: 165,
                            height: 159.844,
                            child: Image.network(
                              userProfile['imagePath'] ?? '',
                              fit: BoxFit.cover,
                            ),
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
                              color: Color(0xffffffff),
                              width: 1.0,
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
                        Container(
                          width: 70,
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                width: 1.0,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          child: Text(
                            "ID",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            userProfile["id"] ?? '',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
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
                        Container(
                          width: 70,
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                width: 1.0,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          child: Text(
                            "이름",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        isEditingName
                            ? Container(
                                width: 150,
                                child: TextField(
                                    controller: _textEditingController,
                                    onEditingComplete: () async {
                                      String newName =
                                          _textEditingController.text;
                                      try {
                                        await updateName(newName);
                                        setState(() {
                                          isEditingName = false;
                                          _displayText = newName;
                                        });
                                      } catch (e) {}
                                    },

                                    //textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(left: 10.0),
                                      /*enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffe1e1e1), width: 2),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffe1e1e1), width: 2),
                                ),*/
                                    )))
                            : Container(
                                padding: EdgeInsets.only(left: 10),
                                width: 150,
                                child: Text(
                                  _displayText,
                                  //userProfile["nickName"] ?? '',
                                  //textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                        IconButton(
                          icon: ImageData(IconsPath.pencil,
                              isSvg: true, width: 22),
                          onPressed: () {
                            setState(() {
                              isEditingName = !isEditingName;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 7.1),
                  Container(
                    width: 280,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Color(0xff9f9f9f),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "상태메시지",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              IconButton(
                                icon: ImageData(IconsPath.pencil,
                                    isSvg: true, width: 22),
                                onPressed: () {
                                  setState(() {
                                    isEditingMessage = !isEditingMessage;
                                  });
                                },
                              ),
                            ],
                          ),
                          isEditingMessage
                              ? Container(
                                  width: 250,
                                  child: TextField(
                                      controller: _statusEditingController,
                                      onEditingComplete: () async {
                                        String newMessage =
                                            _statusEditingController.text;
                                        try {
                                          await updateStatusText(newMessage);
                                          setState(() {
                                            isEditingMessage = false;
                                            _displayMessage = newMessage;
                                          });
                                        } catch (e) {}
                                      },
                                      //textAlign: TextAlign.center,
                                      maxLength: 20,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.only(left: 10.0),
                                        /*enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffe1e1e1), width: 2),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffe1e1e1), width: 2),
                                ),*/
                                      )))
                              : Container(
                                  padding: EdgeInsets.only(left: 10),
                                  width: 150,
                                  child: Text(
                                    _displayMessage,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => App()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.save,
                          size: 24.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
