import 'package:flutter/material.dart';
import 'package:firuz_market/admin/add_product_screen.dart';
import 'package:firuz_market/admin/manage_products_screen.dart';
import 'package:firuz_market/admin/manage_categories_screen.dart';
import '../l10n/app_localizations.dart';
import '../utils/translation_helper.dart'; // برای متد translate()

class AdminPanelScreen extends StatelessWidget {
  const AdminPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(appLoc.translate('admin_title')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) => const AddProductScreen(),
                ));
              },
              child: Text(appLoc.translate('add_product')),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) => const ManageProductsScreen(),
                ));
              },
              child: Text(appLoc.translate('manage_products')),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) => const ManageCategoriesScreen(),
                ));
              },
              child: Text(appLoc.translate('manage_categories')),
            ),
          ],
        ),
      ),
    );
  }
}