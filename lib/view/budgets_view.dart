import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/model/lib.dart';
import '/provider/data_provider.dart';
import '/view/budget_view.dart';
import '/widget/drawer/main_drawer.dart';

class BudgetsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budgets'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Consumer<DataProvider>(builder: (context, dataProvider, child) {
          List<Budget> budgets = dataProvider.getBudgets();
          return ListView.builder(
            itemCount: budgets.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(budgets[index].name),
                onTap: () {
                  print("Tap $index");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BudgetView(budgets[index]),
                    ),
                  );
                },
              );
            },
          );
        }),
      ),
    );
  }
}
