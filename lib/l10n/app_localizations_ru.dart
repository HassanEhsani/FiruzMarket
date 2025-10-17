// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get welcome => 'Добро пожаловать в FiruzMarket!';

  @override
  String get category_clothing => 'Одежда';

  @override
  String get category_digital => 'Электроника';

  @override
  String get category_food => 'Продукты';

  @override
  String get category_home => 'Бытовая техника';

  @override
  String get category_beauty => 'Красота';

  @override
  String products_related_to(Object category) {
    return 'Товары, связанные с $category';
  }

  @override
  String get admin_title => 'Панель администратора';

  @override
  String get add_product => '➕ Добавить товар';

  @override
  String get manage_products => '📝 Управление товарами';

  @override
  String get manage_categories => '📂 Управление категориями';

  @override
  String get product_name => 'Название товара';

  @override
  String get price => 'Цена';

  @override
  String get save => '💾 Сохранить';

  @override
  String get product_management => 'Управление товарами';

  @override
  String get product_management_page => 'Страница управления товарами';

  @override
  String get category_management => 'Управление категориями';

  @override
  String get category_management_page => 'Страница управления категориями';
}
