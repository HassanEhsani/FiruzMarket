import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_controller.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('محصولات'),
      ),
      body: Consumer<ProductController>(
        builder: (context, controller, _) {
          // اگر محصولات تستی مقداردهی شده‌اند، همان‌ها نمایش داده شوند
          if (controller.products.isNotEmpty) {
            return _ProductsList(products: controller.products);
          }

          // در غیر این صورت به استریم Firestore سوییچ کن
          return StreamBuilder<List<Product>>(
            stream: controller.productStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return const Center(child: Text('خطا در دریافت محصولات'));
              }

              final products = snapshot.data ?? const <Product>[];

              if (products.isEmpty) {
                return const Center(child: Text('هیچ محصولی یافت نشد'));
              }

              return _ProductsList(products: products);
            },
          );
        },
      ),
    );
  }
}

class _ProductsList extends StatelessWidget {
  final List<Product> products;

  const _ProductsList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: products.length,
      padding: const EdgeInsets.symmetric(vertical: 8),
      separatorBuilder: (_, __) => const SizedBox(height: 4),
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(product: product);
      },
    );
  }
}