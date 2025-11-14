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
  String get profileTitle => 'My Profile';

  @override
  String get cartTitle => 'Cart';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get logout => 'Logout';

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
  String get changeCurrency => 'Change Currency';

  @override
  String get changePassword => 'Change Password';

  @override
  String get changeLanguage => 'Change Language';

  @override
  String get orderHistory => 'Order History';

  @override
  String get savedAddresses => 'Saved Addresses';

  @override
  String get nameLabel => 'Full Name';

  @override
  String get emailLabel => 'Email';

  @override
  String get phoneLabel => 'Mobile Number';

  @override
  String get saveChanges => 'Save Changes';

  @override
  String get changePasswordTitle => 'Change Password';

  @override
  String get currentPassword => 'Current Password';

  @override
  String get newPassword => 'New Password';

  @override
  String get repeatNewPassword => 'Repeat New Password';

  @override
  String get changePasswordButton => 'Change Password';

  @override
  String get languageSettingsTitle => 'Language Settings';

  @override
  String get selectLanguagePrompt => 'Select your preferred language';

  @override
  String get languageFarsi => 'Farsi';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageRussian => 'Russian';

  @override
  String get saveLanguageButton => 'Save Language';

  @override
  String get currencySettingsTitle => 'Currency Settings';

  @override
  String get selectCurrencyPrompt => 'Select your preferred currency';

  @override
  String get currencyIRR => 'Iranian Rial';

  @override
  String get currencyUSD => '\$ US Dollar';

  @override
  String get currencyEUR => '€ Euro';

  @override
  String get currencyRUB => '₽ Russian Ruble';

  @override
  String get saveCurrencyButton => 'Save Currency';

  @override
  String get orderHistoryTitle => 'Order History';

  @override
  String get orderAmount => 'Amount';

  @override
  String get orderStatusDelivered => 'Delivered';

  @override
  String get orderStatusShipping => 'Shipping';

  @override
  String get orderStatusCancelled => 'Cancelled';

  @override
  String get orderNumber => 'Order Number';

  @override
  String get orderDate => 'Date';

  @override
  String get passwordChangedSuccess => 'Password changed successfully';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get fieldCannotBeEmpty => 'This field cannot be empty';

  @override
  String get passwordTooShort => 'Password must be at least 6 characters';

  @override
  String get saveChangesSuccess => 'Information saved successfully';

  @override
  String languageSelectedMessage(Object language) {
    return 'Language \"$language\" selected';
  }

  @override
  String get currencyAFN => ' Afghan Afghani';

  @override
  String get currencyTJS => 'Ѕ Tajikistani Somoni';

  @override
  String currencySelectedMessage(Object currency) {
    return 'Currency \"$currency\" selected';
  }

  @override
  String get noOrdersMessage => 'You haven\'t placed any orders yet';

  @override
  String get orderDateLabel => 'Date';

  @override
  String orderSelectedMessage(Object orderId) {
    return 'Order \"$orderId\" selected';
  }

  @override
  String get savedAddressesTitle => 'Saved Addresses';

  @override
  String get noAddressesMessage => 'You haven\'t saved any addresses yet';

  @override
  String get addAddressButton => 'Add Address';

  @override
  String get addAddressMessage => 'Add new address';

  @override
  String get deleteAddressButton => 'Delete Address';

  @override
  String get addressDeletedMessage => 'Address deleted';

  @override
  String addressSelectedMessage(Object address) {
    return 'Address \"$address\" selected';
  }

  @override
  String get favoritesTitle => 'Favorites';

  @override
  String get noFavoritesMessage => 'No products in your favorites';

  @override
  String get addToCartButton => 'Add to Cart';

  @override
  String productAddedToCartMessage(Object productName) {
    return '\"$productName\" has been added to your cart';
  }

  @override
  String get themeSystem => 'System Default';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get back_to_login => 'Back to Login';

  @override
  String get wrong_password => 'The password is incorrect';
}
