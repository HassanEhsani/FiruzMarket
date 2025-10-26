class Product {
  final String name;
  final int price; // قیمت نهایی با تخفیف
  final int? oldPrice; // قیمت اصلی قبل از تخفیف (اختیاری)
  final String imageUrl;
  final String category;
  final bool isFeatured; // برای نمایش برچسب "پیشنهاد ویژه"

  Product({
    required this.name,
    required this.price,
    this.oldPrice,
    required this.imageUrl,
    required this.category,
    this.isFeatured = false,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] ?? '',
      price: map['price'] ?? 0,
      oldPrice: map['oldPrice'],
      imageUrl: map['imageUrl'] ?? '',
      category: map['category'] ?? '',
      isFeatured: map['isFeatured'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'oldPrice': oldPrice,
      'imageUrl': imageUrl,
      'category': category,
      'isFeatured': isFeatured,
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