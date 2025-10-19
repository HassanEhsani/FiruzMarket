import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  String _selectedCategory = 'گل'; // مقدار پیش‌فرض

  final List<String> _categories = ['گل', 'لباس', 'لوازم دیجیتال', 'کتاب'];

  Future<void> _submitProduct() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseFirestore.instance.collection('products').add({
          'name': _nameController.text.trim(),
          'price': int.parse(_priceController.text.trim()),
          'imageUrl': _imageUrlController.text.trim(),
          'category': _selectedCategory,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('✅ محصول با موفقیت اضافه شد'),
            backgroundColor: Colors.green.shade600,
          ),
        );

        _nameController.clear();
        _priceController.clear();
        _imageUrlController.clear();
        setState(() => _selectedCategory = _categories.first);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('خطا در افزودن محصول: $e'),
            backgroundColor: Colors.red.shade400,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('افزودن محصول'),
        backgroundColor: const Color(0xFF4CAF50),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                'اطلاعات محصول را وارد کنید',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'نام محصول',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'نام را وارد کنید' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(
                  labelText: 'قیمت (تومان)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'قیمت را وارد کنید' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _imageUrlController,
                decoration: const InputDecoration(
                  labelText: 'لینک تصویر',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'لینک تصویر را وارد کنید' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: const InputDecoration(
                  labelText: 'دسته‌بندی',
                  border: OutlineInputBorder(),
                ),
                items: _categories
                    .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                    .toList(),
                onChanged: (value) => setState(() => _selectedCategory = value!),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                icon: const Icon(Icons.check),
                label: const Text('افزودن محصول'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4CAF50),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                onPressed: _submitProduct,
              ),
            ],
          ),
        ),
      ),
    );
  }
}