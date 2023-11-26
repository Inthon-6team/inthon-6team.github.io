import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inthon_frontend/pages/notice.dart';
import 'package:inthon_frontend/components/profile.dart';
import 'package:inthon_frontend/components/image_data.dart';
import 'package:inthon_frontend/components/edit_profile.dart';
import 'package:inthon_frontend/repository/profile_repository.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //const Home({super.key});

  List<Map<String, String>> profileData = [];

  @override
  void initState() {
    super.initState();
    //int groupId = 1;
    fetchProfileData().then((data) {
      if (mounted) {
        setState(() {
          profileData = data;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFffffff),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 54,
        leading: Row(
          //mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(width: 5),
            IconButton(
              icon: Icon(Icons.notifications_none_outlined,
                  color: Color(0xffd9ae89), size: 30),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Notice()),
                );
              },
            ),
          ],
        ),
        title: ImageData(IconsPath.inhomeLogo, width: 169, height: 59),
        actions: [
          IconButton(
            padding: EdgeInsets.all(0),
            icon: ImageData(IconsPath.profile, isSvg: true, width: 31),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return EditDialog();
                },
              );
            },
          ),
          //SizedBox(width: 22),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: 550,
            color: Colors.white,
            //padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 16.0),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //그리드 열 수
                crossAxisSpacing: 0, //가로 간격
                mainAxisSpacing: 30.0, // 세로 간격
                childAspectRatio: 0.75,
              ),
              itemCount: profileData.length,
              itemBuilder: (context, index) {
                return Profile(
                  userId: profileData[index]['id']!,
                  nickName: profileData[index]['nickName']!,
                  statusText: profileData[index]['statusText']!,
                  imagePath: profileData[index]['imagePath']!,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
