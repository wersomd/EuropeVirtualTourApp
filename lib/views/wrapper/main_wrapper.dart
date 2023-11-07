import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:wersomd_app/views/home/favorites.dart';
import 'package:wersomd_app/views/home/notifications.dart';

import '../home/home.dart';
import '../home/profile.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  var _currentIndex = 0;
  static const List<Widget> pages = [
    HomePage(),
    FavoritesPage(),
    NotificationsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.home_outlined),
              title: const Text("Главная"),
              selectedColor: Colors.indigo,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: const Icon(Icons.favorite_border),
              title: const Text("Избранные"),
              selectedColor: Colors.indigo,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: const Icon(Icons.notifications_outlined),
              title: const Text("Уведомление"),
              selectedColor: Colors.indigo,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: const Icon(Icons.person_outline),
              title: const Text("Профиль"),
              selectedColor: Colors.indigo,
            ),
          ],
        ),
      ),
    );
  }
}
