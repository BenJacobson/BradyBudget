import 'package:sqflite/sqflite.dart';

import '/data/model/category.dart';

Future<void> createTableCategory(DatabaseExecutor db) {
  return db.execute('''
    CREATE TABLE category(
      category_id INTEGER PRIMARY KEY,
      name TEXT NOT NULL
    );''');
}

Future<List<Category>> selectAllCategories(DatabaseExecutor db) async {
  List<Map<String, dynamic>> rawCategories = await db.query(
    'category',
    columns: [
      'category_id',
      'name',
    ],
  );
  return rawCategories.map(fromRawCategory).toList();
}

Future<Category> insertNewCategory(DatabaseExecutor db, Category category) {
  if (category.categoryId != null) {
    throw ArgumentError('insertNewCategory categoryId must be null');
  }
  return _insertCategory(db, category);
}

Future<Category> updateCategory(DatabaseExecutor db, Category category) {
  if (category.categoryId == null) {
    throw ArgumentError('updateCategory categoryId must not be null');
  }
  return _insertCategory(db, category);
}

Future<Category> _insertCategory(DatabaseExecutor db, Category category) async {
  int categoryId = await db.insert(
    'category',
    toRawCategory(category),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  return Category(
    categoryId: categoryId,
    name: category.name,
  );
}

Category fromRawCategory(Map<String, dynamic> rawCategory) {
  int? categoryId = rawCategory['category_id'];
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
