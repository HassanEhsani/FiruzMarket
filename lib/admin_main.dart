import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'admin/admin_login_screen.dart'; // ✅ مسیر درست برای صفحه‌ی لاگین
import 'providers/category_controller.dart'; // ✅ مسیر بدون ../ چون در lib هست

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ChangeNotifierProvider(
      create: (_) => CategoryController(),
      child: const AdminApp(),
    ),
  );
}

class AdminApp extends StatelessWidget {
  const AdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'پنل مدیریت فیروزمارکت',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      debugShowCheckedModeBanner: false, // ✅ این خط بنر DEBUG رو حذف می‌کنه
      home: const AdminLoginScreen(), // ✅ مسیر درست و بدون ارور
    );
  }
}
