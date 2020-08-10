import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  List<Map<String, Color>> barUnit(context) {
    return List.generate(10, (index) {
      Color color = index < (spendingPctOfTotal * 100) / 10
          ? Theme.of(context).primaryColor
          : Colors.grey[200];
      return {'color': color};
    }).reversed.toList();
  }

  final double chartWidth = 30;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 5),
                height: constraints.maxHeight * 0.07,
                child: FittedBox(
                  child: Text(spendingAmount.toStringAsFixed(0)),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 5)),
              ...barUnit(context).map((tx) {
                return Container(
                  height: constraints.maxHeight * 0.06,
                  width: chartWidth,
                  color: tx['color'],
                );
              }),
              Container(
                padding: EdgeInsets.only(top: 5),
                height: constraints.maxHeight * 0.07,
                child: FittedBox(
                  child: Text(label),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
