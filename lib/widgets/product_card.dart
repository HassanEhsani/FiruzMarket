import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../models/cart_item.dart';
import '../providers/cart_controller.dart';
import '../providers/product_controller.dart';
import '../screens/cart_screen.dart';

extension ProductCartExtension on Product {
  CartItem toCartItem() {
    // اگر id محصول تهی باشد از name به عنوان fallback استفاده کن
    final itemId = (id == null || id.toString().trim().isEmpty) ? name : id;
    return CartItem(
      id: itemId.toString(),
      name: name,
      price: price.toDouble(),
      quantity: 1,
      imageUrl: imageUrl,
      storeName: storeName ?? 'بدون فروشگاه',
      // discountPrice: discountPrice,
      // deliveryType: deliveryType,
      selected: true,
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final discount = product.discountPercent;
    final hasOldPrice = product.oldPrice != null;

    // 🔒 استفاده از context.read برای گرفتن Controller (بدون listen)
    final cartController = context.read<CartController>();
    final productController = Provider.of<ProductController>(context, listen: false);

    void addToCartAndDebug() {
      cartController.addItem(product.toCartItem());

      // چاپ دیباگ برای بررسی اینکه آیتم واقعا به لیست اضافه شده
      if (kDebugMode) {
        // ignore: avoid_print
        print('🛒 after addItem -> cart items: ${cartController.items}');
      }
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          addToCartAndDebug();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${product.name} به سبد خرید اضافه شد 🛒'),
              duration: const Duration(seconds: 2),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      product.imageUrl,
                      width: 72,
                      height: 72,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.broken_image, size: 72),
                    ),
                  ),
                  if (product.isFeatured)
                    Positioned(
                      top: 4,
                      left: 4,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'پیشنهاد ویژه',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          product.formattedPrice,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        if (hasOldPrice)
                          Text(
                            product.formattedOldPrice!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        if (discount != null)
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green[100],
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              '-$discount%',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product.category,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(
                      product.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: product.isFavorite ? Colors.red : Colors.grey,
                    ),
                    tooltip: 'علاقه‌مندی',
                    onPressed: () {
                      productController.toggleFavorite(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            product.isFavorite
                                ? '${product.name} به علاقه‌مندی‌ها اضافه شد ❤️'
                                : '${product.name} از علاقه‌مندی‌ها حذف شد',
                          ),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_shopping_cart),
                    tooltip: 'افزودن به سبد خرید',
                    onPressed: () {
                      addToCartAndDebug();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${product.name} به سبد خرید اضافه شد 🛒'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}