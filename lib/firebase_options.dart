// ignore_for_file: type=lint

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      // 👈 اجرای وب → استفاده از کانفیگ پروژهٔ firuz-market-admin
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        return web;
    }
  }

  // ✅ تنظیمات Web — پروژهٔ صحیح: firuz-market-admin
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDYchyjzthtgfm0319qymWy-z84DDBZnAj0',
    appId: '1:205797022672:web:ea44a3302f41ebd3a8b7d5',
    messagingSenderId: '205797022672',
    projectId: 'firuz-market-admin',
    authDomain: 'firuz-market-admin.firebaseapp.com',
    storageBucket: 'firuz-market-admin.appspot.com', // ✅ اصلاح شد
    measurementId: 'G-MH3GB8FFZC',
  );

  // ⛔ اگر اندروید/آی‌او‌اس فعلاً نداری، می‌تونی همین مقادیر را خالی بگذاری یا بعداً پر کنی
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: '<<apiKey اندروید>>',
    appId: '<<appId اندروید>>',
    messagingSenderId: '205797022672',
    projectId: 'firuz-market-admin',
    storageBucket: 'firuz-market-admin.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: '<<apiKey آی‌او‌اس>>',
    appId: '<<appId آی‌او‌اس>>',
    messagingSenderId: '205797022672',
    projectId: 'firuz-market-admin',
    storageBucket: 'firuz-market-admin.appspot.com',
    iosClientId: '<<clientId آی‌او‌اس>>',
    iosBundleId: '<<bundleId آی‌او‌اس>>',
  );
}
