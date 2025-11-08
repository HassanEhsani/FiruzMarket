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

  @override
  String get searchHint => 'Search for product...';

  @override
  String get categoryClothing => 'Clothing';

  @override
  String get categoryDigital => 'Digital';

  @override
  String get categoryHome => 'Home';

  @override
  String get categorySports => 'Sports';

  @override
  String get categoryAll => 'All';

  @override
  String get errorLoadingProducts => 'Error loading products';

  @override
  String get noProductsFound => 'No products found';

  @override
  String get navHome => 'Home';

  @override
  String get navSpecial => 'Special';

  @override
  String get navFood => 'Food';

  @override
  String get navFavorites => 'Favorites';

  @override
  String get navCart => 'Cart';

  @override
  String get navProfile => 'Profile';

  @override
  String get productTshirt => 'T-shirt';

  @override
  String get productShoes => 'Shoes';

  @override
  String get profileTitle => 'Profile';

  @override
  String get cartTitle => 'Cart';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get logout => 'Log Out';

  @override
  String get emptyCart => 'Your cart is empty';

  @override
  String get totalPrice => 'Total';

  @override
  String get payNow => 'Pay Now';

  @override
  String get categoryBeauty => 'Beauty';

  @override
  String get categoryBooks => 'Books';

  @override
  String get adminWelcome => 'Welcome, please log in';

  @override
  String get enterPassword => 'Enter admin password';

  @override
  String get login => 'Login';

  @override
  String get changeCurrency => 'Change currency';

  @override
  String get changePassword => 'Change password';

  @override
  String get changeLanguage => 'Change language';

  @override
  String get orderHistory => 'Order history';

  @override
  String get savedAddresses => 'Saved addresses';
}
