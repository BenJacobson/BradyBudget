import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/model/lib.dart';
import '/provider/data_provider.dart';
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
        child: Consumer<DataProvider>(builder: (context, dataProvider, child) {
          List<Transaction> transactions = dataProvider.getTransactions();
          return ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(transactions[index].name),
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
