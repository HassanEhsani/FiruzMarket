import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartController with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    final index = _items.indexWhere((i) => i.id == item.id);
    if (index >= 0) {
      _items[index] = CartItem(
        id: item.id,
        name: item.name,
        price: item.price,
        quantity: _items[index].quantity + item.quantity,
        imageUrl: item.imageUrl, // ✅ اصلاح شد
      );
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  double get totalPrice =>
      _items.fold(0, (sum, item) => sum + item.price * item.quantity);

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}