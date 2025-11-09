import 'package:flutter/material.dart';

class CurrencySettingsScreen extends StatefulWidget {
  const CurrencySettingsScreen({super.key});

  @override
  State<CurrencySettingsScreen> createState() => _CurrencySettingsScreenState();
}

class _CurrencySettingsScreenState extends State<CurrencySettingsScreen> {
  String _selectedCurrency = 'IRR';

  final Map<String, String> _currencies = {
    'IRR': '﷼ ریال ایران',
    'USD': '\$ دلار آمریکا',
    'EUR': '€ یورو',
    'RUB': '₽ روبل روسیه',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تنظیمات واحد پول'),
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
              'واحد پول مورد نظر را انتخاب کنید:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                    SnackBar(content: Text('واحد "${_currencies[_selectedCurrency]}" انتخاب شد')),
                  );
                },
                icon: const Icon(Icons.attach_money),
                label: const Text('ذخیره واحد پول'),
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
