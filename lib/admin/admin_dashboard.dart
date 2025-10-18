import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // ✅ برای تشخیص محیط اجرا
import 'manage_products_screen.dart';
import 'manage_categories_screen.dart';
import 'add_product_screen.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('داشبورد مدیریت'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'به پنل مدیریت خوش آمدید',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            if (!kIsWeb)
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('افزودن محصول'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddProductScreen(), // ✅ اصلاح شد
                    ),
                  );
                },
              ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.edit),
              label: const Text('مدیریت محصولات'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ManageProductsScreen(), // ✅ اصلاح شد
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.category),
              label: const Text('مدیریت دسته‌بندی‌ها'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ManageCategoriesScreen(), // ✅ اصلاح شد
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
