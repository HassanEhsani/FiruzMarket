import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

import 'screens/home_screen.dart';
import 'screens/entry_screen.dart';
import 'l10n/app_localizations.dart';
import 'providers/cart_controller.dart';
import 'providers/product_controller.dart';
import 'providers/category_controller.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // اتصال به Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // ✅ تست اتصال Firestore — می‌تونی بعداً پاکش کنی
  await FirebaseFirestore.instance
      .collection('connection_test')
      .add({'ping': 'ok', 'time': Timestamp.now()});

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartController()),
        ChangeNotifierProvider(create: (_) => ProductController()),
        ChangeNotifierProvider(create: (_) => CategoryController()),
      ],
      child: FiruzMarketApp(), // ❌ بدون const چون تابع داریم
    ),
  );
}

class FiruzMarketApp extends StatefulWidget {
  const FiruzMarketApp({super.key});

  @override
  State<FiruzMarketApp> createState() => _FiruzMarketAppState();
}

class _FiruzMarketAppState extends State<FiruzMarketApp> {
  Locale _locale = const Locale('fa'); // زبان پیش‌فرض

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FiruzMarket',
      theme: ThemeData(primarySwatch: Colors.teal),
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
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      home: EntryScreen(onLocaleChange: setLocale), // ✅ تابع به‌درستی ارسال شد
    );
  }
}