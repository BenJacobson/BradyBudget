part of data_model;

class BudgetCategory {
  final int budgetId;
  final int categoryId;
  final int cents;

  const BudgetCategory({
    required this.budgetId,
    required this.categoryId,
    required this.cents,
  });

  @override
  String toString() {
    return 'BudgetCategory(budgetId: $budgetId, categoryId: $categoryId,'
        ' cents: $cents)';
  }
}
