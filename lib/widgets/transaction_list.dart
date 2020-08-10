import 'package:expense_planner/models/transaction.dart';
import 'package:expense_planner/widgets/transaction_card.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function _deleteTransactionHandler;

  TransactionList(this._transactions, this._deleteTransactionHandler);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return _transactions.isEmpty
            ? Column(
                children: <Widget>[
                  Center(
                    child: Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/no_data.png',
                      ),
                    ),
                  ),
                  Text(
                    'No transaction added yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  Transaction tx = _transactions[index];
                  return Card(
                    key: ValueKey(tx.id),
                    child: TransactionCard(key, tx, _deleteTransactionHandler),
                  );
                },
                itemCount: _transactions.length,
              );
      },
    );
  }
}
