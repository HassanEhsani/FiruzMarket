import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_controller.dart'; // یا controller بسته به مسیر واقعی
import '../models/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartController>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('سبد خرید')),
      body: cart.items.isEmpty
          ? const Center(child: Text('سبد خرید شما خالی است'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            item.imageUrl, // باید در مدل CartItem باشه
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(item.name),
                          subtitle: Text('${item.price} تومان'),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              cart.removeItem(item.id);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'مجموع: ${cart.totalPrice.toStringAsFixed(2)} تومان',
                      ),
                      ElevatedButton(
                        onPressed: () {
                          cart.clearCart();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('تسویه انجام شد')),
                          );
                        },
                        child: const Text('تسویه حساب'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
