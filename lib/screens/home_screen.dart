import 'package:flutter/material.dart';
import '../widgets/category_card.dart';
import '../l10n/app_localizations.dart';
import 'category_products_screen.dart';
import '../admin/admin_panel_screen.dart';
import '../utils/translation_helper.dart';
import 'cart_screen.dart'; // ✅ اضافه‌شده برای اتصال به سبد خرید

class HomeScreen extends StatefulWidget {
  final void Function(Locale) onLocaleChange;

  const HomeScreen({super.key, required this.onLocaleChange});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isChangingLanguage = false;

  void _changeLanguage(String languageCode) async {
    setState(() {
      _isChangingLanguage = true;
    });

    // تأخیر کوتاه برای بسته شدن PopupMenu قبل از تغییر زبان
    await Future.delayed(const Duration(milliseconds: 200));

    widget.onLocaleChange(Locale(languageCode));

    setState(() {
      _isChangingLanguage = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(appLoc.translate('welcome')),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.language),
            onSelected: _changeLanguage,
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(value: 'fa', child: Text('فارسی')),
              const PopupMenuItem(value: 'ru', child: Text('Русский')),
              const PopupMenuItem(value: 'en', child: Text('English')),
            ],
          ),
        ],
      ),
      body: _isChangingLanguage
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  color: Colors.teal.shade100,
                  child: Text(
                    appLoc.translate('welcome'),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AdminPanelScreen(),
                      ),
                    );
                  },
                  child: Text(appLoc.translate('admin_title')),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: [
                      CategoryCard(
                        title: appLoc.translate('category_clothing'),
                        icon: Icons.checkroom,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CategoryProductsScreen(
                                    categoryKey: 'category_clothing',
                                  ),
                            ),
                          );
                        },
                      ),
                      CategoryCard(
                        title: appLoc.translate('category_digital'),
                        icon: Icons.devices,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CategoryProductsScreen(
                                    categoryKey: 'category_digital',
                                  ),
                            ),
                          );
                        },
                      ),
                      CategoryCard(
                        title: appLoc.translate('category_food'),
                        icon: Icons.fastfood,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CategoryProductsScreen(
                                    categoryKey: 'category_food',
                                  ),
                            ),
                          );
                        },
                      ),
                      CategoryCard(
                        title: appLoc.translate('category_home'),
                        icon: Icons.chair,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CategoryProductsScreen(
                                    categoryKey: 'category_home',
                                  ),
                            ),
                          );
                        },
                      ),
                      CategoryCard(
                        title: appLoc.translate('category_beauty'),
                        icon: Icons.brush,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CategoryProductsScreen(
                                    categoryKey: 'category_beauty',
                                  ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}