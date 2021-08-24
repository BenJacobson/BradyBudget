import 'dart:async';

import '/data/database/exports.dart' as database;
import '/data/model/exports.dart';

class DataManager {
  final Map<int, Budget> _budgets = Map();
  final Map<int, Map<int, BudgetCategory>> _budgetCategories = Map();
  final Map<int, Category> _categories = Map();
  final Map<int, Transaction> _transactions = Map();
  Future<void>? _init;

  Future<void> init() {
    if (_init == null) {
      _init = database.getDb().then((db) {
        db.transaction((txn) async {
          final budgets = await database.selectAllBudgets(txn);
          for (final budget in budgets) {
            _budgets[budget.budgetId!] = budget;
          }

          final budgetCategories =
              await database.selectAllBudgetCategories(txn);
          for (final budgetCategory in budgetCategories) {
            if (!_budgetCategories.containsKey(budgetCategory.budgetId)) {
              _budgetCategories[budgetCategory.budgetId] = Map();
            }
            _budgetCategories[budgetCategory.budgetId]![
                budgetCategory.categoryId] = budgetCategory;
          }

          final categories = await database.selectAllCategories(txn);
          for (final category in categories) {
            _categories[category.categoryId!] = category;
          }

          final transactions = await database.selectAllTransactions(txn);
          for (final transaction in transactions) {
            _transactions[transaction.transactionId!] = transaction;
          }
        });
      });
    }
    return _init!;
  }

  // TODO: use the cache!

  Future<Budget> insertNewBudget(Budget budget) async {
    await init();
    final db = await database.getDb();
    return database.insertNewBudget(db, budget);
  }

  Future<Budget> updateBudget(Budget budget) async {
    await init();
    final db = await database.getDb();
    return database.updateBudget(db, budget);
  }

  Future<List<Budget>> getAllBudgets() async {
    await init();
    final db = await database.getDb();
    return database.selectAllBudgets(db);
  }

  Future<Category> insertNewCategory(Category category) async {
    await init();
    final db = await database.getDb();
    return database.insertNewCategory(db, category);
  }

  Future<Category> updateCategory(Category category) async {
    await init();
    final db = await database.getDb();
    return database.updateCategory(db, category);
  }

  Future<List<Category>> getAllCategories() async {
    await init();
    final db = await database.getDb();
    return database.selectAllCategories(db);
  }

  Future<BudgetCategory> insertNewBudgetCategory(
      BudgetCategory budgetCategory) async {
    await init();
    final db = await database.getDb();
    return database.insertNewBudgetCategory(db, budgetCategory);
  }

  Future<BudgetCategory> updateBudgetCategory(
      BudgetCategory budgetCategory) async {
    await init();
    final db = await database.getDb();
    return database.updateBudgetCategory(db, budgetCategory);
  }

  Future<Transaction> insertNewTransaction(Transaction transaction) async {
    await init();
    final db = await database.getDb();
    return database.insertNewTransaction(db, transaction);
  }

  Future<Transaction> updateTransaction(Transaction transaction) async {
    await init();
    final db = await database.getDb();
    return database.updateTransaction(db, transaction);
  }
}
