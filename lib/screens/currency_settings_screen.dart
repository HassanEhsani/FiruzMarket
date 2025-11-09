import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class CurrencySettingsScreen extends StatefulWidget {
  const CurrencySettingsScreen({super.key});

  @override
  State<CurrencySettingsScreen> createState() => _CurrencySettingsScreenState();
}

class _CurrencySettingsScreenState extends State<CurrencySettingsScreen> {
  String _selectedCurrency = 'AFN';

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    final Map<String, String> _currencies = {
      'AFN': loc.currencyAFN, // افغانی افغانستان
      'TJS': loc.currencyTJS, // سامانی تاجیکستان
      'USD': loc.currencyUSD,
      'EUR': loc.currencyEUR,
      'RUB': loc.currencyRUB,
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.currencySettingsTitle),
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
              loc.selectCurrencyPrompt,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            ..._currencies.entries.map((entry) {
              return RadioListTile<String>(
                value: entry.key,
                groupValue: _selectedCurrency,
                title: Text(entry.value),
                onChanged: (value) {
                  setState(() {
                    _selectedCurrency = value!;
                  });
                },
              );
            }).toList(),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // TODO: ذخیره واحد پول انتخاب‌شده
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        loc.currencySelectedMessage(_currencies[_selectedCurrency] ?? ''),
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.attach_money),
                label: Text(loc.saveCurrencyButton),
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
