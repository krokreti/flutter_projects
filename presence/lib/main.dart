import 'package:flutter/material.dart';

import './screens/home.dart';
import './screens/presence.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Presence App',
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.amber,
        textTheme: const TextTheme(
            titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            titleMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            labelMedium: TextStyle(fontSize: 17)),
      ),
      home: const HomeScreen(),
      routes: {
        PresenceScreen.routeName: (context) => PresenceScreen(),
      },
    );
  }
}
