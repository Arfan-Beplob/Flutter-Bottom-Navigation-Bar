import 'package:bottom_navigation_bar/Screens/home.dart';
import 'package:bottom_navigation_bar/Screens/profile.dart';
import 'package:bottom_navigation_bar/Screens/search.dart';
import 'package:bottom_navigation_bar/Screens/setting.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [
    const HomeScreen(),
    const SearchScreen(),
    const ProfilePage(),
    const SettingPage(),
  ];
  int _activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: Container(
        color: Colors.black,
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,
              vertical: 20
          ),
          child: GNav(
            onTabChange: (index){
              setState(() {
                _activeIndex = index;
              });
            },
            haptic: true,
              tabBorderRadius: 15,
            tabBackgroundColor: const Color(0xFF424242),
            iconSize: 30,
            gap: 8,
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            padding: const EdgeInsets.all(16),
            tabs: [
              const GButton(
                  text: 'Home',
                  icon: Icons.home),
              const GButton(
                  text: 'Search',
                  icon: Icons.search),
              const GButton(
                  text: 'Profile',
                  icon: Icons.person),
              const GButton(
                  text: 'Settings',
                  icon: Icons.settings),
            ],
          selectedIndex: _activeIndex,
          ),
        ),
      ),
      body: pages.elementAt(_activeIndex),
    );
  }
}
