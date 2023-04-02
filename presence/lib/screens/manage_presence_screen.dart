import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ManagePresenceScreen extends StatelessWidget {
  static const routeName = '/manage-presence';
  const ManagePresenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('This is the management screen!'),
    );
  }
}
