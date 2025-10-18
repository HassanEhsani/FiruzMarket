import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../models/product.dart';
import '../providers/product_controller.dart';
import '../widgets/product_card.dart';
import '../utils/translation_helper.dart';
import '../utils/product_extensions.dart';

class CategoryProductsScreen extends StatelessWidget {
  final String categoryKey;

  const CategoryProductsScreen({super.key, required this.categoryKey});

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;
    final String categoryTitle = appLoc.translate(categoryKey);

    // ✅ گرفتن محصولات واقعی از کنترلر و فیلتر بر اساس دسته‌بندی
    final products = Provider.of<ProductController>(context)
        .products
        .where((p) => p.category == categoryKey)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              appLoc.translateWithArgs('products_related_to', {
                'category': categoryTitle,
              }),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: products.isEmpty
                ? Center(child: Text('هیچ محصولی در این دسته وجود ندارد'))
                : ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductCard(product: product);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}