class Category {
  final int categoryId;
  final String name;

  const Category({
    required this.categoryId,
    required this.name,
  });

  factory Category.fromRawCategory(Map<String, dynamic> rawCategory) {
    int categoryId = rawCategory['category_id'];
    String name = rawCategory['name'];

    return Category(
      categoryId: categoryId,
      name: name,
    );
  }

  Map<String, dynamic> toRawCategory() {
    return {
      'category_id': categoryId,
      'name': name,
    };
  }

  @override
  String toString() {
    StringBuffer buffer = StringBuffer();
    buffer.write("Category(");
    for (var entry in toRawCategory().entries) {
      buffer.write("${entry.key}: ${entry.value},");
    }
    buffer.write(")");
    return buffer.toString();
  }
}
