import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inthon_frontend/controller/bottom_nav.dart';
import 'package:inthon_frontend/pages/home.dart';
import 'package:inthon_frontend/pages/chat.dart';
import 'package:inthon_frontend/pages/mypage.dart';

class App extends GetView<BottomNavController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Obx(
        () => Scaffold(
          body: IndexedStack(
            index: controller.pageIndex.value,
            children: [
              Chat(),
              Home(),
              MyPage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.pageIndex.value,
            elevation: 0,
            selectedLabelStyle: TextStyle(
                fontSize: 12, height: 2 // 선택된 페이지 라벨의 색상을 검정색(#000000)으로 지정
                ),
            unselectedLabelStyle: TextStyle(
                fontSize: 12, height: 2 // 선택된 페이지 라벨의 색상을 검정색(#000000)으로 지정
                ),
            selectedItemColor: Color(0xff808080),
            onTap: controller.changeBottomNav,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.arrow_back_ios, color: Color(0xff000000)),
                activeIcon:
                    Icon(Icons.arrow_back_ios, color: Color(0xff000000)),
                label: '채팅',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.arrow_back_ios, color: Color(0xff000000)),
                activeIcon:
                    Icon(Icons.arrow_back_ios, color: Color(0xff000000)),
                label: '홈',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.arrow_back_ios, color: Color(0xff000000)),
                activeIcon:
                    Icon(Icons.arrow_back_ios, color: Color(0xff000000)),
                label: '마이페이지',
              ),
            ],
          ),
        ),
      ),
      onWillPop: controller.willPopAction,
    );
  }
}
