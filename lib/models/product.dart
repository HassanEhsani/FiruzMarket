class Product {
  final String name;
  final int price;
  final String imageUrl;
  final String category;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] ?? '',
      price: map['price'] ?? 0,
      imageUrl: map['imageUrl'] ?? '',
      category: map['category'] ?? '',
    );
  }
}