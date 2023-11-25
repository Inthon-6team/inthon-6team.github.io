import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inthon_frontend/pages/notice.dart';
import 'package:inthon_frontend/components/profile.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
      body: Center(
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
                return Profile();
              },
            ),
          ),
        ),
      ),
    );
  }
}
