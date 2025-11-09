import 'package:flutter/material.dart';

class LanguageSettingsScreen extends StatefulWidget {
  const LanguageSettingsScreen({super.key});

  @override
  State<LanguageSettingsScreen> createState() => _LanguageSettingsScreenState();
}

class _LanguageSettingsScreenState extends State<LanguageSettingsScreen> {
  String _selectedLanguage = 'fa';

  final Map<String, String> _languages = {
    'fa': 'فارسی',
    'en': 'English',
    'ru': 'Русский',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تنظیمات زبان'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0.5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'زبان مورد نظر را انتخاب کنید:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            ..._languages.entries.map((entry) {
              return RadioListTile<String>(
                value: entry.key,
                groupValue: _selectedLanguage,
                title: Text(entry.value),
                onChanged: (value) {
                  setState(() {
                    _selectedLanguage = value!;
                  });
                },
              );
            }).toList(),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // TODO: ذخیره زبان انتخاب‌شده
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('زبان "${_languages[_selectedLanguage]}" انتخاب شد')),
                  );
                },
                icon: const Icon(Icons.language),
                label: const Text('ذخیره زبان'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
