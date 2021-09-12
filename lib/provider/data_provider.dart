import 'package:brady_budget/database/lib.dart';
import 'package:flutter/foundation.dart' hide Category;

import '/debug/test_data.dart';
import '/model/lib.dart';

class DataProvider extends ChangeNotifier {
  final Map<int, Budget> _budgets = Map();
  final Map<int, Map<int, BudgetCategory>> _budgetCategories = Map();
  final Map<int, Category> _categories = Map();
  final Map<int, Transaction> _transactions = Map();
  final DatabaseAccessObject _dao = DatabaseAccessObject();

  DataProvider() {
    createTestData(_dao).then((_) => this.sync());
  }

  Future<void> sync() async {
    _budgets.clear();
    final budgets = await _dao.getAllBudgets();
    for (final budget in budgets) {
      _budgets[budget.budgetId!] = budget;
    }

    _budgetCategories.clear();
    final budgetCategories = await _dao.getAllBudgetCategories();
    for (final budgetCategory in budgetCategories) {
      if (!_budgetCategories.containsKey(budgetCategory.budgetId)) {
        _budgetCategories[budgetCategory.budgetId] = Map();
      }
      _budgetCategories[budgetCategory.budgetId]![budgetCategory.categoryId] =
          budgetCategory;
    }

    _categories.clear();
    final categories = await _dao.getAllCategories();
    for (final category in categories) {
      _categories[category.categoryId!] = category;
    }

    _transactions.clear();
    final transactions = await _dao.getAllTransactions();
    for (final transaction in transactions) {
      _transactions[transaction.transactionId!] = transaction;
    }

    notifyListeners();
  }

  List<Budget> getBudgets() {
    return _budgets.values.toList();
  }

  List<Category> getCategoriesForBudget(Budget budget) {
    Map<int, BudgetCategory> budgetCategories =
        _budgetCategories[budget.budgetId] ?? Map();
    return budgetCategories.keys
        .map((budgetCategoryId) => _categories[budgetCategoryId])
        .whereType<Category>()
        .toList();
  }

  List<Transaction> getTransactions() {
    return _transactions.values.toList();
  }
}
