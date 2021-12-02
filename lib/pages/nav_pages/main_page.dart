// Main Page

import 'package:dbestech_211130/pages/nav_pages/bar_item_page.dart';
import 'package:dbestech_211130/pages/home_page.dart';
import 'package:dbestech_211130/pages/nav_pages/my_page.dart';
import 'package:dbestech_211130/pages/nav_pages/search_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

// BottomNavigation 사용하여 페이지 구성
// BarItem을 통해 각 페이지로 이동
class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];
  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // BarItem 터치시 인덱스 +1, 바디에서 화면 이동하도록 설정
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        // 레이블이 보이지 않도록 설정하여 에러 상쇄
        unselectedFontSize: 0,
        selectedFontSize: 0,
        // 아이콘이 선택되었을 때 변화하지 않음
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        // 현재 선택된 아이콘의 인덱스 값
        currentIndex: currentIndex,
        // 자동으로 인덱스 값을 인자로 받음
        onTap: onTap,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        // 아이콘 위의 선을 제거하는 속성
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(label: 'home', icon: Icon(Icons.apps)),
          BottomNavigationBarItem(
              label: 'barchart', icon: Icon(Icons.bar_chart_sharp)),
          BottomNavigationBarItem(label: 'search', icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: 'mypage', icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
