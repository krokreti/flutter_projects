import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PresenceScreen extends StatefulWidget {
  static const routeName = '/presence';

  const PresenceScreen({super.key});

  @override
  State<PresenceScreen> createState() => _PresenceScreenState();
}

class _PresenceScreenState extends State<PresenceScreen> {
  @override
  Widget build(BuildContext context) {
    final DateTime argument =
        ModalRoute.of(context)!.settings.arguments as DateTime;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          DateFormat.yMMMd().format(argument),
        ),
      ),
      body: Container(
        child: Text(argument.toIso8601String()),
      ),
    );
  }
}
