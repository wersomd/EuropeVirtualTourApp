import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomAppBar({
    super.key,
    required this.scaffoldKey,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Europe Virtual Tour',
          style:
              TextStyle(fontSize: 18, color: Colors.black, letterSpacing: 0.53),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        leading: IconButton(
          onPressed: () => scaffoldKey.currentState!.openDrawer(),
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          icon: const Icon(
            Icons.subject,
            color: Colors.black,
            size: 32,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              // Обработка нажатия на иконку уведомлений
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.notifications,
                size: 32,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
