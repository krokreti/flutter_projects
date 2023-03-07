import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_empty_list.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList({this.transactions, this.deleteTransaction});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? TransactionEmptyList()
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              // return Card(
              //   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              //   elevation: 3,
              //   child: Row(
              //     children: [
              //       Container(
              //         margin:
              //             EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              //         decoration: BoxDecoration(
              //             border: Border.all(color: Colors.purple, width: 2)),
              //         padding: EdgeInsets.all(10),
              //         child: Text(
              //           '\$ ${transactions[index].amount.toStringAsFixed(2)}',
              //           style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //             fontSize: 15,
              //             color: Theme.of(context).primaryColor,
              //           ),
              //         ),
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(transactions[index].title,
              //               style: Theme.of(context).textTheme.titleMedium),
              //           Text(
              //             DateFormat.yMMMMd('en_US')
              //                 .format(transactions[index].date),
              //             style: TextStyle(
              //               color: Theme.of(context).primaryColor,
              //               fontSize: 10,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // );
              return TransactionItem(
                  transaction: transactions[index],
                  deleteTransaction: deleteTransaction);
            },
          );
  }
}
