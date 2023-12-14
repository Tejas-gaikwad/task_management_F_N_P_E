// Product screens
import 'package:flutter/material.dart';

class SingleTaskScreen extends StatelessWidget {
  final String id;
  const SingleTaskScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('SingleTaskScreen'),
        ),
      ),
    );
  }
}
