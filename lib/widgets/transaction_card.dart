import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final _tx;
  final Function _deleteTransactionHandler;

  TransactionCard(Key key, this._tx, this._deleteTransactionHandler)
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      leading: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          '\$${_tx.amount.toStringAsFixed(2)}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).primaryColorDark,
            width: 2,
          ),
        ),
      ),
      title: Text(
        _tx.title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        DateFormat().format(_tx.date),
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        highlightColor: Theme.of(context).errorColor,
        onPressed: () {
          _deleteTransactionHandler(_tx);
        },
      ),
    );
    // return Card(
    //   child: Row(
    //     children: <Widget>[
    //       Container(
    //         margin: EdgeInsets.symmetric(
    //           vertical: 10,
    //           horizontal: 15,
    //         ),
    //         padding: EdgeInsets.all(10),
    //         child: Text(
    //           '\$${_tx.amount.toStringAsFixed(2)}',
    //           style: TextStyle(
    //             fontWeight: FontWeight.bold,
    //             fontSize: 20,
    //             color: Theme.of(context).primaryColorDark,
    //           ),
    //         ),
    //         decoration: BoxDecoration(
    //           border: Border.all(
    //             color: Theme.of(context).primaryColorDark,
    //             width: 2,
    //           ),
    //         ),
    //       ),
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: <Widget>[
    //           Text(
    //             _tx.title,
    //             style: TextStyle(
    //               fontSize: 16,
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //           Text(
    //             DateFormat().format(_tx.date),
    //             style: TextStyle(
    //               color: Colors.grey,
    //             ),
    //           )
    //         ],
    //       ),
    //       Align(
    //         alignment: Alignment.centerRight,
    //         child: IconButton(
    //           icon: Icon(Icons.delete),
    //           onPressed: () {
    //             _deleteTransactionHandler(_tx);
    //           },
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
