import 'package:brady_budget/data/model/date.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Date', () {
    test('serialize and deserialize to the same value', () {
      final date = Date(
        year: 3000,
        month: 5,
        day: 17,
      );

      Date resultDate = Date.fromInt(date.toInt());

      expect(resultDate.year, date.year);
      expect(resultDate.month, date.month);
      expect(resultDate.day, date.day);
    });
  });
}
