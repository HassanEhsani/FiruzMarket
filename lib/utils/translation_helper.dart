import 'package:flutter/widgets.dart';
import '../l10n/app_localizations.dart';

extension AppLocalizationsExtension on AppLocalizations {
  String translate(String key) {
    switch (key) {
      case 'welcome':
        return welcome;
      case 'category_clothing':
        return category_clothing;
      case 'category_digital':
        return category_digital;
      case 'category_food':
        return category_food;
      case 'category_home':
        return category_home;
      case 'category_beauty':
        return category_beauty;
      case 'admin_title':
        return admin_title;
      case 'add_product':
        return add_product;
      case 'manage_products':
        return manage_products;
      case 'manage_categories':
        return manage_categories;
      default:
        return key;
    }
  }

  String translateWithArgs(String key, Map<String, Object> args) {
    switch (key) {
      case 'products_related_to':
        return products_related_to(args['category'] ?? '');
      default:
        return key;
    }
  }
}