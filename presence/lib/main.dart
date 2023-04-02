import 'package:flutter/material.dart';
import 'package:presence/screens/manage_presence_screen.dart';
import 'package:provider/provider.dart';

import './screens/presence.dart';
import './screens/work_call_screen.dart';
import './screens/home_screen.dart';

import './providers/person_control.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PersonControl(),
      child: MaterialApp(
        title: 'Presence App',
        theme: ThemeData(
          primaryColor: Colors.blue,
          accentColor: Colors.amber,
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            titleMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            labelMedium: TextStyle(fontSize: 17),
          ),
        ),
        home: const HomeScreen(),
        routes: {
          PresenceScreen.routeName: (context) => const PresenceScreen(),
          WorkCallScreen.routeName: (context) => const WorkCallScreen(),
          ManagePresenceScreen.routeName: (context) =>
              const ManagePresenceScreen(),
        },
      ),
    );
  }
}
