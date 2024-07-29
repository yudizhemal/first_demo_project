import 'package:first_demo_project/Theme/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? titleWidget;
  final Widget? leading;
  final bool showActionIcon;
  final VoidCallback? onMenuActionTap;
  final Color backgroundColor;

  CustomAppBar({
    required this.title,
    this.titleWidget,
    this.leading,
    this.showActionIcon = false,
    this.onMenuActionTap,
    this.backgroundColor =
        const Color.fromRGBO(186, 25, 31, 1), // Default background color
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    // Change status bar color
    var canGoBack = Navigator.canPop(context);
    return AppBar(
      // backgroundColor: backgroundColor,
      leading: leading ??
          (canGoBack
              ? IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: lightTextColor),
                  onPressed: () {
                    Get.back();
                  },
                )
              : null),
      title: titleWidget ?? Text(
              title,
              style: const TextStyle(
                color: lightTextColor,
              ),
            ),
      centerTitle: true,
      actions: [
        if (showActionIcon)
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: onMenuActionTap,
          ),
      ],
    );
  }
}
