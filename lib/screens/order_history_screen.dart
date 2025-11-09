import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    final List<Map<String, dynamic>> orders = [
      {
        'id': '#FM-1001',
        'date': '2025-11-01',
        'total': '₺ 320,000',
        'status': loc.orderStatusDelivered,
      },
      {
        'id': '#FM-1002',
        'date': '2025-10-28',
        'total': '₺ 180,000',
        'status': loc.orderStatusShipping,
      },
      {
        'id': '#FM-1003',
        'date': '2025-10-15',
        'total': '₺ 245,000',
        'status': loc.orderStatusCancelled,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.orderHistoryTitle),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0.5,
      ),
      body: orders.isEmpty
          ? Center(child: Text(loc.noOrdersMessage))
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: orders.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final order = orders[index];
                return ListTile(
                  leading: const Icon(Icons.shopping_bag),
                  title: Text(order['id']),
                  subtitle: Text('${loc.orderDateLabel}: ${order['date']}'),
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
                      SnackBar(content: Text(loc.orderSelectedMessage(order['id']))),
                    );
                  },
                );
              },
            ),
    );
  }
}
