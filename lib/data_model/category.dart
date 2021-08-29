part of data_model;

class Category {
  final int? categoryId;
  final String name;

  const Category({
    this.categoryId,
    required this.name,
  });

  @override
  String toString() {
    return 'Category(categoryId: $categoryId, name: $name)';
  }
}
