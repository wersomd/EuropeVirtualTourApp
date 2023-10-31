import 'package:flutter/material.dart';
import 'package:wersomd_app/widgets/custom_app_bar.dart';
import 'package:wersomd_app/widgets/drawer/custom_drawer.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: CustomAppBar(
        scaffoldKey: _scaffoldKey,
      ),
      body: const SingleChildScrollView(),
    );
  }
}
