import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_controller.dart';
import '../widgets/cart_item_tile.dart';
import '../l10n/app_localizations.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartController>(context);
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(loc.cartTitle)),
      body: cart.items.isEmpty
          ? Center(child: Text(loc.emptyCart))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      return CartItemTile(item: item);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text('${loc.totalPrice}: ${cart.totalPrice} تومان'),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(loc.payNow),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}