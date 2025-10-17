import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // برای مدیریت وضعیت
import '../models/product.dart';
import '../models/cart_item.dart';
import '../providers/cart_controller.dart'; // مسیر رو با ساختار پروژه‌ات هماهنگ کن
import '../utils/product_extensions.dart'; // اگر اکستنشن رو جدا کردی

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                product.imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('${product.price} تومان',
                      style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              onPressed: () {
                final cart = Provider.of<CartController>(context, listen: false);
                cart.addItem(product.toCartItem());

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${product.name} به سبد خرید اضافه شد')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}