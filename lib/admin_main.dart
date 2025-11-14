import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_localizations/flutter_localizations.dart';

import 'admin/admin_panel_screen.dart';
import 'admin/admin_dashboard.dart';
import 'admin/manage_products_screen.dart';
import 'admin/manage_categories_screen.dart';
import 'admin/admin_login_screen.dart';

import 'firebase_options.dart';
import 'providers/product_controller.dart';
import 'providers/cart_controller.dart';
import 'providers/category_controller.dart';
import 'screens/products_screen.dart';
import 'screens/cart_screen.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase initialization
  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      print("✅ Firebase initialized (admin)");
    } else {
      print("♻️ Using existing Firebase app");
    }
  } catch (e) {
    print("⚠️ Firebase already initialized: $e");
  }

  // Emulator only for Android / iOS
  if (!kIsWeb) {
    FirebaseFirestore.instance.useFirestoreEmulator('127.0.0.1', 8084);
    FirebaseStorage.instance.useStorageEmulator('127.0.0.1', 9198);
    print('🟢 Using Firebase Emulator');
  } else {
    print('🟡 Web → Emulator Firestore/Storage skipped (not fully supported)');
  }

  final productController = ProductController();
  productController.initSampleProducts();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => productController),
        ChangeNotifierProvider(create: (_) => CartController()),
        ChangeNotifierProvider(create: (_) => CategoryController()), // ✅ اضافه شد
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
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF4CAF50),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,

      home: AdminLoginScreen(selectedLocale: _locale),

      routes: {
        '/admin/panel': (context) =>
            AdminPanelScreen(selectedLocale: _locale),
        '/admin/dashboard': (context) => const AdminDashboard(),
        '/admin/products': (context) => const ManageProductsScreen(),
        '/admin/categories': (context) => const ManageCategoriesScreen(),
      },
    );
  }
}
