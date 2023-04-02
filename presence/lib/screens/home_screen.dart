import 'package:flutter/material.dart';

import '../widgets/navigation_bar.dart' as bottom_nav_bar;
import '../screens/work_call_screen.dart';
import '../screens/manage_presence_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = const [
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
      bottomNavigationBar: bottom_nav_bar.NavigationBar(
          onTap: _onItensTap, selectedIndex: _selectedIndex),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
