import 'package:flutter/material.dart';

class LanguageSwitcher extends StatelessWidget {
  final void Function(Locale) onLocaleChanged;
  final Locale currentLocale;

  const LanguageSwitcher({
    super.key,
    required this.onLocaleChanged,
    required this.currentLocale,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Locale>(
      value: currentLocale,
      onChanged: (Locale? newLocale) {
        if (newLocale != null) {
          onLocaleChanged(newLocale);
        }
      },
      underline: const SizedBox(),
      icon: const Icon(Icons.language, color: Colors.black),
      dropdownColor: Colors.grey[900],
      items: const [
        DropdownMenuItem(
          value: Locale('fa'),
          child: Text('فارسی', style: TextStyle(color: Colors.white)),
        ),
        DropdownMenuItem(
          value: Locale('ru'),
          child: Text('Русский', style: TextStyle(color: Colors.white)),
        ),
        DropdownMenuItem(
          value: Locale('en'),
          child: Text('English', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}