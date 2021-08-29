import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/model/budgets_model.dart';
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
        child: Consumer<BudgetsModel>(builder: (context, budgetsModel, child) {
          return ListView.builder(
            itemCount: budgetsModel.budgetsLength,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(budgetsModel.getBudgets()[index].name),
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
