part of database;

Future<Database>? _db;

Future<Database> getDb() async {
  _db ??= _initDatabase();
  return _db!;
}

Future<Database> _initDatabase() async {
  return openDatabase(
    join(await getDatabasesPath(), 'database.db'),
    onConfigure: (Database db) async {
      await _configureDatabase(db);
    },
    onCreate: (Database db, int version) async {
      await _createTableBudget(db);
      await _createTableCategory(db);
      await _createTableBudgetCategory(db);
      await _createTableTransaction(db);
    },
    version: 1,
  );
}

Future<void> _configureDatabase(Database db) {
  return db.execute('PRAGMA foreign_keys = ON;');
}
