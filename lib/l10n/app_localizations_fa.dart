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
  String get navFavorites => 'علاقه‌مندی';

  @override
  String get navCart => 'سبد خرید';

  @override
  String get navProfile => 'پروفایل';

  @override
  String get productTshirt => 'تی‌شرت';

  @override
  String get productShoes => 'کفش';

  @override
  String get profileTitle => 'پروفایل';

  @override
  String get cartTitle => 'سبد خرید';

  @override
  String get editProfile => 'ویرایش اطلاعات';

  @override
  String get logout => 'خروج از حساب';

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
}
