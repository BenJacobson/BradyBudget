class Category {
  final int categoryId;
  final String name;

  const Category({
    required this.categoryId,
    required this.name,
  });

  @override
  String toString() {
    return 'Category(categoryId: $categoryId, name: $name)';
  }
}
