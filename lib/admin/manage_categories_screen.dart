import 'package:flutter/material.dart';
import 'add_category_screen.dart';

class ManageCategoriesScreen extends StatelessWidget {
  const ManageCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مدیریت دسته‌بندی‌ها')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'اینجا لیست دسته‌بندی‌ها و گزینه‌های افزودن/ویرایش نمایش داده می‌شه',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('افزودن دسته‌بندی'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AddCategoryScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}