import 'package:flutter/material.dart';

class ManageProductsScreen extends StatelessWidget {
  const ManageProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مدیریت محصولات'),
      ),
      body: const Center(
        child: Text(
          'اینجا لیست محصولات و گزینه‌های ویرایش/حذف نمایش داده می‌شه',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}