import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/category_controller.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  final TextEditingController _controller = TextEditingController();

  void _addCategory() async {
    final name = _controller.text.trim();
    if (name.isEmpty) {
      debugPrint('⚠️ دسته خالی بود یا معتبر نبود');
      return;
    }

    try {
      await Provider.of<CategoryController>(context, listen: false).addCategory(name);
      _controller.clear();
      debugPrint('✅ دسته به Firestore اضافه شد: $name');
    } catch (e) {
      debugPrint('❌ خطا در افزودن دسته به Firestore: ${e.toString()}');
    }
  }

  void _deleteCategory(String name) async {
    try {
      await Provider.of<CategoryController>(context, listen: false).deleteCategory(name);
      debugPrint('🗑️ دسته حذف شد: $name');
    } catch (e) {
      debugPrint('❌ خطا در حذف دسته: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoryController = Provider.of<CategoryController>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('افزودن دسته‌بندی')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'نام دسته‌بندی',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('افزودن'),
              onPressed: _addCategory,
            ),
            const SizedBox(height: 24),
            const Text('دسته‌بندی‌های فعلی:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Expanded(
              child: StreamBuilder<List<String>>(
                stream: categoryController.categoryStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final categories = snapshot.data!;
                  if (categories.isEmpty) {
                    return const Center(child: Text('هیچ دسته‌ای یافت نشد'));
                  }

                  return ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (_, index) {
                      final name = categories[index];
                      return ListTile(
                        title: Text(name),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteCategory(name),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}