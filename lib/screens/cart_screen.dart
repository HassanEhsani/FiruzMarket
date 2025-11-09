import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_controller.dart';
import '../l10n/app_localizations.dart';

class CartScreen extends StatelessWidget {
  final bool showBackButton;

  const CartScreen({super.key, this.showBackButton = true});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final canPop = Navigator.canPop(context);
    final theme = Theme.of(context); // 👈 گرفتن رنگ‌های تم

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor, // 👈 رنگ پس‌زمینه از تم
      appBar: AppBar(
        title: Text(loc.navCart),
        backgroundColor: theme.appBarTheme.backgroundColor ?? theme.colorScheme.surface, // 👈 رنگ از تم
        foregroundColor: theme.appBarTheme.foregroundColor ?? theme.colorScheme.onSurface, // 👈 رنگ از تم
        elevation: 1,
        automaticallyImplyLeading: false,
        leading: (showBackButton || canPop)
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  } else {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                  }
                },
              )
            : null,
      ),
      body: Consumer<CartController>(
        builder: (context, cart, _) {
          final items = cart.items;

          if (items.isEmpty) {
            return Center(
              child: Text(
                'سبد خرید شما خالی است 🛒',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ), // 👈 استایل از تم
              ),
            );
          }

          final grouped = cart.groupedByStore;
          final mapToRender = grouped.isNotEmpty ? grouped : {'': items};

          return ListView(
            padding: const EdgeInsets.only(bottom: 160),
            children: [
              const SizedBox(height: 10),
              for (final entry in mapToRender.entries)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (entry.key.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Text(
                          entry.key,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ), // 👈 استایل از تم
                        ),
                      ),
                    ...entry.value.map(
                      (item) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        child: Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(12),
                          color: theme.cardColor, // 👈 رنگ کارت از تم
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              children: [
                                item.imageUrl.isNotEmpty
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          item.imageUrl,
                                          width: 64,
                                          height: 64,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : Icon(Icons.shopping_bag,
                                        size: 64,
                                        color: theme.iconTheme.color), // 👈 رنگ آیکون از تم
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.name,
                                        style: theme.textTheme.bodyMedium?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ), // 👈 استایل از تم
                                      ),
                                      const SizedBox(height: 4),
                                      Text('${item.price} ₽',
                                          style: theme.textTheme.bodySmall),
                                      if (item.discountPrice != null)
                                        Text(
                                          '${item.discountPrice} ₽ با کارت',
                                          style: theme.textTheme.bodySmall?.copyWith(
                                            color: Colors.green,
                                          ), // 👈 رنگ تخفیف
                                        ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Checkbox(
                                      value: item.selected,
                                      onChanged: (val) =>
                                          cart.toggleSelection(item),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.remove),
                                          onPressed: () =>
                                              cart.decreaseQuantity(item),
                                        ),
                                        Text('${item.quantity}',
                                            style: theme.textTheme.bodyMedium),
                                        IconButton(
                                          icon: const Icon(Icons.add),
                                          onPressed: () =>
                                              cart.increaseQuantity(item),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          );
        },
      ),

      // 🟧 دکمه و قیمت پایین صفحه
      bottomNavigationBar: Consumer<CartController>(
        builder: (context, cart, _) {
          if (cart.items.isEmpty) return const SizedBox.shrink();

          return Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            decoration: BoxDecoration(
              color: theme.bottomAppBarTheme.color ?? theme.colorScheme.surface, // 👈 رنگ از تم
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, -1),
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'مجموع: ${cart.totalPrice.toStringAsFixed(0)} ₽',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ), // 👈 استایل از تم
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'سفارش شما ثبت شد ✅',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        duration: const Duration(seconds: 2),
                        backgroundColor: Colors.green,
                      ),
                    );
                    cart.clearCart();
                  },
                  child: Text(
                    'ثبت سفارش',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
