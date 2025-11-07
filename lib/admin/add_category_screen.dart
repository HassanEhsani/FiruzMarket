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
      await Provider.of<CategoryController>(
        context,
        listen: false,
      ).addCategory(name);
      _controller.clear();
      debugPrint('✅ دسته به Firestore اضافه شد: $name');
    } catch (e) {
      debugPrint('❌ خطا در افزودن دسته به Firestore: ${e.toString()}');
    }
  }

  void _deleteCategory(String name) async {
    try {
      await Provider.of<CategoryController>(
        context,
        listen: false,
      ).deleteCategory(name);
      debugPrint('🗑️ دسته حذف شد: $name');
    } catch (e) {
      debugPrint('❌ خطا در حذف دسته: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoryController = Provider.of<CategoryController>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('افزودن دسته‌بندی'),
        backgroundColor: const Color(0xFFB2DFDB), // سبز یواش
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'نام دسته‌بندی',
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.add, color: Colors.black87),
              label: const Text(
                'افزودن',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB2DFDB),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              onPressed: _addCategory,
            ),
            const SizedBox(height: 32),
            const Text(
              'دسته‌بندی‌های فعلی:',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: StreamBuilder<List<String>>(
                stream: categoryController.categoryStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final categories = snapshot.data!;
                  if (categories.isEmpty) {
                    return const Center(
                      child: Text(
                        'هیچ دسته‌ای یافت نشد',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (_, index) {
                      final name = categories[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
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
                            name,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteCategory(name),
                          ),
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
