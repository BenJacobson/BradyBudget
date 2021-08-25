part of database;

Future<void> _createTableBudgetCategory(DatabaseExecutor db) {
  return db.execute('''
    CREATE TABLE budget_category(
      budget_id INTEGER NOT NULL,
      category_id INTEGER NOT NULL,
      cents INTEGER NOT NULL,
      FOREIGN KEY (budget_id)
        REFERENCES budget (budget_id),
      FOREIGN KEY (category_id)
        REFERENCES category (category_id) 
    );''');
}

Future<List<BudgetCategory>> _selectAllBudgetCategories(
    DatabaseExecutor db) async {
  List<Map<String, dynamic>> rawBudgetCategories = await db.query(
    'budget_category',
    columns: [
      'budget_id',
      'category_id',
      'cents',
    ],
  );
  return rawBudgetCategories.map(_fromRawBudgetCategory).toList();
}

Future<BudgetCategory> _insertNewBudgetCategory(
    DatabaseExecutor db, BudgetCategory budgetCategory) {
  return _insertBudgetCategory(db, budgetCategory);
}

Future<BudgetCategory> _updateBudgetCategory(
    DatabaseExecutor db, BudgetCategory budgetCategory) {
  return _insertBudgetCategory(db, budgetCategory);
}

Future<BudgetCategory> _insertBudgetCategory(
    DatabaseExecutor db, BudgetCategory budgetCategory) async {
  await db.insert(
    'budget_category',
    _toRawBudgetCategory(budgetCategory),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  return budgetCategory;
}

BudgetCategory _fromRawBudgetCategory(Map<String, dynamic> rawBudgetCategory) {
  int budgetId = rawBudgetCategory['budget_id'];
  int categoryId = rawBudgetCategory['category_id'];
  int cents = rawBudgetCategory['cents'];

  return BudgetCategory(
    budgetId: budgetId,
    categoryId: categoryId,
    cents: cents,
  );
}

Map<String, dynamic> _toRawBudgetCategory(BudgetCategory budgetCategory) {
  return {
    'budget_id': budgetCategory.budgetId,
    'category_id': budgetCategory.categoryId,
    'cents': budgetCategory.cents,
  };
}
