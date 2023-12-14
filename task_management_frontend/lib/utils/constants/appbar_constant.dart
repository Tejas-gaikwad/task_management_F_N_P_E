import 'package:flutter/material.dart';

import '../../app/config/colors.dart';

class AppBarConstant extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle;
  final List<Widget>? actions;
  final bool showBackButton;
  const AppBarConstant({
    super.key,
    required this.appBarTitle,
    this.actions,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryDarkColor,
      automaticallyImplyLeading: showBackButton,
      title: Text(
        appBarTitle,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: textColorWhite,
          fontSize: 14,
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
