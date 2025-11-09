import 'package:flutter/material.dart';

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
    // TODO: اتصال به فرم افزودن آدرس
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('افزودن آدرس جدید')),
    );
  }

  void _deleteAddress(int index) {
    setState(() {
      _addresses.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('آدرس حذف شد')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('آدرس‌های ذخیره‌شده'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0.5,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_location_alt),
            onPressed: _addAddress,
            tooltip: 'افزودن آدرس',
          ),
        ],
      ),
      body: ListView.separated(
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
              tooltip: 'حذف آدرس',
            ),
          );
        },
      ),
    );
  }
}
