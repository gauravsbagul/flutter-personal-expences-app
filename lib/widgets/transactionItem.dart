import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expences_app/modals/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;

  @override
  void initState() {
    const availableColor = [
      Colors.red,
      Colors.black,
      Colors.purple,
      Colors.blue,
      Colors.yellow
    ];

    _bgColor = availableColor[Random().nextInt(5)];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text(
                '\$${widget.transaction.amount.toStringAsFixed(2)}',
              ),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMEd().format(widget.transaction.date),
          style: TextStyle(
              color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        trailing: MediaQuery.of(context).size.width > 340
            ? FlatButton.icon(
                textColor: Theme.of(context).errorColor,
                onPressed: () =>
                    widget.deleteTransaction(widget.transaction.id),
                icon: Icon(Icons.delete),
                label: Text('Delete'),
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () =>
                    widget.deleteTransaction(widget.transaction.id),
              ),
      ),
    );
  }
}
