import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:wersomd_app/views/home/favorites.dart';
import 'package:wersomd_app/views/home/notifications.dart';

import '../home/home.dart';
import '../home/profile.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({Key? key}) : super(key: key);

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  final PageController pageController = PageController();
  int currentIndex = 0;
  static const List<Widget> pages = [
    HomePage(),
    NotificationsPage(),
    FavoritesPage(),
    ProfilePage(),
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: (index) {
            setState(
              () {
                currentIndex = index;
              },
            );
          },
          children: pages,
        ),
        bottomNavigationBar: CurvedNavigationBar(
          height: 60.0,
          backgroundColor: Colors.transparent,
          color: Colors.black,
          buttonBackgroundColor: Colors.black,
          onTap: onTap,
          items: const [
            Icon(
              Icons.home_outlined,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.favorite_outline,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.notifications_active_outlined,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.person_outline,
              size: 30,
              color: Colors.white,
            ),
          ],
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 400),
          letIndexChange: (_) => true,
        ),
      ),
    );
  }
}
