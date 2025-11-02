class CartItem {
  final String id;
  final String name;
  final double price;
  final int quantity;
  final String imageUrl;
  final double? discountPrice;
  final bool selected;
  final String? deliveryType;
  final String? storeName;


  CartItem({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1,
    required this.imageUrl,
    this.discountPrice,
    this.selected = true,
    this.deliveryType,
    this.storeName,

  });

  CartItem copyWith({
    String? id,
    String? name,
    double? price,
    int? quantity,
    String? imageUrl,
    double? discountPrice,
    bool? selected,
    String? deliveryType,
    String? storeName,
  }) {
    return CartItem(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      imageUrl: imageUrl ?? this.imageUrl,
      discountPrice: discountPrice ?? this.discountPrice,
      selected: selected ?? this.selected,
      deliveryType: deliveryType ?? this.deliveryType,
      storeName: storeName ?? this.storeName,
    );
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      id: map['id']?.toString() ?? '',
      name: map['name']?.toString() ?? '',
      price: (map['price'] ?? 0).toDouble(),
      quantity: (map['quantity'] ?? 1) is int
          ? (map['quantity'] as int)
          : (map['quantity'] as num).toInt(),
      imageUrl: map['imageUrl']?.toString() ?? 'assets/images/placeholder.png',
      discountPrice: map['discountPrice'] != null
          ? (map['discountPrice'] as num).toDouble()
          : null,
      selected: map['selected'] ?? true,
      deliveryType: map['deliveryType']?.toString(),
      storeName: map['storeName']?.toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
      'imageUrl': imageUrl,
      'discountPrice': discountPrice,
      'selected': selected,
      'deliveryType': deliveryType,
      'storeName': storeName,
    };
  }

  @override
  String toString() {
    return 'CartItem(id: $id, name: $name, price: $price, quantity: $quantity, selected: $selected, store: $storeName)';
  }

  static List<CartItem> demoItems = [
    CartItem(
      id: '1',
      name: 'سیب قرمز',
      price: 25000.0,
      quantity: 2,
      imageUrl: 'assets/images/apple.png',
      discountPrice: 23000.0,
      deliveryType: 'ارسال فوری',
      storeName: 'میوه‌فروشی بهار',
    ),
    CartItem(
      id: '2',
      name: 'شیر تازه',
      price: 18000.0,
      quantity: 1,
      imageUrl: 'assets/images/milk.png',
      discountPrice: 17000.0,
      deliveryType: 'تحویل درب منزل',
      storeName: 'لبنیات پاک',
    ),
    CartItem(
      id: '3',
      name: 'چیپس نمکی',
      price: 12000.0,
      quantity: 3,
      imageUrl: 'assets/images/chips.png',
      storeName: 'سوپرمارکت شبانه',
    ),
  ];
}