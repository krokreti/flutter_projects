import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/presence_item.dart';
import '../models/person.dart';
import '../data.dart';

class PresenceScreen extends StatefulWidget {
  static const routeName = '/presence';

  const PresenceScreen({super.key});

  @override
  State<PresenceScreen> createState() => _PresenceScreenState();
}

class _PresenceScreenState extends State<PresenceScreen> {
  var arrayOfNames = NOMES;
  final List<Person> _filteredList = [];
  final _filterController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    // _filterController.addListener(_arrayOfNamesFiltering);
    _filteredList.addAll(arrayOfNames);
    _filterController.addListener(_filterList);
  }

  @override
  void dispose() {
    super.dispose();
    // _filterController.removeListener(_arrayOfNamesFiltering);
    _filterController.removeListener(_filterList);
  }

  void _filterList() {
    List<Person> filteredList = [];
    if (_filterController.text.length >= 3) {
      arrayOfNames.forEach((name) {
        if (name.nome
            .toLowerCase()
            .contains(_filterController.text.toLowerCase())) {
          filteredList.add(name);
        }
      });
    } else {
      filteredList.addAll(arrayOfNames);
    }
    setState(() {
      _filteredList.clear();
      _filteredList.addAll(filteredList);
    });
  }

  void _onDismissHandler(String id) {
    setState(() {
      _filteredList.removeWhere((name) => name.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final argument =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(
            // DateFormat.yMMMd().format(argument),
            argument['mode']),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        child: Column(
          children: [
            Text(
              'Lista de presença',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              DateFormat.yMMMd().format(argument['selectedDate']),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: _filterController,
                decoration: const InputDecoration(
                    icon: Icon(Icons.keyboard),
                    hintText: 'Digite para filtrar sua busca'),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredList.length,
                itemBuilder: (context, index) => PresenceItem(
                  _filteredList[index].posto,
                  id: _filteredList[index].id,
                  nome: _filteredList[index].nome,
                  removeItem: _onDismissHandler,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
