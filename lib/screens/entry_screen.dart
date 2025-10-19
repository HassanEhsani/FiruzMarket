import 'package:flutter/material.dart';
import 'home_screen.dart';
import '../admin/admin_dashboard.dart';

class EntryScreen extends StatelessWidget {
  final void Function(Locale) onLocaleChange;

  const EntryScreen({super.key, required this.onLocaleChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FiruzMarket'),
        backgroundColor: const Color(0xFF4CAF50),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'به FiruzMarket خوش آمدید',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              icon: const Icon(Icons.store),
              label: const Text('ورود به فروشگاه'),
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4CAF50)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(onLocaleChange: onLocaleChange),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.admin_panel_settings),
              label: const Text('ورود به پنل مدیریت'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade700),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AdminDashboard()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}