import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inthon_frontend/controller/bottom_nav_controller.dart';
import 'package:inthon_frontend/pages/home.dart';
import 'package:inthon_frontend/pages/chat.dart';
import 'package:inthon_frontend/pages/mypage.dart';

class App extends StatefulWidget {
  const App({super.key});
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      Chat(),
      Home(),
      MyPage(),
    ];
    return Scaffold(
        body: SafeArea(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          //height: 65,
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline_outlined,
                    color: Colors.white, size: 30),
                activeIcon: Icon(Icons.chat_bubble_rounded,
                    color: Colors.white, size: 30),
                label: "chat",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, color: Colors.white, size: 30),
                activeIcon:
                    Icon(Icons.home_filled, color: Colors.white, size: 30),
                label: "home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline, color: Colors.white, size: 30),
                activeIcon:
                    Icon(Icons.person_rounded, color: Colors.white, size: 30),
                label: "mypage",
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            onTap: _onItemTapped,
            selectedLabelStyle: TextStyle(fontFamily: "SUITE"),
            backgroundColor: Color(0xFFD9AE89),
          ),
        ));
  }
}
