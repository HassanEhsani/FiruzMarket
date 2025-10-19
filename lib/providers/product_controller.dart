import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';

class ProductController with ChangeNotifier {
  final List<Product> _products = [];

  List<Product> get products => _products;

  /// 🔹 Real-time stream from Firestore
  Stream<List<Product>> get productStream {
    return FirebaseFirestore.instance
        .collection('products')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Product.fromMap(doc.data()))
            .toList());
  }

  /// 🔹 Local product management (optional)
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