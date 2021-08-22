import 'package:sqflite/sqflite.dart';

import '/data/model/budget_category.dart';

Future<void> createTableBudgetCategory(Database db) {
  return db.execute('''
    CREATE TABLE budget_category(
      budget_id INTEGER NOT NULL,
      category_id INTEGER NOT NULL,
      cents INTEGER NOT NULL,
      FOREIGN KEY (budget_id)
        REFERENCES budget (category_id),
      FOREIGN KEY (category_id)
        REFERENCES category (category_id) 
    );''');
}

BudgetCategory fromRawBudgetCategory(Map<String, dynamic> rawBudgetCategory) {
  int budgetId = rawBudgetCategory['budget_id'];
  int categoryId = rawBudgetCategory['category_id'];
  int cents = rawBudgetCategory['cents'];

  return BudgetCategory(
    budgetId: budgetId,
    categoryId: categoryId,
    cents: cents,
  );
}

Map<String, dynamic> toRawBudgetCategory(BudgetCategory budgetCategory) {
  return {
    'budget_id': budgetCategory.budgetId,
    'category_id': budgetCategory.categoryId,
    'cents': budgetCategory.cents,
  };
}