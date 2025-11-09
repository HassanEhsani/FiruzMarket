import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class SavedAddressesScreen extends StatefulWidget {
  const SavedAddressesScreen({super.key});

  @override
  State<SavedAddressesScreen> createState() => _SavedAddressesScreenState();
}

class _SavedAddressesScreenState extends State<SavedAddressesScreen> {
  final List<String> _addresses = [
    'تهران، خیابان ولیعصر، پلاک ۱۲۳',
    'مشهد، بلوار سجاد، کوچه ۵',
    'اصفهان، خیابان چهارباغ، ساختمان آفتاب',
  ];

  void _addAddress() {
    final loc = AppLocalizations.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(loc.addAddressMessage)),
    );
  }

  void _deleteAddress(int index) {
    final loc = AppLocalizations.of(context);
    setState(() {
      _addresses.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(loc.addressDeletedMessage)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.savedAddressesTitle),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0.5,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_location_alt),
            onPressed: _addAddress,
            tooltip: loc.addAddressButton,
          ),
        ],
      ),
      body: _addresses.isEmpty
          ? Center(child: Text(loc.noAddressesMessage))
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: _addresses.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final address = _addresses[index];
                return ListTile(
                  leading: const Icon(Icons.location_on),
                  title: Text(address),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => _deleteAddress(index),
                    tooltip: loc.deleteAddressButton,
                  ),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(loc.addressSelectedMessage(address))),
                    );
                  },
                );
              },
            ),
    );
  }
}
