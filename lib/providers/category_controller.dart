import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryController extends ChangeNotifier {
  List<String> _categories = [];
  bool isLoaded = false;

  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? _sub;

  List<String> get categories => List.unmodifiable(_categories);

  void start() {
    if (_sub != null) return;

    _sub = FirebaseFirestore.instance
        .collection('categories') // 👈 مطمئن شو اسم کالکشن دقیقاً همین باشه
        .orderBy('name')
        .snapshots()
        .listen(
      (snapshot) {
        final list = <String>[];
        for (final doc in snapshot.docs) {
          final data = doc.data();
          final name = (data['name'] ?? '').toString().trim();
          if (name.isNotEmpty) {
            list.add(name);
          } else {
            debugPrint("⚠️ داکیومنت بدون فیلد 'name': ${doc.id}");
          }
        }

        _categories = list;
        isLoaded = true;
        debugPrint("📡 دسته‌ها بارگذاری شدند (${_categories.length}): $_categories");
        notifyListeners();
      },
      onError: (error) {
        debugPrint("❌ خطا در استریم دسته‌ها: $error");
        isLoaded = true;
        notifyListeners();
      },
    );
  }

  Future<void> addCategory(String name) async {
    final trimmed = name.trim();
    if (trimmed.isEmpty) return;

    try {
      await FirebaseFirestore.instance.collection('categories').add({
        'name': trimmed,
        'createdAt': FieldValue.serverTimestamp(),
      });
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

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}
