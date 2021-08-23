import '/data/model/date.dart';

class Budget {
  final int? budgetId;
  final int cents;
  final Date startDate;
  final Date endDate;
  final String name;

  const Budget({
    this.budgetId,
    required this.cents,
    required this.startDate,
    required this.endDate,
    required this.name,
  });

  @override
  String toString() {
    return 'Budget(budgetId: $budgetId, cents: $cents, startDate: $startDate,'
        ' endDate: $endDate, name: $name)';
  }
}
