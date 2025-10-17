// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcome => 'Welcome to FiruzMarket!';

  @override
  String get category_clothing => 'Clothing';

  @override
  String get category_digital => 'Digital';

  @override
  String get category_food => 'Food';

  @override
  String get category_home => 'Home Appliances';

  @override
  String get category_beauty => 'Beauty';

  @override
  String products_related_to(Object category) {
    return 'Products related to $category';
  }

  @override
  String get admin_title => 'Admin Panel';

  @override
  String get add_product => '➕ Add Product';

  @override
  String get manage_products => '📝 Manage Products';

  @override
  String get manage_categories => '📂 Manage Categories';

  @override
  String get product_name => 'Product Name';

  @override
  String get price => 'Price';

  @override
  String get save => '💾 Save';

  @override
  String get product_management => 'Product Management';

  @override
  String get product_management_page => 'Product Management Page';

  @override
  String get category_management => 'Category Management';

  @override
  String get category_management_page => 'Category Management Page';
}
