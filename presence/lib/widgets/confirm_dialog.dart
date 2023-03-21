import 'package:flutter/material.dart';

const List<String> itemList = [
  'Falta',
  'Dispensa da Chefia',
  'Consulta Médica',
  'Dispensa Médica',
  'Férias'
];

class ConfirmDialog extends StatefulWidget {
  const ConfirmDialog({
    super.key,
  });

  @override
  State<ConfirmDialog> createState() => _ConfirmDialogState();
}

class _ConfirmDialogState extends State<ConfirmDialog> {
  String dropdownValue = itemList.first;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirmar'),
      content: Container(
        height: 100,
        child: Column(
          children: [
            const Text('Escolha o motivo da falta:'),
            DropdownButton(
              value: dropdownValue,
              elevation: 5,
              items: itemList.map<DropdownMenuItem>((value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Fechar')),
        ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Confirmar')),
      ],
    );
  }
}
