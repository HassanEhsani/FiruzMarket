import 'package:flutter/material.dart';
import '../models/product.dart';
import '../l10n/app_localizations.dart';
import '../utils/translation_helper.dart'; // برای متد translate()

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  String selectedCategory = 'category_digital';

  void saveProduct() {
    final name = nameController.text;
    final price = int.tryParse(priceController.text) ?? 0;

    final newProduct = Product(
      name: name,
      price: price.toDouble(), // ✅ تبدیل درست
      imageUrl: 'assets/images/default.png', // بعداً انتخاب تصویر
    );

    // TODO: ذخیره محصول در لیست یا دیتابیس

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(appLoc.translate('add_product'))),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: appLoc.translate('product_name'),
              ),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: appLoc.translate('price')),
              keyboardType: TextInputType.number,
            ),
            DropdownButton<String>(
              value: selectedCategory,
              items: [
                DropdownMenuItem(
                  value: 'category_digital',
                  child: Text(appLoc.translate('category_digital')),
                ),
                DropdownMenuItem(
                  value: 'category_clothing',
                  child: Text(appLoc.translate('category_clothing')),
                ),
              ],
              onChanged: (value) => setState(() => selectedCategory = value!),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveProduct,
              child: Text(appLoc.translate('save')),
            ),
          ],
        ),
      ),
    );
  }
}
