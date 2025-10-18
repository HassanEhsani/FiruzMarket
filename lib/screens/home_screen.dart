import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/category_controller.dart';

class HomeScreen extends StatelessWidget {
  final void Function(Locale) onLocaleChange;

  const HomeScreen({super.key, required this.onLocaleChange});

  @override
  Widget build(BuildContext context) {
    final categoryController = Provider.of<CategoryController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('به فروشگاه خوش آمدید'),
        actions: [
          PopupMenuButton<Locale>(
            icon: const Icon(Icons.language),
            onSelected: onLocaleChange,
            itemBuilder: (context) => const [
              PopupMenuItem(value: Locale('fa'), child: Text('فارسی')),
              PopupMenuItem(value: Locale('ru'), child: Text('Русский')),
              PopupMenuItem(value: Locale('en'), child: Text('English')),
            ],
          ),
        ],
      ),
      body: StreamBuilder<List<String>>(
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
            itemBuilder: (context, index) {
              final name = categories[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: const Icon(Icons.category),
                  title: Text(name),
                ),
              );
            },
          );
        },
      ),
    );
  }
}