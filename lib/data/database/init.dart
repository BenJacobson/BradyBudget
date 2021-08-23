import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'budget.dart';
import 'budget_category.dart';
import 'category.dart';
import 'transaction.dart';

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
      await createTableBudget(db);
      await createTableCategory(db);
      await createTableBudgetCategory(db);
      await createTableTransaction(db);
    },
    version: 1,
  );
}

Future<void> _configureDatabase(Database db) {
  return db.execute('PRAGMA foreign_keys = ON;');
}
