import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  final Function onTap;
  final int selectedIndex;

  const NavigationBar(
      {super.key, required this.onTap, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        backgroundColor: Theme.of(context).primaryColor,
        onTap: (value) {
          onTap(value);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.schedule), label: 'Work Call'),
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt), label: 'List of Calls'),
        ]);
  }
}
