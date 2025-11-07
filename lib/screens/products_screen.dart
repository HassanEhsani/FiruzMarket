import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_controller.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import '../widgets/language_switcher.dart';
import '../l10n/app_localizations.dart';
import 'profile_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/cart_screen.dart';

class ProductsScreen extends StatefulWidget {
  final void Function(Locale)? onLocaleChanged;

  const ProductsScreen({super.key, this.onLocaleChanged});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Consumer<ProductController>(
          builder: (context, controller, _) {
            final products = controller.products;

            if (products.isEmpty) {
              return StreamBuilder<List<Product>>(
                stream: controller.productStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return const Center(child: Text('خطا در دریافت محصولات'));
                  }
                  return _buildFullPage(context, snapshot.data ?? []);
                },
              );
            }

            return _buildFullPage(context, products);
          },
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildFullPage(BuildContext context, List<Product> products) {
    return Column(
      children: [
        _buildHeaderBar(context),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: products.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) =>
                ProductCard(product: products[index]),
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderBar(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final currentLocale = Localizations.localeOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Row(
            children: [
              const Icon(Icons.location_on, color: Colors.grey),
              const SizedBox(width: 4),
              const Text(
                'کازانسکایا، ۴',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
              const Spacer(),
              LanguageSwitcher(
                currentLocale: currentLocale,
                onLocaleChanged: widget.onLocaleChanged!,
              ),
              const SizedBox(width: 8),
              const Icon(Icons.monetization_on, color: Colors.amber),
              const SizedBox(width: 4),
              const Text(
                '۲۰',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: TextField(
            decoration: InputDecoration(
              hintText: loc.searchHint,
              prefixIcon: const Icon(Icons.search),
              suffixIcon: const Icon(Icons.mic),
              filled: true,
              fillColor: Colors.grey.shade100,
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 72,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              _buildCategoryIcon('assets/images/clothing.png', loc.categoryClothing),
              _buildCategoryIcon('assets/images/digital.png', loc.categoryDigital),
              _buildCategoryIcon('assets/images/home.png', loc.categoryHome),
              _buildCategoryIcon('assets/images/sports.png', loc.categorySports),
              _buildCategoryIcon('assets/images/all.png', loc.categoryAll),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryIcon(String iconPath, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(iconPath, fit: BoxFit.contain),
            ),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.black87)),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    final loc = AppLocalizations.of(context);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.grey,
      currentIndex: selectedIndex,
      onTap: (index) {
        setState(() => selectedIndex = index);

        if (index == 4) {
          Navigator.pushNamed(context, '/cart');
        } else if (index == 5) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ProfileScreen()),
          );
        } else if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const FavoritesScreen()),
          );
        }
      },
      items: [
        BottomNavigationBarItem(icon: const Icon(Icons.home), label: loc.navHome),
        BottomNavigationBarItem(icon: const Icon(Icons.egg), label: loc.navSpecial),
        BottomNavigationBarItem(icon: const Icon(Icons.local_grocery_store), label: loc.navFood),
        BottomNavigationBarItem(icon: const Icon(Icons.favorite_border), label: loc.navFavorites),
        BottomNavigationBarItem(icon: const Icon(Icons.shopping_cart), label: loc.navCart),
        BottomNavigationBarItem(icon: const Icon(Icons.person), label: loc.navProfile),
      ],
    );
  }
}