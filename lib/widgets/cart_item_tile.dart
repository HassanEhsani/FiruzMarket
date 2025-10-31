import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_item.dart';
import '../providers/cart_controller.dart';

class CartItemTile extends StatelessWidget {
  final CartItem item;

  const CartItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(item.imageUrl, width: 48, height: 48),
      title: Text(item.name),
      subtitle: Text('${item.price} روبل'),
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: () {
          Provider.of<CartController>(context, listen: false).removeItem(item);
        },
      ),
      onTap: () {
        // اگر خواستی کلیک روی آیتم هم حذف کنه، اینو نگه دار
        // Provider.of<CartController>(context, listen: false).removeItem(item);
      },
    );
  }
}