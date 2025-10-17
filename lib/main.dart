import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart'; // اضافه برای Provider
import 'screens/home_screen.dart';
import 'l10n/app_localizations.dart';
import 'providers/cart_controller.dart'; // مسیر جدید

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartController()),
      ],
      child: const FiruzMarketApp(),
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
      home: HomeScreen(
        key: ValueKey(_locale.languageCode), // ری‌بیلد شدن صفحه با تغییر زبان
        onLocaleChange: setLocale,
      ),
    );
  }
}