import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ManageProductsScreen extends StatelessWidget {
  const ManageProductsScreen({super.key});

  Future<void> _deleteProduct(String docId, BuildContext context) async {
    try {
      await FirebaseFirestore.instance
          .collection('products')
          .doc(docId)
          .delete();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('✅ محصول حذف شد'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('خطا در حذف محصول: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('مدیریت محصولات'),
          backgroundColor: const Color(0xFFB2DFDB), // سبز یواش
          centerTitle: true,
          elevation: 0,
          foregroundColor: Colors.black87,
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('products').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('خطا در دریافت محصولات'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            final products = snapshot.data!.docs;

            if (products.isEmpty) {
              return const Center(
                child: Text(
                  'هیچ محصولی ثبت نشده است',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final doc = products[index];
                final data = doc.data() as Map<String, dynamic>;

                final name = data['name']?.toString() ?? 'نام نامشخص';
                final price = data['price']?.toString() ?? 'نامشخص';
                final category = data['category']?.toString() ?? 'نامشخص';
                final imageName = data['imageName']?.toString();

                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    leading: imageName != null
                        ? Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.image, color: Colors.grey),
                                Text(
                                  imageName,
                                  style: const TextStyle(fontSize: 10),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          )
                        : const Icon(
                            Icons.image_not_supported,
                            size: 40,
                            color: Colors.grey,
                          ),
                    title: Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        'قیمت: $price روبل\nدسته: $category',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black54,
                          height: 1.4,
                        ),
                      ),
                    ),
                    isThreeLine: true,
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteProduct(doc.id, context),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
