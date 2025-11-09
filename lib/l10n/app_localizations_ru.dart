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
  String get profileTitle => 'Мой профиль';

  @override
  String get cartTitle => 'Корзина';

  @override
  String get editProfile => 'Редактировать профиль';

  @override
  String get logout => 'Выход';

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

  @override
  String get nameLabel => 'Полное имя';

  @override
  String get emailLabel => 'Эл. почта';

  @override
  String get phoneLabel => 'Номер телефона';

  @override
  String get saveChanges => 'Сохранить изменения';

  @override
  String get changePasswordTitle => 'Сменить пароль';

  @override
  String get currentPassword => 'Текущий пароль';

  @override
  String get newPassword => 'Новый пароль';

  @override
  String get repeatNewPassword => 'Повторите новый пароль';

  @override
  String get changePasswordButton => 'Сменить пароль';

  @override
  String get languageSettingsTitle => 'Настройки языка';

  @override
  String get selectLanguagePrompt => 'Выберите предпочитаемый язык';

  @override
  String get languageFarsi => 'Фарси';

  @override
  String get languageEnglish => 'Английский';

  @override
  String get languageRussian => 'Русский';

  @override
  String get saveLanguageButton => 'Сохранить язык';

  @override
  String get currencySettingsTitle => 'Настройки валюты';

  @override
  String get selectCurrencyPrompt => 'Выберите предпочитаемую валюту';

  @override
  String get currencyIRR => 'Иранский риал';

  @override
  String get currencyUSD => '\$ Доллар США';

  @override
  String get currencyEUR => '€ Евро';

  @override
  String get currencyRUB => '₽ Российский рубль';

  @override
  String get saveCurrencyButton => 'Сохранить валюту';

  @override
  String get orderHistoryTitle => 'История заказов';

  @override
  String get orderAmount => 'Сумма';

  @override
  String get orderStatusDelivered => 'Доставлен';

  @override
  String get orderStatusShipping => 'В пути';

  @override
  String get orderStatusCancelled => 'Отменён';

  @override
  String get orderNumber => 'Номер заказа';

  @override
  String get orderDate => 'Дата';

  @override
  String get passwordChangedSuccess => 'Пароль успешно изменён';

  @override
  String get passwordsDoNotMatch => 'Пароли не совпадают';

  @override
  String get fieldCannotBeEmpty => 'Это поле не может быть пустым';

  @override
  String get passwordTooShort => 'Пароль должен содержать не менее 6 символов';

  @override
  String get saveChangesSuccess => 'Информация успешно сохранена';

  @override
  String languageSelectedMessage(Object language) {
    return 'Язык \"$language\" выбран';
  }

  @override
  String get currencyAFN => ' Афганский афгани';

  @override
  String get currencyTJS => 'Ѕ Таджикский сомони';

  @override
  String currencySelectedMessage(Object currency) {
    return 'Валюта \"$currency\" выбрана';
  }

  @override
  String get noOrdersMessage => 'Вы ещё не сделали ни одного заказа';

  @override
  String get orderDateLabel => 'Дата';

  @override
  String orderSelectedMessage(Object orderId) {
    return 'Заказ \"$orderId\" выбран';
  }

  @override
  String get savedAddressesTitle => 'Сохранённые адреса';

  @override
  String get noAddressesMessage => 'Вы ещё не сохранили ни одного адреса';

  @override
  String get addAddressButton => 'Добавить адрес';

  @override
  String get addAddressMessage => 'Добавить новый адрес';

  @override
  String get deleteAddressButton => 'Удалить адрес';

  @override
  String get addressDeletedMessage => 'Адрес удалён';

  @override
  String addressSelectedMessage(Object address) {
    return 'Адрес \"$address\" выбран';
  }

  @override
  String get favoritesTitle => 'Избранное';

  @override
  String get noFavoritesMessage => 'В избранном нет товаров';

  @override
  String get addToCartButton => 'Добавить в корзину';

  @override
  String productAddedToCartMessage(Object productName) {
    return '\"$productName\" добавлен в корзину';
  }
}
