import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'providers/product_controller.dart';
import 'providers/cart_controller.dart';
import 'screens/products_screen.dart';
import 'l10n/app_localizations.dart';
import 'widgets/language_switcher.dart';

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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.changeLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('fa');

  void changeLocale(Locale newLocale) {
    setState(() {
      _locale = newLocale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      supportedLocales: const [Locale('fa'), Locale('ru'), Locale('en')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF4CAF50),
        useMaterial3: true,
      ),
      home: ProductsScreen(onLocaleChanged: changeLocale),
    );
  }
}
