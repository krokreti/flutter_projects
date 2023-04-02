import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/model_button.dart';
import './presence.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _dateController = TextEditingController();
  var _selectedDate = DateTime.now();

  void dateHandlerInput() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 1),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = DateFormat.yMd().format(_selectedDate);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Presence'), elevation: 2),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _dateController,
              decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today),
                  labelText: 'Escolha a data'),
              readOnly: true,
              onTap: () {
                dateHandlerInput();
              },
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                ModelButton(
                  title: 'Início',
                  handleClick: () {
                    Navigator.of(context).pushNamed(PresenceScreen.routeName,
                        arguments: {
                          'mode': 'Início de Expediente',
                          'selectedDate': _selectedDate
                        });
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                ModelButton(
                  title: 'Término',
                  handleClick: () {
                    Navigator.of(context).pushNamed(PresenceScreen.routeName,
                        arguments: {
                          'mode': 'Término de Expediente',
                          'selectedDate': _selectedDate
                        });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
