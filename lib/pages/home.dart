import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inthon_frontend/pages/notice.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          elevation: 0,
          toolbarHeight: 65,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // 다른 위젯을 우측으로 밀어내기 위해 Spacer 추가
              IconButton(
                icon: Icon(Icons.notifications_none_outlined),
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
          child: Text("home"),
        ));
  }
}
