import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class LanguageSettingsScreen extends StatefulWidget {
  const LanguageSettingsScreen({super.key});

  @override
  State<LanguageSettingsScreen> createState() => _LanguageSettingsScreenState();
}

class _LanguageSettingsScreenState extends State<LanguageSettingsScreen> {
  String _selectedLanguage = 'fa';

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    final Map<String, String> _languages = {
      'fa': loc.languageFarsi,
      'en': loc.languageEnglish,
      'ru': loc.languageRussian,
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.languageSettingsTitle),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0.5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              loc.selectLanguagePrompt,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                    SnackBar(content: Text('${loc.languageSelectedMessage(_languages[_selectedLanguage] ?? '')}')),
                  );
                },
                icon: const Icon(Icons.language),
                label: Text(loc.saveLanguageButton),
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
