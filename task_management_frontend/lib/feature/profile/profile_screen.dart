import 'package:flutter/material.dart';

import '../../app/config/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile', style: TextStyle(color: textColorWhite)),
    );
  }
}
