import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wersomd_app/views/auth/sign_in.dart';
import 'package:wersomd_app/views/auth/sign_up.dart';
import 'package:wersomd_app/views/home/favorites.dart';
import 'package:wersomd_app/views/home/notifications.dart';
import 'package:wersomd_app/views/home/profile.dart';
import 'package:wersomd_app/views/home/welcome.dart';
import 'package:wersomd_app/views/wrapper/main_wrapper.dart';
import 'package:wersomd_app/services/firebase_stream.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: MyApp.themeNotifier,
        builder: (_, currentMode, child) {
          return MaterialApp(
            title: "Тур по Европе",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primarySwatch: Colors.orange),
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            routes: {
              '/': (context) => const FirebaseStream(),
              '/home': (context) => const MainWrapper(),
              '/profile': (context) => const ProfilePage(),
              '/login': (context) => const SignInPage(),
              '/signup': (context) => const SignUpPage(),
              '/welcome': (context) => const WelcomePage(),
              '/favorite': (context) => const FavoritesPage(),
              '/notifications': (context) => const NotificationsPage(),
            },
            initialRoute: '/',
          );
        },
    );
  }
}
