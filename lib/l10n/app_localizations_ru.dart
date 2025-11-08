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

  @override
  String get searchHint => 'Поиск товара...';

  @override
  String get categoryClothing => 'Одежда';

  @override
  String get categoryDigital => 'Цифровое';

  @override
  String get categoryHome => 'Дом';

  @override
  String get categorySports => 'Спорт';

  @override
  String get categoryAll => 'Все';

  @override
  String get errorLoadingProducts => 'Ошибка при загрузке товаров';

  @override
  String get noProductsFound => 'Товары не найдены';

  @override
  String get navHome => 'Главная';

  @override
  String get navSpecial => 'Специальное';

  @override
  String get navFood => 'Еда';

  @override
  String get navFavorites => 'Избранное';

  @override
  String get navCart => 'Корзина';

  @override
  String get navProfile => 'Профиль';

  @override
  String get productTshirt => 'Футболка';

  @override
  String get productShoes => 'Обувь';

  @override
  String get profileTitle => 'Профиль';

  @override
  String get cartTitle => 'Корзина';

  @override
  String get editProfile => 'Редактировать профиль';

  @override
  String get logout => 'Выйти';

  @override
  String get emptyCart => 'Корзина пуста';

  @override
  String get totalPrice => 'Итого';

  @override
  String get payNow => 'Оплатить';

  @override
  String get categoryBeauty => 'Красота';

  @override
  String get categoryBooks => 'Книги';

  @override
  String get adminWelcome => 'Добро пожаловать, пожалуйста, войдите';

  @override
  String get enterPassword => 'Введите пароль администратора';

  @override
  String get login => 'Войти';

  @override
  String get changeCurrency => 'Сменить валюту';

  @override
  String get changePassword => 'Сменить пароль';

  @override
  String get changeLanguage => 'Сменить язык';

  @override
  String get orderHistory => 'История заказов';

  @override
  String get savedAddresses => 'Сохранённые адреса';
}
