import 'package:cinema_tikets/pages/bottom_navigation_bar/home_page.dart';
import 'package:cinema_tikets/pages/bottom_navigation_bar/profile_page.dart';
import 'package:cinema_tikets/pages/bottom_navigation_bar/search_page.dart';
import 'package:flutter/material.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int nowIndex = 0;
  void onTap(int index) {
    setState(() {
      nowIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List pages = [
      const HomePage(),
      const SearchPage(),
      // BarItemPage(),
      const ProfilePage(),
    ];
    return Scaffold(
      backgroundColor:Colors.white,
      body: pages[nowIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: nowIndex,
          onTap: onTap,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black54,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          items: const [
            BottomNavigationBarItem(label: "home", icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: "search", icon: Icon(Icons.search)),
            BottomNavigationBarItem(label: "chart", icon: Icon(Icons.chair_sharp)),
            BottomNavigationBarItem(label: "profile", icon: Icon(Icons.airplane_ticket_outlined)),
          ]),
    );
  }
}
