// ✅ File modified for Firebase Emulator usage
// ignore_for_file: type=lint

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    // در حالت emulator نیازی به تفاوت بین پلتفرم‌ها نیست
    return emulator;
  }

  // 🔥 این تنظیمات مخصوص emulator است (localhost)
  static const FirebaseOptions emulator = FirebaseOptions(
    apiKey: 'fake-api-key', // مقدارهای ساختگی
    appId: '1:111111111111:web:emulator1234',
    messagingSenderId: '111111111111',
    projectId: 'firuzmarket-54136',
    storageBucket: 'firuzmarket-54136.appspot.com',
  );

  // 🔸 در صورت نیاز به نسخه اصلی (نه emulator) این بخش‌ها را برگردان
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCmdJ1isqYAS1v-bQxopvy8QqQx3yEBLgc',
    appId: '1:202974235575:web:254e4e59ead0d21ea3f632',
    messagingSenderId: '202974235575',
    projectId: 'firuzmarket-54136',
    authDomain: 'firuzmarket-54136.firebaseapp.com',
    storageBucket: 'firuzmarket-54136.appspot.com',
    measurementId: 'G-GE6TJ0Z104',
  );
}
