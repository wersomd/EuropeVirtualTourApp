import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.grey.shade900,
  primaryColor: Colors.black,
  colorScheme: const ColorScheme.dark(),
  iconTheme: const IconThemeData(color: Colors.white),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: Colors.white,
    indicatorColor: Colors.white,
    unselectedLabelColor: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: Colors.black,
  ),
);

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.white,
  colorScheme: const ColorScheme.light(),
  iconTheme: const IconThemeData(color: Colors.indigo),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.black),
  ),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  indicatorColor: Colors.deepPurpleAccent,
  drawerTheme: const DrawerThemeData(
    backgroundColor: Colors.indigo,
  ),
);
