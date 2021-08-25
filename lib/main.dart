import 'package:brady_budget/model/budgets_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => BudgetsModel(),
    child: MaterialApp(
      title: 'Brady Budget',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
    ),
  ));
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brady Budget'),
      ),
      body: Center(
        child: Consumer<BudgetsModel>(
          builder: (context, budgets, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: budgets.getBudgets().map((budget) {
                return Text("${budget.name}");
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
