import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '../admin/admin_dashboard.dart';
import '../screens/cart_screen.dart';
import '../models/cart_item.dart';
import '../providers/cart_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showWelcomeBanner = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFB2DFDB), // سبز یواش
        elevation: 0,
        centerTitle: true,
        title: const Row(
          children: [
            Icon(Icons.storefront, size: 28, color: Colors.black87),
            SizedBox(width: 8),
            Text('FiruzMarket', style: TextStyle(color: Colors.black87)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black87),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black87,
            ),
            onPressed: () {
              final cart = Provider.of<CartController>(context, listen: false);
              cart.addItem(
                CartItem(
                  id: '1',
                  name: 'سیب قرمز',
                  price: 25000,
                  quantity: 2,
                  imageUrl: 'assets/images/apple.png',
                  discountPrice: 23000,
                  deliveryType: 'ارسال فوری',
                  storeName: 'میوه‌فروشی بهار',
                ),
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.login, color: Colors.black87),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('ورود / عضویت هنوز فعال نشده')),
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(64),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'جستجو در محصولات...',
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  icon: const Icon(Icons.dashboard, color: Colors.black87),
                  label: const Text(
                    'ورود به داشبورد',
                    style: TextStyle(color: Colors.black87),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB2DFDB),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const AdminDashboard()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          if (_showWelcomeBanner)
            Container(
              color: Colors.yellow.shade100,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: Colors.black87),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'مشتری عزیز، برای ورود و عضویت لطفاً دکمه زیر را فشار دهید.',
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() => _showWelcomeBanner = false);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('ورود / عضویت هنوز فعال نشده'),
                        ),
                      );
                    },
                    child: const Text('ورود / عضویت'),
                  ),
                ],
              ),
            ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('products')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text('خطا در دریافت محصولات'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                final products = snapshot.data!.docs;

                if (products.isEmpty) {
                  return const Center(child: Text('هیچ محصولی ثبت نشده است'));
                }

                return GridView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final doc = products[index];
                    final data = doc.data() as Map<String, dynamic>;

                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12),
                              ),
                              child: Image.network(
                                data['imageUrl'] ??
                                    'https://via.placeholder.com/150',
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Icon(Icons.broken_image),
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['name'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'قیمت: ${data['price']} تومان',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                  ),
                                ),
                                Text(
                                  'دسته: ${data['category']}',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
