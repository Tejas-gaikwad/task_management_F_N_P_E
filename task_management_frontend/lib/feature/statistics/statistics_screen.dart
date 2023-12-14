import 'package:flutter/material.dart';
import 'package:task_management_frontend/app/config/colors.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Statistics',
        style: TextStyle(color: textColorWhite),
      ),
    );
  }
}
