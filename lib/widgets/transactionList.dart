import 'package:flutter/material.dart';

import '../modals/transaction.dart';
import 'package:personal_expences_app/widgets/transactionItem.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    'No Transaction added yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/image/waiting.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView(
            children: transactions
                .map(
                  (tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      transaction: tx,
                      deleteTransaction: deleteTransaction),
                )
                .toList());
  }
}
