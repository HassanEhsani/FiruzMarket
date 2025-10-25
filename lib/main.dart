import 'package:flutter/material.dart';
import 'user/profile_page.dart'; // مطمئن شو این فایل وجود داره

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ هندل کردن خطاها برای جلوگیری از صفحه سفید
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
  };

  ErrorWidget.builder = (FlutterErrorDetails details) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Runtime error: ${details.exception}',
            style: const TextStyle(color: Colors.red, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  };

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(), // صفحه پروفایل برای تست
    );
  }
}