import 'package:brady_budget/data/database/category.dart';
import 'package:brady_budget/data/model/category.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Category', () {
    test('serialize and deserialize to the same value', () {
      final category = Category(
        categoryId: 0,
        name: "My category name",
      );

      Category resultCategory = fromRawCategory(toRawCategory(category));

      expect(resultCategory.categoryId, category.categoryId);
      expect(resultCategory.name, category.name);
    });
  });
}
