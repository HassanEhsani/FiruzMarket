import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'providers/product_controller.dart';
import 'providers/cart_controller.dart';
import 'screens/products_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 🔹 مقداردهی اولیه Firebase
  await Firebase.initializeApp();

  // 🔹 اتصال به شبیه‌ساز Firestore (پورت پیش‌فرض: 8080)
  FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8084);
  // 🔹 مقداردهی اولیه کنترلر محصول با داده‌های تستی
  final productController = ProductController();
  productController.initSampleProducts();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => productController),
        ChangeNotifierProvider(create: (_) => CartController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF4CAF50),
        useMaterial3: true,
      ),
      home: const ProductsScreen(),
    );
  }
}
