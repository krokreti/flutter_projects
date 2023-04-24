import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(label: Text('Title')),
            controller: _titleController,
          ),
          TextField(
            keyboardAppearance: Brightness.dark,
            keyboardType: TextInputType.number,
            decoration:
                const InputDecoration(prefixText: '\$ ', label: Text('Amount')),
            controller: _amountController,
          ),
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    // Navigator.of(context).pop();
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              ElevatedButton(
                  onPressed: () {}, child: const Text('Save Expense'))
            ],
          ),
        ],
      ),
    );
  }
}
