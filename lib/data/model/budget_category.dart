class BudgetCategory {
  final int budgetId;
  final int categoryId;
  final int cents;

  const BudgetCategory({
    required this.budgetId,
    required this.categoryId,
    required this.cents,
  });

  factory BudgetCategory.fromRawBudgetCategory(
      Map<String, dynamic> rawBudgetCategory) {
    int budgetId = rawBudgetCategory['budget_id'];
    int categoryId = rawBudgetCategory['category_id'];
    int cents = rawBudgetCategory['cents'];

    return BudgetCategory(
      budgetId: budgetId,
      categoryId: categoryId,
      cents: cents,
    );
  }

  Map<String, dynamic> toRawBudgetCategory() {
    return {
      'budget_id': budgetId,
      'category_id': categoryId,
      'cents': cents,
    };
  }

  @override
  String toString() {
    StringBuffer buffer = StringBuffer();
    buffer.write("BudgetCategory(");
    for (var entry in toRawBudgetCategory().entries) {
      buffer.write("${entry.key}: ${entry.value},");
    }
    buffer.write(")");
    return buffer.toString();
  }
}
