import '../models/product.dart';
import '../models/cart_item.dart';

extension ProductToCartItem on Product {
  CartItem toCartItem({int quantity = 1}) {
  return CartItem(
    id: name,
    name: name,
    price: price.toDouble(),
    quantity: quantity,
    imageUrl: imageUrl, // ✅ اضافه شد
  );
}
}