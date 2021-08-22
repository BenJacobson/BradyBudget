import 'package:sqflite/sqflite.dart';

import '/data/model/budget.dart';
import '/data/model/date.dart';
import 'date.dart';

Future<void> createTableBudget(Database db) {
  return db.execute('''
    CREATE TABLE budget(
      budget_id INTEGER PRIMARY KEY,
      cents INTEGER NOT NULL,
      start_date INTEGER NOT NULL,
      end_date INTEGER NOT NULL
    );''');
}

Future<List<Map<String, dynamic>>> selectAllBudgets(Database db) {
  return db.rawQuery('''
    SELECT
      budget_id,
      cents,
      start_date,
      end_date
    FROM
      budget
    ;''');
}

Future<Budget> insertBudget(Database db, Budget budget) async {
  Map<String, dynamic> rawBudget = toRawBudget(budget);
  rawBudget.remove('budget_id');
  int budgetId = await db.insert('budget', rawBudget);
  rawBudget['budget_id'] = budgetId;
  return fromRawBudget(rawBudget);
}

Budget fromRawBudget(Map<String, dynamic> rawBudget) {
  int budgetId = rawBudget['budget_id'];
  int cents = rawBudget['cents'];
  Date startDate = fromRawDate(rawBudget['start_date']);
  Date endDate = fromRawDate(rawBudget['end_date']);

  return Budget(
    budgetId: budgetId,
    cents: cents,
    startDate: startDate,
    endDate: endDate,
  );
}

Map<String, dynamic> toRawBudget(Budget budget) {
  return {
    'budget_id': budget.budgetId,
    'cents': budget.cents,
    'start_date': toRawDate(budget.startDate),
    'end_date': toRawDate(budget.endDate),
  };
}
