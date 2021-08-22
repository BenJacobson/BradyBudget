import '/data/model/date.dart';

class Transaction {
  final int transactionId;
  final int categoryId;
  final int cents;
  final Date date;
  final String name;

  const Transaction({
    required this.transactionId,
    required this.categoryId,
    required this.cents,
    required this.date,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'transaction_id': transactionId,
      'category_id': categoryId,
      'cents': cents,
      'date': date.toInt(),
      'name': name,
    };
  }

  @override
  String toString() {
    StringBuffer buffer = StringBuffer();
    buffer.write("Transaction(");
    for (var entry in toMap().entries) {
      buffer.write("${entry.key}: ${entry.value},");
    }
    buffer.write(")");
    return buffer.toString();
  }
}
