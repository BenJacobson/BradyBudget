import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/model/budgets_model.dart';
import '/view/budgets_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BudgetsModel(),
      child: MaterialApp(
        title: 'Brady Budget',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: BudgetsView(),
      ),
    ),
  );
}
