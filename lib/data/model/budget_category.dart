class BudgetCategory {
  final int budgetId;
  final int categoryId;
  final int cents;

  const BudgetCategory({
    required this.budgetId,
    required this.categoryId,
    required this.cents,
  });

  Map<String, dynamic> toMap() {
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
    for (var entry in toMap().entries) {
      buffer.write("${entry.key}: ${entry.value},");
    }
    buffer.write(")");
    return buffer.toString();
  }
}
