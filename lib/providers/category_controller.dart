import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryController extends ChangeNotifier {
  List<String> _categories = [];
  bool isLoaded = false;

  List<String> get categories => List.unmodifiable(_categories);

  /// بارگذاری یک‌باره‌ی دسته‌ها از Firestore
  Future<void> loadCategories() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('categories')
          .get();

      final list = <String>[];
      for (var doc in snapshot.docs) {
        final name = doc.data()['name']?.toString().trim();
        if (name != null && name.isNotEmpty) {
          list.add(name);
        }
      }

      _categories = list;
      isLoaded = true;

      debugPrint("📡 دسته‌ها بارگذاری شدند: $_categories");
      notifyListeners();
    } catch (e) {
      debugPrint("❌ خطا در بارگذاری دسته‌ها: $e");
    }
  }

  /// افزودن دسته
  Future<void> addCategory(String name) async {
    final trimmed = name.trim();

    if (trimmed.isEmpty || _categories.contains(trimmed)) {
      debugPrint('⚠️ دسته خالی یا تکراری: "$trimmed"');
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('categories').add({
        'name': trimmed,
      });

      _categories.add(trimmed);
      notifyListeners();

      debugPrint('✅ دسته اضافه شد: $trimmed');
    } catch (e) {
      debugPrint('❌ خطا در افزودن دسته: $e');
    }
  }

  /// حذف دسته
  Future<void> deleteCategory(String name) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('categories')
          .where('name', isEqualTo: name)
          .get();

      for (var doc in snapshot.docs) {
        await doc.reference.delete();
      }

      _categories.remove(name);
      notifyListeners();

      debugPrint('🗑️ دسته حذف شد: $name');
    } catch (e) {
      debugPrint('❌ خطا در حذف دسته: $e');
    }
  }
}
