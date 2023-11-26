import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inthon_frontend/components/image_data.dart';

class Story extends StatelessWidget {
  const Story({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.close), // 'X' 아이콘
            onPressed: () {
              Navigator.of(context).pop(); // 현재 페이지를 스택에서 제거
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height,
              child: ImageData(IconsPath.story),
            ),
          ],
        ),
      ),
    );
  }
}
