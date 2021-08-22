import 'package:brady_budget/data/model/date.dart';
import 'package:brady_budget/data/model/transaction.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Category', () {
    test('serialize and deserialize to the same value', () {
      final transaction = Transaction(
        transactionId: 14141414,
        categoryId: -1,
        cents: -1945,
        date: Date(
          year: 1950,
          month: 2,
          day: 28,
        ),
        name: "My transaction name!",
      );

      Transaction resultTransaction =
          Transaction.fromRawTransaction(transaction.toRawTransaction());

      expect(resultTransaction.transactionId, resultTransaction.transactionId);
      expect(resultTransaction.categoryId, resultTransaction.categoryId);
      expect(resultTransaction.cents, resultTransaction.cents);
      expect(resultTransaction.date.toInt(), resultTransaction.date.toInt());
      expect(resultTransaction.name, resultTransaction.name);
    });
  });
}
