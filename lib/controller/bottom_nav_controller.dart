import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum PageName { CHAT, HOME, MYPAGE }

class BottomNavController extends GetxController {
  static BottomNavController get to => Get.find();

  RxInt pageIndex = 1.obs;
  //TabController? tabController;

  GlobalKey<NavigatorState> searchPageNaviationKey =
      GlobalKey<NavigatorState>();
  List<int> bottomHistory = [1];

  void changeBottomNav(int value, {bool hasGesture = true}) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.CHAT:
      case PageName.HOME:
      case PageName.MYPAGE:
        _changePage(value, hasGesture: hasGesture);
        break;
    }
  }

  void _changePage(int value, {bool hasGesture = true}) {
    pageIndex(value);
    if (!hasGesture) return;
    if (bottomHistory.last != value) {
      bottomHistory.add(value);
    }
  }

  Future<bool> willPopAction() async {
    // 뒤로가기 버튼 시 실행
    var page = PageName.values[bottomHistory.last];
    if (page == PageName.HOME) {
      return true;
    } else {
      changeBottomNav(1, hasGesture: false); // Home 이 아니라면 홈으로 이동
      return false;
    }
  }
}
