import 'package:flutter/material.dart';

import 'pages/chat.dart';
import 'pages/home.dart';
import 'pages/mypage.dart';

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
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.arrow_back_ios, color: Color(0xff000000)),
                activeIcon:
                    Icon(Icons.arrow_back_ios, color: Color(0xff000000)),
                label: "chat",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.arrow_back_ios, color: Color(0xff000000)),
                activeIcon:
                    Icon(Icons.arrow_back_ios, color: Color(0xff000000)),
                label: "home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.arrow_back_ios, color: Color(0xff000000)),
                activeIcon:
                    Icon(Icons.arrow_back_ios, color: Color(0xff000000)),
                label: "mypage",
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: const Color(0xffFF5C39),
            unselectedItemColor: const Color(0xff757575),
            onTap: _onItemTapped,
            selectedLabelStyle: TextStyle(fontFamily: "SUITE"),
          ),
        ));
  }
}
