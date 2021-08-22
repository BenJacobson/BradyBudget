import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'budget.dart';
import 'budget_category.dart';
import 'category.dart';
import 'transaction.dart';

Future<Database> initDatabase() async {
  return openDatabase(
    join(await getDatabasesPath(), 'database.db'),
    onConfigure: (Database db) async {
      await configureDatabase(db);
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

Future<void> configureDatabase(Database db) {
  return db.execute('PRAGMA foreign_keys = ON;');
}
