import 'package:flutter/material.dart';
import 'package:firuz_market/admin/add_product_screen.dart';
import 'package:firuz_market/admin/manage_products_screen.dart';
import 'package:firuz_market/admin/manage_categories_screen.dart';
import '../l10n/app_localizations.dart';
import 'admin_login_screen.dart';
import '../utils/translation_helper.dart';
import '../admin_main.dart'; // برای دسترسی به MyApp.setLocale

class AdminPanelScreen extends StatefulWidget {
  final Locale selectedLocale;
  const AdminPanelScreen({super.key, required this.selectedLocale});

  @override
  State<AdminPanelScreen> createState() => _AdminPanelScreenState();
}

class _AdminPanelScreenState extends State<AdminPanelScreen> {
  late Locale _currentLocale;

  @override
  void initState() {
    super.initState();
    _currentLocale = widget.selectedLocale;
  }

  void _changeLocale(Locale newLocale) {
    setState(() {
      _currentLocale = newLocale;
    });
    MyApp.setLocale(context, newLocale);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => AdminPanelScreen(selectedLocale: newLocale),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;

    return Directionality(
      textDirection: _currentLocale.languageCode == 'fa'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            appLoc.translate('admin_title'),
            style: const TextStyle(color: Colors.black87),
          ),
          backgroundColor: const Color(0xFFB2DFDB),
          centerTitle: true,
          elevation: 0,
          foregroundColor: Colors.black87,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),

              ElevatedButton.icon(
                icon: const Icon(Icons.add_box, color: Colors.black87),
                label: Text(
                  appLoc.translate('add_product'),
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB2DFDB),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AddProductScreen()),
                  );
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                icon: const Icon(Icons.edit, color: Colors.black87),
                label: Text(
                  appLoc.translate('manage_products'),
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB2DFDB),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ManageProductsScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                icon: const Icon(Icons.category, color: Colors.black87),
                label: Text(
                  appLoc.translate('manage_categories'),
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB2DFDB),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ManageCategoriesScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                icon: const Icon(Icons.logout, color: Colors.black87),
                label: Text(
                  AppLocalizations.of(context)!.back_to_login,
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade100,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AdminLoginScreen(
                        selectedLocale: widget.selectedLocale,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
