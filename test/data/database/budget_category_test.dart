import 'package:brady_budget/data/database/budget_category.dart';
import 'package:brady_budget/data/model/budget_category.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BudgetCategory', () {
    test('serialize and deserialize to the same value', () {
      final budgetCategory = BudgetCategory(
        budgetId: 111,
        categoryId: 0,
        cents: 999999,
      );

      BudgetCategory resultBudgetCategory =
          fromRawBudgetCategory(toRawBudgetCategory(budgetCategory));

      expect(resultBudgetCategory.budgetId, budgetCategory.budgetId);
      expect(resultBudgetCategory.categoryId, budgetCategory.categoryId);
      expect(resultBudgetCategory.cents, budgetCategory.cents);
    });
  });
}
