import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('fa'),
    Locale('ru'),
    Locale('en'),
  ];

  /// Welcome message on the home screen
  ///
  /// In en, this message translates to:
  /// **'Welcome to FiruzMarket!'**
  String get welcome;

  /// Clothing category label
  ///
  /// In en, this message translates to:
  /// **'Clothing'**
  String get category_clothing;

  /// Digital category label
  ///
  /// In en, this message translates to:
  /// **'Digital'**
  String get category_digital;

  /// Food category label
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get category_food;

  /// Home appliances category label
  ///
  /// In en, this message translates to:
  /// **'Home Appliances'**
  String get category_home;

  /// Beauty category label
  ///
  /// In en, this message translates to:
  /// **'Beauty'**
  String get category_beauty;

  /// Title for products related to a category
  ///
  /// In en, this message translates to:
  /// **'Products related to {category}'**
  String products_related_to(Object category);

  /// Title of the admin panel screen
  ///
  /// In en, this message translates to:
  /// **'Admin Panel'**
  String get admin_title;

  /// Button label to add a product
  ///
  /// In en, this message translates to:
  /// **'➕ Add Product'**
  String get add_product;

  /// Button label to manage products
  ///
  /// In en, this message translates to:
  /// **'📝 Manage Products'**
  String get manage_products;

  /// Button label to manage categories
  ///
  /// In en, this message translates to:
  /// **'📂 Manage Categories'**
  String get manage_categories;

  /// Label for product name input field
  ///
  /// In en, this message translates to:
  /// **'Product Name'**
  String get product_name;

  /// Label for product price input field
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// Button label to save product
  ///
  /// In en, this message translates to:
  /// **'💾 Save'**
  String get save;

  /// Title of the product management screen
  ///
  /// In en, this message translates to:
  /// **'Product Management'**
  String get product_management;

  /// Body text for the product management screen
  ///
  /// In en, this message translates to:
  /// **'Product Management Page'**
  String get product_management_page;

  /// Title of the category management screen
  ///
  /// In en, this message translates to:
  /// **'Category Management'**
  String get category_management;

  /// Body text for the category management screen
  ///
  /// In en, this message translates to:
  /// **'Category Management Page'**
  String get category_management_page;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search for product...'**
  String get searchHint;

  /// No description provided for @categoryClothing.
  ///
  /// In en, this message translates to:
  /// **'Clothing'**
  String get categoryClothing;

  /// No description provided for @categoryDigital.
  ///
  /// In en, this message translates to:
  /// **'Digital'**
  String get categoryDigital;

  /// No description provided for @categoryHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get categoryHome;

  /// No description provided for @categorySports.
  ///
  /// In en, this message translates to:
  /// **'Sports'**
  String get categorySports;

  /// No description provided for @categoryAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get categoryAll;

  /// No description provided for @errorLoadingProducts.
  ///
  /// In en, this message translates to:
  /// **'Error loading products'**
  String get errorLoadingProducts;

  /// No description provided for @noProductsFound.
  ///
  /// In en, this message translates to:
  /// **'No products found'**
  String get noProductsFound;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navSpecial.
  ///
  /// In en, this message translates to:
  /// **'Special'**
  String get navSpecial;

  /// No description provided for @navFood.
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get navFood;

  /// No description provided for @navFavorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get navFavorites;

  /// No description provided for @navCart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get navCart;

  /// No description provided for @navProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// No description provided for @productTshirt.
  ///
  /// In en, this message translates to:
  /// **'T-shirt'**
  String get productTshirt;

  /// No description provided for @productShoes.
  ///
  /// In en, this message translates to:
  /// **'Shoes'**
  String get productShoes;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get profileTitle;

  /// No description provided for @cartTitle.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cartTitle;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @emptyCart.
  ///
  /// In en, this message translates to:
  /// **'Your cart is empty'**
  String get emptyCart;

  /// No description provided for @totalPrice.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get totalPrice;

  /// No description provided for @payNow.
  ///
  /// In en, this message translates to:
  /// **'Pay Now'**
  String get payNow;

  /// No description provided for @categoryBeauty.
  ///
  /// In en, this message translates to:
  /// **'Beauty'**
  String get categoryBeauty;

  /// No description provided for @categoryBooks.
  ///
  /// In en, this message translates to:
  /// **'Books'**
  String get categoryBooks;

  /// No description provided for @adminWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome, please log in'**
  String get adminWelcome;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter admin password'**
  String get enterPassword;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @changeCurrency.
  ///
  /// In en, this message translates to:
  /// **'Change Currency'**
  String get changeCurrency;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguage;

  /// No description provided for @orderHistory.
  ///
  /// In en, this message translates to:
  /// **'Order History'**
  String get orderHistory;

  /// No description provided for @savedAddresses.
  ///
  /// In en, this message translates to:
  /// **'Saved Addresses'**
  String get savedAddresses;

  /// No description provided for @nameLabel.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get nameLabel;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @phoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get phoneLabel;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChanges;

  /// No description provided for @changePasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePasswordTitle;

  /// No description provided for @currentPassword.
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get currentPassword;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @repeatNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Repeat New Password'**
  String get repeatNewPassword;

  /// No description provided for @changePasswordButton.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePasswordButton;

  /// No description provided for @languageSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Language Settings'**
  String get languageSettingsTitle;

  /// No description provided for @selectLanguagePrompt.
  ///
  /// In en, this message translates to:
  /// **'Select your preferred language'**
  String get selectLanguagePrompt;

  /// No description provided for @languageFarsi.
  ///
  /// In en, this message translates to:
  /// **'Farsi'**
  String get languageFarsi;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageRussian.
  ///
  /// In en, this message translates to:
  /// **'Russian'**
  String get languageRussian;

  /// No description provided for @saveLanguageButton.
  ///
  /// In en, this message translates to:
  /// **'Save Language'**
  String get saveLanguageButton;

  /// No description provided for @currencySettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Currency Settings'**
  String get currencySettingsTitle;

  /// No description provided for @selectCurrencyPrompt.
  ///
  /// In en, this message translates to:
  /// **'Select your preferred currency'**
  String get selectCurrencyPrompt;

  /// No description provided for @currencyIRR.
  ///
  /// In en, this message translates to:
  /// **'Iranian Rial'**
  String get currencyIRR;

  /// No description provided for @currencyUSD.
  ///
  /// In en, this message translates to:
  /// **'\$ US Dollar'**
  String get currencyUSD;

  /// No description provided for @currencyEUR.
  ///
  /// In en, this message translates to:
  /// **'€ Euro'**
  String get currencyEUR;

  /// No description provided for @currencyRUB.
  ///
  /// In en, this message translates to:
  /// **'₽ Russian Ruble'**
  String get currencyRUB;

  /// No description provided for @saveCurrencyButton.
  ///
  /// In en, this message translates to:
  /// **'Save Currency'**
  String get saveCurrencyButton;

  /// No description provided for @orderHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Order History'**
  String get orderHistoryTitle;

  /// No description provided for @orderAmount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get orderAmount;

  /// No description provided for @orderStatusDelivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get orderStatusDelivered;

  /// No description provided for @orderStatusShipping.
  ///
  /// In en, this message translates to:
  /// **'Shipping'**
  String get orderStatusShipping;

  /// No description provided for @orderStatusCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get orderStatusCancelled;

  /// No description provided for @orderNumber.
  ///
  /// In en, this message translates to:
  /// **'Order Number'**
  String get orderNumber;

  /// No description provided for @orderDate.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get orderDate;

  /// No description provided for @passwordChangedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Password changed successfully'**
  String get passwordChangedSuccess;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @fieldCannotBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'This field cannot be empty'**
  String get fieldCannotBeEmpty;

  /// No description provided for @passwordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordTooShort;

  /// No description provided for @saveChangesSuccess.
  ///
  /// In en, this message translates to:
  /// **'Information saved successfully'**
  String get saveChangesSuccess;

  /// No description provided for @languageSelectedMessage.
  ///
  /// In en, this message translates to:
  /// **'Language \"{language}\" selected'**
  String languageSelectedMessage(Object language);

  /// No description provided for @currencyAFN.
  ///
  /// In en, this message translates to:
  /// **' Afghan Afghani'**
  String get currencyAFN;

  /// No description provided for @currencyTJS.
  ///
  /// In en, this message translates to:
  /// **'Ѕ Tajikistani Somoni'**
  String get currencyTJS;

  /// Message shown when a currency is selected
  ///
  /// In en, this message translates to:
  /// **'Currency \"{currency}\" selected'**
  String currencySelectedMessage(Object currency);

  /// No description provided for @noOrdersMessage.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t placed any orders yet'**
  String get noOrdersMessage;

  /// No description provided for @orderDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get orderDateLabel;

  /// Message shown when an order is selected
  ///
  /// In en, this message translates to:
  /// **'Order \"{orderId}\" selected'**
  String orderSelectedMessage(Object orderId);

  /// No description provided for @savedAddressesTitle.
  ///
  /// In en, this message translates to:
  /// **'Saved Addresses'**
  String get savedAddressesTitle;

  /// No description provided for @noAddressesMessage.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t saved any addresses yet'**
  String get noAddressesMessage;

  /// No description provided for @addAddressButton.
  ///
  /// In en, this message translates to:
  /// **'Add Address'**
  String get addAddressButton;

  /// No description provided for @addAddressMessage.
  ///
  /// In en, this message translates to:
  /// **'Add new address'**
  String get addAddressMessage;

  /// No description provided for @deleteAddressButton.
  ///
  /// In en, this message translates to:
  /// **'Delete Address'**
  String get deleteAddressButton;

  /// No description provided for @addressDeletedMessage.
  ///
  /// In en, this message translates to:
  /// **'Address deleted'**
  String get addressDeletedMessage;

  /// Message shown when an address is selected
  ///
  /// In en, this message translates to:
  /// **'Address \"{address}\" selected'**
  String addressSelectedMessage(Object address);

  /// No description provided for @favoritesTitle.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favoritesTitle;

  /// No description provided for @noFavoritesMessage.
  ///
  /// In en, this message translates to:
  /// **'No products in your favorites'**
  String get noFavoritesMessage;

  /// No description provided for @addToCartButton.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart'**
  String get addToCartButton;

  /// Message shown when a product is added to the cart
  ///
  /// In en, this message translates to:
  /// **'\"{productName}\" has been added to your cart'**
  String productAddedToCartMessage(Object productName);

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System Default'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @back_to_login.
  ///
  /// In en, this message translates to:
  /// **'Back to Login'**
  String get back_to_login;

  /// No description provided for @wrong_password.
  ///
  /// In en, this message translates to:
  /// **'The password is incorrect'**
  String get wrong_password;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fa', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fa':
      return AppLocalizationsFa();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
