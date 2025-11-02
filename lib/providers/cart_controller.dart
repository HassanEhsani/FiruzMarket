import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartController with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  int get totalItems => _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice => _items.fold(
        0,
        (sum, item) => sum + (item.discountPrice ?? item.price) * item.quantity,
      );

  double get totalSavings => _items.fold(0, (sum, item) {
        if (item.discountPrice != null && item.discountPrice! < item.price) {
          return sum + (item.price - item.discountPrice!) * item.quantity;
        }
        return sum;
      });

  /// افزودن یک محصول به سبد
  void addItem(CartItem item) {
    final index = _items.indexWhere((i) => i.id == item.id);
    if (index >= 0) {
      _items[index] = _items[index].copyWith(
        quantity: _items[index].quantity + item.quantity,
      );
    } else {
      // اضافه کردن یک کپی از آیتم (برای جلوگیری از تغییر مرجع که ممکن است جای دیگری هم استفاده شود)
      _items.add(item.copyWith());
    }
    notifyListeners();
  }

  /// حذف کامل یک محصول
  void removeItem(CartItem item) {
    _items.removeWhere((i) => i.id == item.id);
    notifyListeners();
  }

  /// خالی کردن کامل سبد خرید
  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  /// انتخاب یا لغو انتخاب آیتم
  void toggleSelection(CartItem item) {
    final index = _items.indexWhere((i) => i.id == item.id);
    if (index >= 0) {
      _items[index] = _items[index].copyWith(selected: !_items[index].selected);
      notifyListeners();
    }
  }

  /// افزایش تعداد
  void increaseQuantity(CartItem item) {
    final index = _items.indexWhere((i) => i.id == item.id);
    if (index >= 0) {
      _items[index] = _items[index].copyWith(quantity: _items[index].quantity + 1);
      notifyListeners();
    }
  }

  /// کاهش تعداد
  void decreaseQuantity(CartItem item) {
    final index = _items.indexWhere((i) => i.id == item.id);
    if (index >= 0) {
      final current = _items[index];
      if (current.quantity > 1) {
        _items[index] = current.copyWith(quantity: current.quantity - 1);
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  /// انتخاب همه
  void selectAll() {
    for (int i = 0; i < _items.length; i++) {
      _items[i] = _items[i].copyWith(selected: true);
    }
    notifyListeners();
  }

  /// لغو انتخاب همه
  void deselectAll() {
    for (int i = 0; i < _items.length; i++) {
      _items[i] = _items[i].copyWith(selected: false);
    }
    notifyListeners();
  }

  /// گروه‌بندی آیتم‌ها بر اساس نام فروشگاه
  Map<String, List<CartItem>> get groupedByStore {
    final Map<String, List<CartItem>> grouped = {};
    for (var item in _items) {
      final store = item.storeName?.trim().isNotEmpty == true ? item.storeName! : 'بدون فروشگاه';
      grouped.putIfAbsent(store, () => []);
      grouped[store]!.add(item);
    }
    return grouped;
  }
}