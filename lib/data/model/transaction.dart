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

  factory Transaction.fromRawTransaction(Map<String, dynamic> rawTransaction) {
    int transactionId = rawTransaction['transaction_id'];
    int categoryId = rawTransaction['category_id'];
    int cents = rawTransaction['cents'];
    Date date = Date.fromInt(rawTransaction['date']);
    String name = rawTransaction['name'];

    return Transaction(
      transactionId: transactionId,
      categoryId: categoryId,
      cents: cents,
      date: date,
      name: name,
    );
  }

  Map<String, dynamic> toRawTransaction() {
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
    for (var entry in toRawTransaction().entries) {
      buffer.write("${entry.key}: ${entry.value},");
    }
    buffer.write(")");
    return buffer.toString();
  }
}
