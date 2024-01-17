import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:wersomd_app/widgets/change_theme_button.dart';

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
    final theme = Theme.of(context);

    return FadeInUp(
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Europe Virtual Tour',
          style: TextStyle(
            fontSize: 20,
            color: theme.textTheme.bodyLarge!.color,
            letterSpacing: 0.53,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        leading: IconButton(
          onPressed: () => scaffoldKey.currentState!.openDrawer(),
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          icon: Icon(
            Icons.subject,
            color: theme.appBarTheme.iconTheme?.color,
            size: 34,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              const ChangeThemeButtonWidget();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.dark_mode,
                size: 34,
                color: theme.appBarTheme.iconTheme!.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
