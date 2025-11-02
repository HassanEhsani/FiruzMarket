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

    return Scaffold(
      backgroundColor: Colors.grey.shade300, // 🩶 پس‌زمینه خاکستری روشن
      appBar: AppBar(
        title: Text(loc.navCart),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
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
            return const Center(
              child: Text(
                'سبد خرید شما خالی است 🛒',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            );
          }

          final grouped = cart.groupedByStore;
          final mapToRender = grouped.isNotEmpty ? grouped : {'': items};

          return ListView(
            padding: const EdgeInsets.only(bottom: 160), // فضا برای دکمه پایین
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
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ...entry.value.map(
                      (item) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        child: Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
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
                                    : const Icon(Icons.shopping_bag, size: 64),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      const SizedBox(height: 4),
                                      Text('${item.price} ₽'),
                                      if (item.discountPrice != null)
                                        Text(
                                          '${item.discountPrice} ₽ با کارت',
                                          style: const TextStyle(
                                              color: Colors.green),
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
                                        Text('${item.quantity}'),
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

      // 🟧 دکمه و قیمت پایین صفحه وسط‌چین و زیر هم
      bottomNavigationBar: Consumer<CartController>(
        builder: (context, cart, _) {
          if (cart.items.isEmpty) return const SizedBox.shrink();

          return Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
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
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
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
                      const SnackBar(
                        content: Text('سفارش شما ثبت شد ✅'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    cart.clearCart();
                  },
                  child: const Text(
                    'ثبت سفارش',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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