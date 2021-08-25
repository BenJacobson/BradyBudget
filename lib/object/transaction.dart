import '/object/date.dart';

class Transaction {
  final int? transactionId;
  final int? categoryId;
  final int cents;
  final Date date;
  final String name;

  const Transaction({
    this.transactionId,
    this.categoryId,
    required this.cents,
    required this.date,
    required this.name,
  });

  @override
  String toString() {
    return 'Transaction(transactionId: $transactionId, categoryId: $categoryId,'
        ' cents: $cents, date: $date, name: $name)';
  }
}
