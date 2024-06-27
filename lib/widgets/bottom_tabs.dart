import 'package:flutter/material.dart';
import 'package:wersomd_app/views/home/favorites.dart';
import 'package:wersomd_app/views/home/home.dart';
import 'package:wersomd_app/views/home/profile.dart';
import 'package:wersomd_app/views/our_ai/our_ai.dart';

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
          page: const OurAiPage(),
          icon: const Icon(Icons.chat_bubble_outline_rounded),
        ),
        TabNavigationItem(
          page: const ProfilePage(),
          icon: const Icon(Icons.person_outline),
        ),
      ];
}
