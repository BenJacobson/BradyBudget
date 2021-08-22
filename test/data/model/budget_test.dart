import 'package:brady_budget/data/model/budget.dart';
import 'package:brady_budget/data/model/date.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Budget', () {
    test('serialize and deserialize to the same value', () {
      final budget = Budget(
        budgetId: 47,
        cents: 130,
        startDate: Date(
          year: 2050,
          month: 12,
          day: 31,
        ),
        endDate: Date(
          year: 3000,
          month: 1,
          day: 1,
        ),
      );

      Budget resultBudget = Budget.fromRawBudget(budget.toRawBudget());

      expect(resultBudget.budgetId, budget.budgetId);
      expect(resultBudget.cents, budget.cents);
      expect(resultBudget.startDate.toInt(), budget.startDate.toInt());
      expect(resultBudget.endDate.toInt(), budget.endDate.toInt());
    });
  });
}
