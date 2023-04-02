import 'package:flutter/material.dart';

import '../widgets/navigation_bar.dart' as bottomNavBar;
import '../screens/work_call_screen.dart';
import '../screens/presence.dart';
import '../screens/manage_presence_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = [
    WorkCallScreen(),
    ManagePresenceScreen(),
  ];

  void _onItensTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Presence App'),
        elevation: 4,
        leading: const Icon(Icons.calendar_month_outlined),
      ),
      bottomNavigationBar: bottomNavBar.NavigationBar(
          onTap: _onItensTap, selectedIndex: _selectedIndex),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
