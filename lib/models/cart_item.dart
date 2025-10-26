class CartItem {
  final String id;
  final String name;
  final double price;
  final int quantity;
  final String imageUrl; // مسیر asset برای تست

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      quantity: map['quantity'] ?? 1,
      imageUrl: map['imageUrl'] ?? 'assets/images/placeholder.png',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
      'imageUrl': imageUrl,
    };
  }

  /// ✅ داده تستی برای استفاده در CartScreen
  static List<CartItem> demoItems = [
    CartItem(
      id: '1',
      name: 'سیب قرمز',
      price: 25000,
      quantity: 2,
      imageUrl: 'assets/images/apple.png',
    ),
    CartItem(
      id: '2',
      name: 'شیر تازه',
      price: 18000,
      quantity: 1,
      imageUrl: 'assets/images/milk.png',
    ),
    CartItem(
      id: '3',
      name: 'چیپس نمکی',
      price: 12000,
      quantity: 3,
      imageUrl: 'assets/images/chips.png',
    ),
  ];
}