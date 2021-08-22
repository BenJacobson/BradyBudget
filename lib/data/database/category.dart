import 'package:sqflite/sqflite.dart';

import '/data/model/category.dart';

Future<void> createTableCategory(Database db) {
  return db.execute('''
    CREATE TABLE category(
      category_id INTEGER PRIMARY KEY,
      name TEXT NOT NULL
    );''');
}

Category fromRawCategory(Map<String, dynamic> rawCategory) {
  int categoryId = rawCategory['category_id'];
  String name = rawCategory['name'];

  return Category(
    categoryId: categoryId,
    name: name,
  );
}

Map<String, dynamic> toRawCategory(Category category) {
  return {
    'category_id': category.categoryId,
    'name': category.name,
  };
}
