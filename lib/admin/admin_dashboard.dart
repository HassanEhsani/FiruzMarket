import 'package:flutter/material.dart';
import 'add_product_screen.dart';
import 'manage_products_screen.dart';
import 'manage_categories_screen.dart';
import 'admin_login_screen.dart'; // ✅ ایمپورت صفحه‌ی ورود برای دکمه خروج

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('پنل مدیریت FiruzMarket'),
        centerTitle: true,
        backgroundColor: const Color(0xFFB2DFDB), // سبز یواش
        elevation: 0,
        foregroundColor: Colors.black87,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'خروج',
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const AdminLoginScreen(selectedLocale: Locale('fa')),
                ),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'به داشبورد مدیریت خوش آمدید',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            _buildAdminButton(
              context,
              icon: Icons.add_box,
              label: 'افزودن محصول',
              screen: const AddProductScreen(),
            ),
            const SizedBox(height: 16),
            _buildAdminButton(
              context,
              icon: Icons.edit,
              label: 'مدیریت محصولات',
              screen: const ManageProductsScreen(),
            ),
            const SizedBox(height: 16),
            _buildAdminButton(
              context,
              icon: Icons.category,
              label: 'مدیریت دسته‌بندی‌ها',
              screen: const ManageCategoriesScreen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdminButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Widget screen,
  }) {
    return ElevatedButton.icon(
      icon: Icon(icon, color: Colors.black87),
      label: Text(
        label,
        style: const TextStyle(fontSize: 16, color: Colors.black87),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFB2DFDB),
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
      },
    );
  }
}
