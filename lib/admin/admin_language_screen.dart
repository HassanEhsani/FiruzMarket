import 'package:flutter/material.dart';
import 'admin_login_screen.dart';

class AdminLanguageScreen extends StatelessWidget {
  final Function(Locale) onLanguageSelected;
  const AdminLanguageScreen({super.key, required this.onLanguageSelected});

  void _selectLanguage(BuildContext context, Locale locale) {
    onLanguageSelected(locale);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AdminLoginScreen(selectedLocale: locale),
      ),
    );
  }

  // باقی کد همونه فقط باید از onLanguageSelected استفاده بشه


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'انتخاب زبان',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'لطفاً زبان مورد نظر را انتخاب کنید',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 48),
              _buildLangOption(
                context,
                label: 'فارسی',
                icon: Icons.language,
                locale: const Locale('fa'),
              ),
              const SizedBox(height: 16),
              _buildLangOption(
                context,
                label: 'English',
                icon: Icons.translate,
                locale: const Locale('en'),
              ),
              const SizedBox(height: 16),
              _buildLangOption(
                context,
                label: 'Русский',
                icon: Icons.public,
                locale: const Locale('ru'),
              ),
              const Spacer(),
              const Divider(height: 1),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildServiceIcon(Icons.account_balance, 'Finance'),
                  _buildServiceIcon(Icons.people_alt, 'HR'),
                  _buildServiceIcon(Icons.view_list, 'Catalog'),
                  _buildServiceIcon(Icons.campaign, 'Campaign'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLangOption(BuildContext context,
      {required String label, required IconData icon, required Locale locale}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () => _selectLanguage(context, locale),
        icon: Icon(icon, color: Colors.black87),
        label: Text(
          label,
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
      ),
    );
  }

  Widget _buildServiceIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 32, color: Colors.green.shade700),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }
}