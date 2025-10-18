import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import '../models/product.dart';
import '../providers/product_controller.dart';
import '../l10n/app_localizations.dart';
import '../utils/translation_helper.dart'; // برای متد translate()

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  String? selectedImagePath;
  String selectedCategory = 'category_digital';

  void saveProduct() {
  final name = nameController.text;
  final price = double.tryParse(priceController.text) ?? 0;

  final newProduct = Product(
    name: name,
    price: price,
    imageUrl: selectedImagePath ?? 'assets/images/default.png',
    category: selectedCategory, // ✅ اینجا اضافه کن
  );

  Provider.of<ProductController>(context, listen: false).addProduct(newProduct);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('محصول با موفقیت اضافه شد')),
  );

  Navigator.pop(context);
}

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(appLoc.translate('add_product'))),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: appLoc.translate('product_name'),
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'نام محصول الزامی است' : null,
                ),
                TextFormField(
                  controller: priceController,
                  decoration: InputDecoration(labelText: appLoc.translate('price')),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'قیمت الزامی است' : null,
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
                  onPressed: () async {
                    FilePickerResult? result = await FilePicker.platform.pickFiles(
                      type: FileType.image,
                    );
                    if (result != null) {
                      setState(() {
                        selectedImagePath = result.files.single.path;
                      });
                    }
                  },
                  child: Text('انتخاب عکس'),
                ),
                if (selectedImagePath != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Image.file(
                      File(selectedImagePath!),
                      width: 100,
                      height: 100,
                    ),
                  ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      saveProduct();
                    }
                  },
                  child: Text(appLoc.translate('save')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}