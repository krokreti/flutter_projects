import 'package:flutter/material.dart';

import '../widgets/confirm_dialog.dart';

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
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          return showDialog(
            context: context,
            builder: (BuildContext context) {
              return ConfirmDialog();
            },
          );
        }
        return true;
      },
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
          Icons.close,
          color: Colors.white,
        ),
      ),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            title: Text(nome, style: Theme.of(context).textTheme.labelMedium),
            leading: CircleAvatar(child: Text(posto)),
            trailing: Text(id),
          ),
        ),
      ),
    );
  }
}
