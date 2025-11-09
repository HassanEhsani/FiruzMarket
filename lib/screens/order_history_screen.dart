import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> orders = [
      {
        'id': '#FM-1001',
        'date': '2025-11-01',
        'total': '₺ 320,000',
        'status': 'تحویل شده',
      },
      {
        'id': '#FM-1002',
        'date': '2025-10-28',
        'total': '₺ 180,000',
        'status': 'در حال ارسال',
      },
      {
        'id': '#FM-1003',
        'date': '2025-10-15',
        'total': '₺ 245,000',
        'status': 'لغو شده',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('تاریخچه سفارش‌ها'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0.5,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: orders.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final order = orders[index];
          return ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: Text(order['id']),
            subtitle: Text('تاریخ: ${order['date']}'),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(order['total'], style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(order['status'], style: const TextStyle(fontSize: 12)),
              ],
            ),
            onTap: () {
              // TODO: نمایش جزئیات سفارش
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('سفارش ${order['id']} انتخاب شد')),
              );
            },
          );
        },
      ),
    );
  }
}
