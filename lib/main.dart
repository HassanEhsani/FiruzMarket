import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'providers/category_controller.dart';

import 'firebase_options.dart';
import 'providers/product_controller.dart';
import 'providers/cart_controller.dart';
import 'providers/theme_controller.dart'; // 👈 کنترلر تم
import 'screens/products_screen.dart';
import 'screens/cart_screen.dart';
import 'l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseApp app;
  try {
    if (Firebase.apps.isEmpty) {
      app = await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      print("✅ Firebase initialized (fresh)");
    } else {
      app = Firebase.apps.first;
      print("♻️ Using existing Firebase app: ${app.name}");
    }
  } catch (e) {
    print("⚠️ Firebase already initialized, skipping: $e");
    app = Firebase.apps.first;
  }

  // 🔗 اتصال به Emulator
  String host;
  if (kIsWeb) {
    host = '127.0.0.1';
  } else if (Platform.isAndroid) {
    host = '10.0.2.2'; // برای Android Emulator
  } else {
    host = '127.0.0.1'; // برای iOS/Mac/Windows
  }

  try {
    FirebaseFirestore.instance.useFirestoreEmulator(host, 8084);
    FirebaseStorage.instance.useStorageEmulator(host, 9198);
    print('🟢 Connected to Firebase Emulators at $host');
  } catch (e) {
    print('⚠️ Emulator connection failed: $e');
  }

  final productController = ProductController();
  productController.initSampleProducts();

  runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => productController),
      ChangeNotifierProvider(create: (_) {
        final c = CategoryController();
        c.loadCategories(); // 👈 بارگذاری دسته‌ها بلافاصله بعد از ساخت
        return c;
      }),
      ChangeNotifierProvider(create: (_) => CartController()),
      ChangeNotifierProvider(create: (_) => ThemeController()),
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
    final themeController = Provider.of<ThemeController>(context); // 👈 گرفتن وضعیت تم از کنترلر

    return MaterialApp(
      // 🌍 تنظیم زبان اپلیکیشن
      locale: _locale,
      supportedLocales: const [
        Locale('fa'),
        Locale('ru'),
        Locale('en'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      // 🎨 تنظیم تم برای کل اپلیکیشن
      theme: ThemeData.light(), // 👈 تم روشن
      darkTheme: ThemeData.dark(), // 👈 تم تاریک
      themeMode: themeController.themeMode, // 👈 انتخاب حالت تم از کنترلر (روشن، تاریک، یا سیستم)

      debugShowCheckedModeBanner: false,
      home: ProductsScreen(onLocaleChanged: changeLocale),
      routes: {
        '/cart': (context) => CartScreen(showBackButton: true),
      },
    );
  }
}
