import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inthon_frontend/pages/notice.dart';
import 'package:inthon_frontend/components/profile.dart';

class Home extends StatelessWidget {
  //const Home({super.key});

  final List<Map<String, String>> profileData = [
    {
      'statusText': "우리 가족 사랑해 ~",
      'imagePath': 'assets/images/family2.png',
    },
    {
      'statusText': "건 강 조 심",
      'imagePath': 'assets/images/family2.png',
    },
    {
      'statusText': "<시험기간> 바빠서 연락 잘 못 받음ㅜ",
      'imagePath': 'assets/images/family1.png',
    },
    {
      'statusText': "해커톤 나가서 24시간동안 연락 안돼용",
      'imagePath': 'assets/images/family2.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD9AE89),
        elevation: 0,
        toolbarHeight: 54,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(Icons.notifications_none_outlined,
                  color: Colors.white, size: 30),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Notice()),
                );
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 550,
              //padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 16.0),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, //그리드 열 수
                  crossAxisSpacing: 0, //가로 간격
                  mainAxisSpacing: 50.0, // 세로 간격
                  childAspectRatio: 0.8,
                ),
                itemCount: 4, //itemDataList.length,
                itemBuilder: (context, index) {
                  return Profile(
                    statusText: profileData[index]['statusText']!,
                    imagePath: profileData[index]['imagePath']!,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
