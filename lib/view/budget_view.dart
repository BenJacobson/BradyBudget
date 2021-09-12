import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/model/lib.dart';
import '/provider/data_provider.dart';
import '/widget/drawer/main_drawer.dart';

class BudgetView extends StatelessWidget {
  final budget;

  BudgetView(this.budget);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.budget.name),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Consumer<DataProvider>(builder: (context, dataProvider, child) {
          List<Category> categories =
              dataProvider.getCategoriesForBudget(budget);
          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(categories[index].name),
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
