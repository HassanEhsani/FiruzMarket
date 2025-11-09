import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_controller.dart';
import '../providers/cart_controller.dart';
import '../models/cart_item.dart';
import '../widgets/product_card.dart';
import '../l10n/app_localizations.dart'; // 👈 اضافه‌شده برای ترجمه

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final productController = context.watch<ProductController>();
    final cartController = context.read<CartController>();
    final favorites = productController.favoriteProducts;

    return Scaffold(
      appBar: AppBar(title: Text(loc.favoritesTitle)),
      body: favorites.isEmpty
          ? Center(child: Text(loc.noFavoritesMessage))
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final product = favorites[index];

                return Column(
                  children: [
                    ProductCard(product: product),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton.icon(
                            icon: const Icon(Icons.add_shopping_cart),
                            label: Text(loc.addToCartButton),
                            onPressed: () {
                              cartController.addItem(product.toCartItem());

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    loc.productAddedToCartMessage(product.name),
                                  ),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                );
              },
            ),
    );
  }
}
