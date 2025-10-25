import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ManageCategoriesScreen extends StatelessWidget {
  const ManageCategoriesScreen({super.key});

  Future<void> _addCategoryDialog(BuildContext context) async {
    final TextEditingController _controller = TextEditingController();

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('افزودن دسته‌بندی جدید'),
        content: TextField(
          controller: _controller,
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
              final name = _controller.text.trim();
              if (name.isNotEmpty) {
                await FirebaseFirestore.instance.collection('categories').add({'name': name});
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }

  Future<void> _confirmDelete(String docId, String name, BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('حذف دسته‌بندی'),
        content: Text('آیا مطمئن هستید که می‌خواهید "$name" را حذف کنید؟'),
        actions: [
          TextButton(child: const Text('لغو'), onPressed: () => Navigator.pop(context, false)),
          ElevatedButton(child: const Text('حذف'), onPressed: () => Navigator.pop(context, true)),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        await FirebaseFirestore.instance.collection('categories').doc(docId).delete();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: const Text('✅ دسته‌بندی حذف شد'), backgroundColor: Colors.green),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('خطا در حذف دسته‌بندی: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('مدیریت دسته‌بندی‌ها'),
        backgroundColor: const Color(0xFF4CAF50),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('categories').orderBy('name').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('خطا در دریافت دسته‌بندی‌ها'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final categories = snapshot.data!.docs;

          if (categories.isEmpty) {
            return const Center(child: Text('هیچ دسته‌بندی ثبت نشده است'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final doc = categories[index];
              final data = doc.data() as Map<String, dynamic>;

              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                ),
                child: ListTile(
                  title: Text(data['name'], style: const TextStyle(fontSize: 16)),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _confirmDelete(doc.id, data['name'], context),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF4CAF50),
        icon: const Icon(Icons.add),
        label: const Text('افزودن دسته‌بندی'),
        onPressed: () => _addCategoryDialog(context),
      ),
    );
  }
}