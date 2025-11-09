// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get welcome => 'به فیروزمارکت خوش آمدید!';

  @override
  String get category_clothing => 'پوشاک';

  @override
  String get category_digital => 'دیجیتال';

  @override
  String get category_food => 'خوراکی';

  @override
  String get category_home => 'لوازم خانگی';

  @override
  String get category_beauty => 'زیبایی';

  @override
  String products_related_to(Object category) {
    return 'محصولات مرتبط با $category';
  }

  @override
  String get admin_title => 'پنل مدیریت';

  @override
  String get add_product => '➕ افزودن محصول';

  @override
  String get manage_products => '📝 مدیریت محصولات';

  @override
  String get manage_categories => '📂 مدیریت دسته‌ها';

  @override
  String get product_name => 'نام محصول';

  @override
  String get price => 'قیمت';

  @override
  String get save => '💾 ذخیره';

  @override
  String get product_management => 'مدیریت محصولات';

  @override
  String get product_management_page => 'صفحه مدیریت محصولات';

  @override
  String get category_management => 'مدیریت دسته‌ها';

  @override
  String get category_management_page => 'صفحه مدیریت دسته‌ها';

  @override
  String get searchHint => 'جستجوی محصول...';

  @override
  String get categoryClothing => 'پوشاک';

  @override
  String get categoryDigital => 'دیجیتال';

  @override
  String get categoryHome => 'خانه';

  @override
  String get categorySports => 'ورزشی';

  @override
  String get categoryAll => 'همه';

  @override
  String get errorLoadingProducts => 'خطا در دریافت محصولات';

  @override
  String get noProductsFound => 'هیچ محصولی یافت نشد';

  @override
  String get navHome => 'خانه';

  @override
  String get navSpecial => 'ویژه';

  @override
  String get navFood => 'خوراکی';

  @override
  String get navFavorites => 'علاقه‌مندی‌ها';

  @override
  String get navCart => 'سبد خرید';

  @override
  String get navProfile => 'پروفایل';

  @override
  String get productTshirt => 'تی‌شرت';

  @override
  String get productShoes => 'کفش';

  @override
  String get profileTitle => 'پروفایل من';

  @override
  String get cartTitle => 'سبد خرید';

  @override
  String get editProfile => 'ویرایش پروفایل';

  @override
  String get logout => 'خروج';

  @override
  String get emptyCart => 'سبد خرید خالی است';

  @override
  String get totalPrice => 'جمع کل';

  @override
  String get payNow => 'پرداخت';

  @override
  String get categoryBeauty => 'زیبایی';

  @override
  String get categoryBooks => 'کتاب';

  @override
  String get adminWelcome => 'خوش آمدید، لطفاً وارد شوید';

  @override
  String get enterPassword => 'رمز عبور را وارد کنید';

  @override
  String get login => 'ورود';

  @override
  String get changeCurrency => 'تغییر واحد پول';

  @override
  String get changePassword => 'تغییر رمز عبور';

  @override
  String get changeLanguage => 'تغییر زبان';

  @override
  String get orderHistory => 'تاریخچه سفارش‌ها';

  @override
  String get savedAddresses => 'آدرس‌های ذخیره‌شده';

  @override
  String get nameLabel => 'نام کامل';

  @override
  String get emailLabel => 'ایمیل';

  @override
  String get phoneLabel => 'شماره موبایل';

  @override
  String get saveChanges => 'ذخیره تغییرات';

  @override
  String get changePasswordTitle => 'تغییر رمز عبور';

  @override
  String get currentPassword => 'رمز فعلی';

  @override
  String get newPassword => 'رمز جدید';

  @override
  String get repeatNewPassword => 'تکرار رمز جدید';

  @override
  String get changePasswordButton => 'تغییر رمز';

  @override
  String get languageSettingsTitle => 'تنظیمات زبان';

  @override
  String get selectLanguagePrompt => 'زبان مورد نظر را انتخاب کنید';

  @override
  String get languageFarsi => 'فارسی';

  @override
  String get languageEnglish => 'انگلیسی';

  @override
  String get languageRussian => 'روسی';

  @override
  String get saveLanguageButton => 'ذخیره زبان';

  @override
  String get currencySettingsTitle => 'تنظیمات واحد پول';

  @override
  String get selectCurrencyPrompt => 'واحد پول مورد نظر را انتخاب کنید';

  @override
  String get currencyIRR => 'ریال ایران';

  @override
  String get currencyUSD => '\$ دلار آمریکا';

  @override
  String get currencyEUR => '€ یورو';

  @override
  String get currencyRUB => '₽ روبل روسیه';

  @override
  String get saveCurrencyButton => 'ذخیره واحد پول';

  @override
  String get orderHistoryTitle => 'تاریخچه سفارش‌ها';

  @override
  String get orderAmount => 'مبلغ';

  @override
  String get orderStatusDelivered => 'تحویل شده';

  @override
  String get orderStatusShipping => 'در حال ارسال';

  @override
  String get orderStatusCancelled => 'لغو شده';

  @override
  String get orderNumber => 'شماره سفارش';

  @override
  String get orderDate => 'تاریخ';

  @override
  String get passwordChangedSuccess => 'رمز عبور با موفقیت تغییر کرد';

  @override
  String get passwordsDoNotMatch => 'رمزها با هم مطابقت ندارند';

  @override
  String get fieldCannotBeEmpty => 'این فیلد نمی‌تواند خالی باشد';

  @override
  String get passwordTooShort => 'رمز باید حداقل ۶ کاراکتر باشد';

  @override
  String get saveChangesSuccess => 'اطلاعات با موفقیت ذخیره شد';

  @override
  String languageSelectedMessage(Object language) {
    return 'زبان \"$language\" انتخاب شد';
  }

  @override
  String get currencyAFN => ' افغانی افغانستان';

  @override
  String get currencyTJS => 'Ѕ سامانی تاجیکستان';

  @override
  String currencySelectedMessage(Object currency) {
    return 'واحد پول \"$currency\" انتخاب شد';
  }

  @override
  String get noOrdersMessage => 'شما هنوز سفارشی ثبت نکرده‌اید';

  @override
  String get orderDateLabel => 'تاریخ';

  @override
  String orderSelectedMessage(Object orderId) {
    return 'سفارش \"$orderId\" انتخاب شد';
  }

  @override
  String get savedAddressesTitle => 'آدرس‌های ذخیره‌شده';

  @override
  String get noAddressesMessage => 'شما هنوز آدرسی ذخیره نکرده‌اید';

  @override
  String get addAddressButton => 'افزودن آدرس';

  @override
  String get addAddressMessage => 'افزودن آدرس جدید';

  @override
  String get deleteAddressButton => 'حذف آدرس';

  @override
  String get addressDeletedMessage => 'آدرس حذف شد';

  @override
  String addressSelectedMessage(Object address) {
    return 'آدرس \"$address\" انتخاب شد';
  }
}
