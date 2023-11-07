import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:wersomd_app/models/notifications_model.dart';
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
      body: ListView.separated(
          separatorBuilder: (context, int index) => FadeInUp(
                child: const Divider(
                  color: Colors.grey,
                  height: 10,
                ),
              ),
          itemCount: notificationsData.length,
          itemBuilder: (context, index) {
            return FadeInUp(
              child: ListTile(
                leading: Icon(
                  Icons.notifications_outlined,
                  size: 32,
                  color: Colors.red[400],
                ),
                title: Text(
                  notificationsData[index].title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  notificationsData[index].subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                trailing: const Icon(
                  Icons.check_box_outlined,
                  size: 30,
                  color: Colors.indigo,
                ),
              ),
            );
          }),
    );
  }
}
