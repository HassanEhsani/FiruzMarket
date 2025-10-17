import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../utils/translation_helper.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate('category_clothing')),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text(
          AppLocalizations.of(context)!.translate('category_clothing'),
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}