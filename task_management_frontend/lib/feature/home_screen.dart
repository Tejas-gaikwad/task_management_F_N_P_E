import 'package:flutter/material.dart';
import 'package:task_management_frontend/feature/dashboard/dashboard.dart';
import 'package:task_management_frontend/feature/profile/profile_screen.dart';
import 'package:task_management_frontend/feature/statistics/statistics_screen.dart';
import '../app/config/colors.dart';
import '../utils/constants/appbar_constant.dart';
import 'dashboard/view/dashboard_consumer_screen.dart';
import 'dashboard/widgets/add_task_button_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController taskNameController;
  late TextEditingController taskDescriptionController;
  late double value;
  late int _currentIndex;

  List<BottomNavigationBarItem> bottomNavigationScreens = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Statistics',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    value = 1.0;
    taskNameController = TextEditingController();
    taskDescriptionController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // List of screens to navigate to
    final List<Widget> _pages = [
      DashboardScreen(),
      const StatisticsScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      floatingActionButton: AddTaskActionButton(
        taskNameController: taskNameController,
        taskDescriptionController: taskDescriptionController,
        value: value,
      ),
      backgroundColor: primaryColor,
      appBar: const AppBarConstant(appBarTitle: 'Dashboard'),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 1.0,
        enableFeedback: true,
        selectedItemColor: _currentIndex == 0
            ? lightPurpleColor
            : _currentIndex == 1
                ? lightOrangeColor
                : lightRedColor,
        unselectedItemColor: textColorGrey.withOpacity(0.6),
        backgroundColor: primaryDarkColor,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: bottomNavigationScreens,
      ),
      body: _pages[_currentIndex],
    );
  }
}
