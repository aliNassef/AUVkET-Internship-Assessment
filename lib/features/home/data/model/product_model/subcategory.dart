class Subcategory {
  final String? id;
  final String? name;
  final String? slug;
  final String? category;

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      category: json['category'] as String?,
    );
  }

  Subcategory(
      {required this.id,
      required this.name,
      required this.slug,
      required this.category});

  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}

// {
//                   "_id": "6407f1bcb575d3b90bf95797",
//                   "name": "Women's Clothing",
//                   "slug": "women's-clothing",
//                   "category": "6439d58a0049ad0b52b9003f"
//               }
