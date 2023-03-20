import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/presence_item.dart';
import '../data.dart';

class PresenceScreen extends StatefulWidget {
  static const routeName = '/presence';

  const PresenceScreen({super.key});

  @override
  State<PresenceScreen> createState() => _PresenceScreenState();
}

class _PresenceScreenState extends State<PresenceScreen> {
  var arrayOfNames = NOMES;

  @override
  Widget build(BuildContext context) {
    // final DateTime argument =
    //     ModalRoute.of(context)!.settings.arguments as DateTime;

    return Scaffold(
      appBar: AppBar(
        title: Text(
            // DateFormat.yMMMd().format(argument),
            'teste'),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        child: Column(
          children: [
            Text('Teste'),
            Text(
              // argument.toIso8601String(),
              'teste',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: arrayOfNames.length,
                itemBuilder: (context, index) => PresenceItem(
                  arrayOfNames[index].posto,
                  id: arrayOfNames[index].id,
                  nome: arrayOfNames[index].nome,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
