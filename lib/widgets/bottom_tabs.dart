import 'package:flutter/material.dart';
import 'package:wersomd_app/views/home/favorites.dart';
import 'package:wersomd_app/views/home/home.dart';
import 'package:wersomd_app/views/home/notifications.dart';
import 'package:wersomd_app/views/home/profile.dart';

class TabNavigationItem {
  final Widget page;
  final Icon icon;

  TabNavigationItem({required this.page, required this.icon});

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: const HomePage(),
          icon: const Icon(Icons.home_outlined),
        ),
        TabNavigationItem(
          page: const FavoritesPage(),
          icon: const Icon(Icons.favorite_border),
        ),
        TabNavigationItem(
          page: const NotificationsPage(),
          icon: const Icon(Icons.notifications_outlined),
        ),
        TabNavigationItem(
          page: const ProfilePage(),
          icon: const Icon(Icons.person_outline),
        ),
      ];
}
