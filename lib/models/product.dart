class Product {
  final String name;
  final String id;
  final int price;
  final int? oldPrice;
  final String imageUrl;
  final String category;
  final bool isFeatured;
  bool isFavorite;
  final String? storeName;

  Product({
    required this.name,
    required this.id,
    required this.price,
    this.oldPrice,
    required this.imageUrl,
    required this.category,
    this.isFeatured = false,
    this.isFavorite = false,
    this.storeName,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id']?.toString() ?? '', // ✅ اضافه شد
      name: map['name'] ?? '',
      price: (map['price'] ?? 0) is int
          ? map['price']
          : (map['price'] as num).toInt(), // برای اطمینان از نوع
      oldPrice: map['oldPrice'],
      imageUrl: map['imageUrl'] ?? '',
      category: map['category'] ?? '',
      isFeatured: map['isFeatured'] ?? false,
      isFavorite: map['isFavorite'] ?? false,
      storeName: map['storeName']?.toString(), // ✅ اضافه شد
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id, // ✅ اضافه شد
      'name': name,
      'price': price,
      'oldPrice': oldPrice,
      'imageUrl': imageUrl,
      'category': category,
      'isFeatured': isFeatured,
      'isFavorite': isFavorite,
      'storeName': storeName, // ✅ اضافه شد
    };
  }

  String get formattedPrice => '$price ₽';

  String? get formattedOldPrice =>
      oldPrice != null ? '$oldPrice ₽' : null;

  int? get discountPercent {
    if (oldPrice != null && oldPrice! > price) {
      final discount = ((oldPrice! - price) / oldPrice! * 100).round();
      return discount;
    }
    return null;
  }
}