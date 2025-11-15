import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'firebase_options.dart';
import 'providers/category_controller.dart';
import 'providers/product_controller.dart';
import 'providers/cart_controller.dart';
import 'providers/theme_controller.dart';
import 'screens/products_screen.dart';
import 'screens/cart_screen.dart';
import 'l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print("✅ Firebase initialized with projectId: ${DefaultFirebaseOptions.web.projectId}");

  final productController = ProductController();
  productController.initSampleProducts();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => productController),
        ChangeNotifierProvider(create: (_) {
          final c = CategoryController();
          c.start(); // ✅ استریم دسته‌ها
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
    final themeController = Provider.of<ThemeController>(context);

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
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeController.themeMode,
      debugShowCheckedModeBanner: false,
      home: ProductsScreen(onLocaleChanged: changeLocale),
      routes: {
        '/cart': (context) => CartScreen(showBackButton: true),
      },
    );
  }
}
