import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryController extends ChangeNotifier {
  List<String> _categories = [];
  bool isLoaded = false;

  List<String> get categories => List.unmodifiable(_categories);

  Stream<List<String>> get categoryStream => FirebaseFirestore.instance
      .collection('categories')
      .snapshots()
      .map((snapshot) {
    final newList = <String>[];
    for (var doc in snapshot.docs) {
      final name = doc['name']?.toString().trim();
      if (name != null && name.isNotEmpty) {
        newList.add(name);
      }
    }

    // فقط اگر لیست تغییر کرده باشه، به‌روزرسانی کن
    if (_categories.join(',') != newList.join(',')) {
      _categories = newList;
      isLoaded = true;
      debugPrint('📡 دسته‌ها به‌صورت real-time دریافت شدند: $_categories');
      notifyListeners();
    }

    return newList;
  });

  Future<void> addCategory(String name) async {
    final trimmed = name.trim();
    if (trimmed.isEmpty || _categories.contains(trimmed)) {
      debugPrint('⚠️ دسته خالی بود یا تکراری بود: "$trimmed"');
      return;
    }

    try {
      await FirebaseFirestore.instance
          .collection('categories')
          .add({'name': trimmed});
      debugPrint('✅ دسته اضافه شد: $trimmed');
    } catch (e) {
      debugPrint('❌ خطا در افزودن دسته: $e');
    }
  }

  Future<void> deleteCategory(String name) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('categories')
          .where('name', isEqualTo: name)
          .get();

      for (var doc in snapshot.docs) {
        await doc.reference.delete();
      }

      debugPrint('🗑️ دسته حذف شد: $name');
    } catch (e) {
      debugPrint('❌ خطا در حذف دسته: $e');
    }
  }
}