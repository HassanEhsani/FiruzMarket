import 'package:flutter/material.dart';
import 'admin_dashboard.dart';
import '../l10n/app_localizations.dart';

class AdminLoginScreen extends StatefulWidget {
  final Locale selectedLocale;
  const AdminLoginScreen({super.key, required this.selectedLocale});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;

  final String _adminPassword = 'firuz2025';

  void _login() {
    if (_passwordController.text == _adminPassword) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const AdminDashboard()),
      );
    } else {
      setState(() {
        _errorMessage = 'رمز اشتباه است';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: widget.selectedLocale.languageCode == 'fa'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Firuz Market Admin',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade700,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  AppLocalizations.of(context)!.adminWelcome,
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 48),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.enterPassword,
                    border: const OutlineInputBorder(),
                    errorText: _errorMessage,
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.login),
                    label: Text(AppLocalizations.of(context)!.login),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB2DFDB),
                      foregroundColor: Colors.black87,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    onPressed: _login,
                  ),
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
