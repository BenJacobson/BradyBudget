import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '/data/database/commands.dart';
import '/data/model/budget.dart';

class DataManager {
  static Future<Database>? _db;

  Future<Database> _getDb() async {
    _db ??= openDatabase(
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

    return _db!;
  }

  Future<List<Budget>> getBudgets() async {
    var db = await _getDb();
    List<Map<String, dynamic>> rawBudgets =
        await db.rawQuery(selectAllBudgets());
    return rawBudgets.map(Budget.fromRawBudget).toList();
  }
}
