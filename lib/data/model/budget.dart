import '/data/model/date.dart';

class Budget {
  final int budgetId;
  final int cents;
  final Date startDate;
  final Date endDate;

  const Budget({
    required this.budgetId,
    required this.cents,
    required this.startDate,
    required this.endDate,
  });

  factory Budget.fromRawBudget(Map<String, dynamic> rawBudget) {
    int budgetId = rawBudget['budget_id'];
    int cents = rawBudget['cents'];
    Date startDate = Date.fromInt(rawBudget['start_date']);
    Date endDate = Date.fromInt(rawBudget['end_date']);

    return Budget(
      budgetId: budgetId,
      cents: cents,
      startDate: startDate,
      endDate: endDate,
    );
  }

  Map<String, dynamic> toRawBudget() {
    return {
      'budget_id': budgetId,
      'cents': cents,
      'start_date': startDate.toInt(),
      'end_date': endDate.toInt(),
    };
  }

  @override
  String toString() {
    StringBuffer buffer = StringBuffer();
    buffer.write("Budget(");
    for (var entry in toRawBudget().entries) {
      buffer.write("${entry.key}: ${entry.value},");
    }
    buffer.write(")");
    return buffer.toString();
  }
}
