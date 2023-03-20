import 'package:flutter/material.dart';

class PresenceItem extends StatelessWidget {
  final String nome;
  final String id;
  final String posto;
  const PresenceItem(
    this.posto, {
    super.key,
    required this.nome,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      secondaryBackground: Container(
        color: Colors.green,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
        child: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            title: Text(nome),
            leading: Text(posto),
            trailing: Text(id),
          ),
        ),
      ),
    );
  }
}
