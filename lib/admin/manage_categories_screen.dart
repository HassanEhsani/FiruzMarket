import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../utils/translation_helper.dart'; // برای متد translate()

class ManageCategoriesScreen extends StatelessWidget {
  const ManageCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(appLoc.translate('category_management')),
      ),
      body: Center(
        child: Text(appLoc.translate('category_management_page')),
      ),
    );
  }
}