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
  /// **'Profile'**
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
  /// **'Log Out'**
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
