import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/provider/data_provider.dart';
import '/view/budgets_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DataProvider(),
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
