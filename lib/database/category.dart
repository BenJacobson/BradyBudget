part of database;

Future<void> _createTableCategory(DatabaseExecutor db) {
  return db.execute('''
    CREATE TABLE category(
      category_id INTEGER PRIMARY KEY,
      name TEXT NOT NULL
    );''');
}

Future<List<Category>> _selectAllCategories(DatabaseExecutor db) async {
  List<Map<String, dynamic>> rawCategories = await db.query(
    'category',
    columns: [
      'category_id',
      'name',
    ],
  );
  return rawCategories.map(_fromRawCategory).toList();
}

Future<Category> _insertNewCategory(DatabaseExecutor db, Category category) {
  if (category.categoryId != null) {
    throw ArgumentError('insertNewCategory categoryId must be null');
  }
  return _insertCategory(db, category);
}

Future<Category> _updateCategory(DatabaseExecutor db, Category category) {
  if (category.categoryId == null) {
    throw ArgumentError('updateCategory categoryId must not be null');
  }
  return _insertCategory(db, category);
}

Future<Category> _insertCategory(DatabaseExecutor db, Category category) async {
  int categoryId = await db.insert(
    'category',
    _toRawCategory(category),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  return Category(
    categoryId: categoryId,
    name: category.name,
  );
}

Future<void> _deleteAllCategories(DatabaseExecutor db) async {
  await db.delete('category');
}

Category _fromRawCategory(Map<String, dynamic> rawCategory) {
  int? categoryId = rawCategory['category_id'];
  String name = rawCategory['name'];

  return Category(
    categoryId: categoryId,
    name: name,
  );
}

Map<String, dynamic> _toRawCategory(Category category) {
  return {
    'category_id': category.categoryId,
    'name': category.name,
  };
}
