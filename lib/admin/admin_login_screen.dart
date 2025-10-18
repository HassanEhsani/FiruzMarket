import 'package:flutter/material.dart';
import 'admin/admin_login_screen.dart';

void main() {
  runApp(const AdminPanelApp());
}

class AdminPanelApp extends StatelessWidget {
  const AdminPanelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'پنل مدیریت FiruzMarket',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const AdminLoginScreen(),
    );
  }
}