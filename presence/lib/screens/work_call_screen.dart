import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/model_button.dart';
import './presence.dart';

class WorkCallScreen extends StatefulWidget {
  static const routeName = '/work-call';
  const WorkCallScreen({super.key});

  @override
  State<WorkCallScreen> createState() => _WorkCallScreenState();
}

class _WorkCallScreenState extends State<WorkCallScreen> {
  final _dateController = TextEditingController();
  var _selectedDate = DateTime.now();
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = [
    WorkCallScreen(),
    PresenceScreen(),
  ];

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

  void _onItensTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: _dateController,
            decoration: const InputDecoration(
                icon: Icon(Icons.calendar_today), labelText: 'Escolha a data'),
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
    );
  }
}
