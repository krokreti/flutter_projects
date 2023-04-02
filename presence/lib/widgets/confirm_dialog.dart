import 'package:flutter/material.dart';

const List<String> itemList = [
  'Falta',
  'Dispensa da Chefia',
  'Consulta Médica',
  'Dispensa Médica',
  'Férias'
];

class ConfirmDialog extends StatefulWidget {
  final Function reasonHandler;

  const ConfirmDialog({
    super.key,
    required this.reasonHandler,
  });

  @override
  State<ConfirmDialog> createState() => _ConfirmDialogState();
}

class _ConfirmDialogState extends State<ConfirmDialog> {
  String _dropdownValue = itemList.first;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirmar'),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Fechar')),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(true);
              widget.reasonHandler(_dropdownValue);
            },
            child: const Text('Confirmar')),
      ],
      content: Container(
        height: 100,
        child: Column(
          children: [
            const Text('Escolha o motivo da falta:'),
            DropdownButton(
              value: _dropdownValue,
              elevation: 5,
              items: itemList.map<DropdownMenuItem>((value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _dropdownValue = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
