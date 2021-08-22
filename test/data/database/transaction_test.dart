import 'package:brady_budget/data/database/date.dart';
import 'package:brady_budget/data/database/transaction.dart';
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
          fromRawTransaction(toRawTransaction(transaction));

      expect(resultTransaction.transactionId, transaction.transactionId);
      expect(resultTransaction.categoryId, transaction.categoryId);
      expect(resultTransaction.cents, transaction.cents);
      expect(toRawDate(resultTransaction.date), toRawDate(transaction.date));
      expect(resultTransaction.name, transaction.name);
    });
  });
}
