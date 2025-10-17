import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../models/product.dart';
import '../models/cart_item.dart';
import '../providers/cart_controller.dart';
import '../utils/translation_helper.dart';
import '../widgets/product_card.dart'; // اصلاح مسیر
import '../utils/product_extensions.dart';

class CategoryProductsScreen extends StatelessWidget {
  final String categoryKey;

  const CategoryProductsScreen({super.key, required this.categoryKey});

  List<Product> getProductsForCategory(String categoryKey) {
    if (categoryKey == 'category_digital') {
      return [
        Product(name: 'Smartphone X', imageUrl: 'assets/images/phone.png', price: 799),
        Product(name: 'Laptop Pro', imageUrl: 'assets/images/laptop.png', price: 1299),
      ];
    } else if (categoryKey == 'category_clothing') {
      return [
        Product(name: 'T-Shirt', imageUrl: 'assets/images/tshirt.png', price: 29),
        Product(name: 'Jeans', imageUrl: 'assets/images/jeans.png', price: 59),
      ];
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context);
    final String categoryTitle = appLoc!.translate(categoryKey);
    final List<Product> products = getProductsForCategory(categoryKey);

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
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(product: product); // استفاده از ویجت آماده
              },
            ),
          ),
        ],
      ),
    );
  }
}