import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("پروفایل کاربر"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/avatar.png"),
            ),
            const SizedBox(height: 16),
            const Text("حسن احسانی",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text("ایمیل: hassan@example.com"),
            const Divider(height: 32),
            ListTile(leading: const Icon(Icons.settings), title: const Text("تنظیمات"), onTap: () {}),
            ListTile(leading: const Icon(Icons.history), title: const Text("سفارش‌های من"), onTap: () {}),
            ListTile(leading: const Icon(Icons.logout), title: const Text("خروج"), onTap: () {}),
          ],
        ),
      ),
    );
  }
}