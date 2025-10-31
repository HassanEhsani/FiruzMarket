import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_controller.dart';
import '../widgets/product_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ProductController>(context);
    final favorites = controller.favoriteProducts;

    return Scaffold(
      appBar: AppBar(title: const Text('علاقه‌مندی‌ها')),
      body: favorites.isEmpty
          ? const Center(child: Text('محصولی در علاقه‌مندی‌ها نیست'))
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return ProductCard(product: favorites[index]);
              },
            ),
    );
  }
}