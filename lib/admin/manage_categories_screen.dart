import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ManageCategoriesScreen extends StatelessWidget {
  const ManageCategoriesScreen({super.key});

  /// دیالوگ افزودن دسته جدید
  Future<void> _addCategoryDialog(BuildContext context) async {
    final TextEditingController controller = TextEditingController();

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('افزودن دسته‌بندی جدید'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'نام دسته‌بندی',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            child: const Text('لغو'),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: const Text('افزودن'),
            onPressed: () async {
              final name = controller.text.trim();
              if (name.isNotEmpty) {
                try {
                  await FirebaseFirestore.instance.collection('categories').add({
                    'name': name,
                  });
                  debugPrint("✅ دسته جدید اضافه شد: $name");
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('✅ دسته "$name" اضافه شد'),
                      backgroundColor: Colors.green,
                    ),
                  );
                } catch (e) {
                  debugPrint("❌ خطا در افزودن دسته: $e");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('خطا در افزودن دسته: $e'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }

  /// دیالوگ تأیید حذف دسته
  Future<void> _confirmDelete(
    String docId,
    String name,
    BuildContext context,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('حذف دسته‌بندی'),
        content: Text('آیا مطمئن هستید که می‌خواهید "$name" را حذف کنید؟'),
        actions: [
          TextButton(
            child: const Text('لغو'),
            onPressed: () => Navigator.pop(context, false),
          ),
          ElevatedButton(
            child: const Text('حذف'),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        await FirebaseFirestore.instance
            .collection('categories')
            .doc(docId)
            .delete();
        debugPrint("🗑️ دسته حذف شد: $name");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('✅ دسته "$name" حذف شد'),
            backgroundColor: Colors.green,
          ),
        );
      } catch (e) {
        debugPrint("❌ خطا در حذف دسته: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('خطا در حذف دسته: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('مدیریت دسته‌بندی‌ها'),
        backgroundColor: const Color(0xFFB2DFDB), // سبز یواش
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.black87,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('categories')
            .orderBy('name')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('❌ خطا در دریافت دسته‌بندی‌ها'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final categories = snapshot.data!.docs;

          if (categories.isEmpty) {
            return const Center(
              child: Text(
                'هیچ دسته‌بندی ثبت نشده است',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final doc = categories[index];
              final data = doc.data() as Map<String, dynamic>;

              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  title: Text(
                    data['name'] ?? 'بدون نام',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () =>
                        _confirmDelete(doc.id, data['name'] ?? '', context),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF4CAF50),
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('افزودن دسته‌بندی'),
        onPressed: () => _addCategoryDialog(context),
      ),
    );
  }
}
