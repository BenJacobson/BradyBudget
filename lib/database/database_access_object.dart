part of database;

class DatabaseAccessObject {
  Future<Budget> insertNewBudget(Budget budget) async {
    final db = await getDb();
    return _insertNewBudget(db, budget);
  }

  Future<Budget> updateBudget(Budget budget) async {
    final db = await getDb();
    return _updateBudget(db, budget);
  }

  Future<List<Budget>> getAllBudgets() async {
    final db = await getDb();
    return _selectAllBudgets(db);
  }

  Future<void> deleteAllBudgets() async {
    final db = await getDb();
    return _deleteAllBudgets(db);
  }

  Future<BudgetCategory> insertNewBudgetCategory(
      BudgetCategory budgetCategory) async {
    final db = await getDb();
    return _insertNewBudgetCategory(db, budgetCategory);
  }

  Future<BudgetCategory> updateBudgetCategory(
      BudgetCategory budgetCategory) async {
    final db = await getDb();
    return _updateBudgetCategory(db, budgetCategory);
  }

  Future<List<BudgetCategory>> getAllBudgetCategories() async {
    final db = await getDb();
    return _selectAllBudgetCategories(db);
  }

  Future<void> deleteAllBudgetCategories() async {
    final db = await getDb();
    return _deleteAllBudgetCategories(db);
  }

  Future<Category> insertNewCategory(Category category) async {
    final db = await getDb();
    return _insertNewCategory(db, category);
  }

  Future<Category> updateCategory(Category category) async {
    final db = await getDb();
    return _updateCategory(db, category);
  }

  Future<List<Category>> getAllCategories() async {
    final db = await getDb();
    return _selectAllCategories(db);
  }

  Future<void> deleteAllCategories() async {
    final db = await getDb();
    return _deleteAllCategories(db);
  }

  Future<Transaction> insertNewTransaction(Transaction transaction) async {
    final db = await getDb();
    return _insertNewTransaction(db, transaction);
  }

  Future<Transaction> updateTransaction(Transaction transaction) async {
    final db = await getDb();
    return _updateTransaction(db, transaction);
  }

  Future<List<Transaction>> getAllTransactions() async {
    final db = await getDb();
    return _selectAllTransactions(db);
  }

  Future<void> deleteAllTransactions() async {
    final db = await getDb();
    return _deleteAllTransactions(db);
  }

  Future<void> deleteAll() async {
    await deleteAllTransactions();
    await deleteAllBudgetCategories();
    await deleteAllCategories();
    await deleteAllBudgets();
  }
}
