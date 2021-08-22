import 'dart:async';

import 'package:sqflite/sqflite.dart';

import '/data/database/exports.dart' as database;
import '/data/model/budget.dart';

class DataManager {
  static Future<Database>? _db;

  Future<Database> _getDb() async {
    _db ??= database.initDatabase();
    return _db!;
  }

  Future<Budget> insertBudget(Budget budget) async {
    var db = await _getDb();
    return database.insertBudget(db, budget);
  }

  Future<List<Budget>> getAllBudgets() async {
    var db = await _getDb();
    List<Map<String, dynamic>> rawBudgets = await database.selectAllBudgets(db);
    return rawBudgets.map(database.fromRawBudget).toList();
  }
}
