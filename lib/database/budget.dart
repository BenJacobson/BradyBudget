part of database;

Future<void> _createTableBudget(DatabaseExecutor db) {
  return db.execute('''
    CREATE TABLE budget(
      budget_id INTEGER PRIMARY KEY,
      cents INTEGER NOT NULL,
      start_date INTEGER NOT NULL,
      end_date INTEGER NOT NULL,
      name TEXT NOT NULL
    );''');
}

Future<List<Budget>> _selectAllBudgets(DatabaseExecutor db) async {
  List<Map<String, dynamic>> rawBudgets = await db.query(
    'budget',
    columns: [
      'budget_id',
      'cents',
      'start_date',
      'end_date',
      'name',
    ],
  );
  return rawBudgets.map(_fromRawBudget).toList();
}

Future<Budget> _insertNewBudget(DatabaseExecutor db, Budget budget) {
  if (budget.budgetId != null) {
    throw ArgumentError('insertNewBudget budgetId must be null');
  }
  return _insertBudget(db, budget);
}

Future<Budget> _updateBudget(DatabaseExecutor db, Budget budget) {
  if (budget.budgetId == null) {
    throw ArgumentError('updateBudget budgetId must not be null');
  }
  return _insertBudget(db, budget);
}

Future<Budget> _insertBudget(DatabaseExecutor db, Budget budget) async {
  Map<String, dynamic> rawBudget = _toRawBudget(budget);
  int budgetId = await db.insert(
    'budget',
    rawBudget,
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  rawBudget['budget_id'] = budgetId;
  return _fromRawBudget(rawBudget);
}

Budget _fromRawBudget(Map<String, dynamic> rawBudget) {
  int? budgetId = rawBudget['budget_id'];
  int cents = rawBudget['cents'];
  Date startDate = _fromRawDate(rawBudget['start_date']);
  Date endDate = _fromRawDate(rawBudget['end_date']);
  String name = rawBudget['name'];

  return Budget(
    budgetId: budgetId,
    cents: cents,
    startDate: startDate,
    endDate: endDate,
    name: name,
  );
}

Map<String, dynamic> _toRawBudget(Budget budget) {
  return {
    'budget_id': budget.budgetId,
    'cents': budget.cents,
    'start_date': _toRawDate(budget.startDate),
    'end_date': _toRawDate(budget.endDate),
    'name': budget.name,
  };
}
