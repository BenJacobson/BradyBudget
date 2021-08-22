import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import './data_commands.dart';

class DataManager {
  static Future<Database>? _db;

  Future<Database> _getDb() async {
    _db ??= _initDatabase();
    return _db!;
  }

  Future<void> awaitDb() async {
    await _getDb();
  }
}

Future<Database> _initDatabase() async {
  return openDatabase(
    join(await getDatabasesPath(), 'database.db'),
    onConfigure: (Database db) async {
      await db.execute(configureDatabase());
    },
    onCreate: (Database db, int version) async {
      await db.execute(createTableBudget());
      await db.execute(createTableCategory());
      await db.execute(createTableBudgetCategory());
      await db.execute(createTableTransaction());
    },
    version: 1,
  );
}
