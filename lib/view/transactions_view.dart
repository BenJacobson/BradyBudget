import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/model/budgets_model.dart';
import '/widget/drawer/main_drawer.dart';

class TransactionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Consumer<BudgetsModel>(builder: (context, budgetsModel, child) {
          return ListView.builder(
            itemCount: budgetsModel.transactionsLength,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(budgetsModel.getTransactions()[index].name),
                onTap: () {
                  print("Tap $index");
                },
              );
            },
          );
        }),
      ),
    );
  }
}
