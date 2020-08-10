import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransactionForm extends StatefulWidget {
  final Function _addNewTransaction;

  NewTransactionForm(this._addNewTransaction);

  @override
  _NewTransactionFormState createState() => _NewTransactionFormState();
}

class _NewTransactionFormState extends State<NewTransactionForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              children: <Widget>[
                Text(
                  'New Transaction',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        isDense: true,
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Title',
                      ),
                      controller: _titleController,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        isDense: true,
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Amount',
                      ),
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Text(
                            _selectedDate == null
                                ? 'No date chosen!'
                                : DateFormat.yMMMd().format(_selectedDate),
                          ),
                          FlatButton(
                            textColor: Colors.deepPurpleAccent,
                            onPressed: _presentDatePicker,
                            child: const Text('Choose Date'),
                          ),
                        ],
                      ),
                    ),
                    RaisedButton(
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      onPressed: () {
                        widget._addNewTransaction(
                          _titleController.text,
                          double.parse(_amountController.text),
                          _selectedDate,
                        );
                        Navigator.of(context).pop();
                      },
                      child: const Text('Add Transaction'),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
