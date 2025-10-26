import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';

class ProductController with ChangeNotifier {
  final List<Product> _products = [];

  List<Product> get products => _products;

  /// 🔹 استریم Firestore (در صورت فعال بودن Firebase)
  Stream<List<Product>> get productStream {
    try {
      final firestore = FirebaseFirestore.instance;
      return firestore
          .collection('products')
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => Product.fromMap(doc.data()))
              .toList());
    } catch (e) {
      // اگر Firestore مقداردهی نشده یا خطا داشت، استریم خالی برگردون
      return const Stream.empty();
    }
  }

  /// 🔹 افزودن محصولات تستی به‌صورت محلی
  void initSampleProducts() {
    _products.addAll([
      Product(
        name: 'تی‌شرت سفید',
        price: 320,
        imageUrl: 'assets/images/tshirt.png',
        category: 'پوشاک',
      ),
      Product(
        name: 'شلوار جین',
        price: 580,
        imageUrl: 'assets/images/jeans.png',
        category: 'پوشاک',
      ),
      Product(
        name: 'گوشی هوشمند',
        price: 8900,
        imageUrl: 'assets/images/phone.png',
        category: 'دیجیتال',
      ),
      Product(
        name: 'لپ‌تاپ Core i5',
        price: 19800,
        imageUrl: 'assets/images/laptop.png',
        category: 'دیجیتال',
      ),
    ]);
    notifyListeners();
  }

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    _products.remove(product);
    notifyListeners();
  }

  void updateProduct(int index, Product updatedProduct) {
    if (index >= 0 && index < _products.length) {
      _products[index] = updatedProduct;
      notifyListeners();
    }
  }

  void clearProducts() {
    _products.clear();
    notifyListeners();
  }
}